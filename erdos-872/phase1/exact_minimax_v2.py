from __future__ import annotations

import argparse
import csv
import math
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Sequence, Tuple


def _is_prime(value: int) -> bool:
    if value < 2:
        return False
    if value % 2 == 0:
        return value == 2
    limit = int(math.isqrt(value))
    for divisor in range(3, limit + 1, 2):
        if value % divisor == 0:
            return False
    return True


@dataclass(frozen=True)
class PositionResult:
    total_moves_from_here: int
    best_move: int | None


class ExactSolverV2:
    """Exact minimax for the divisibility-antichain game.

    State representation:
    - `played_mask` is a bitmask over the values {2, 3, ..., n}.
    - bit i corresponds to the value `i + 2`.

    Normal play:
    - Prolonger moves first and maximizes the total remaining move count.
    - Shortener minimizes the total remaining move count.
    - The game ends exactly when there is no legal move left.

    Move legality:
    - A move x is legal iff x has not been played and x is incomparable by
      divisibility with every already-played value.

    Move ordering for alpha-beta:
    - Prolonger explores upper-half moves first, then higher-conflict moves.
    - Shortener explores lower-half primes first, then lower moves, then
      higher-conflict moves.
    - This ordering only affects pruning speed. Reported principal variations
      are reconstructed afterwards from exact child values.
    """

    def __init__(self, n: int):
        if n < 2:
            raise ValueError("n must be at least 2")
        self.n = n
        self.values = list(range(2, n + 1))
        self.size = len(self.values)
        self.index_of = {value: index for index, value in enumerate(self.values)}
        self.lower_cutoff = n // 2
        self.lower_values = tuple(value for value in self.values if value <= self.lower_cutoff)
        self.upper_values = tuple(value for value in self.values if value > self.lower_cutoff)
        self.conflict_masks = self._build_conflict_masks()
        self.degree = tuple(mask.bit_count() - 1 for mask in self.conflict_masks)
        self.prime_flags = tuple(_is_prime(value) for value in self.values)
        self.transposition: Dict[Tuple[int, bool], PositionResult] = {}
        self.legal_cache: Dict[int, Tuple[int, ...]] = {}

    def _build_conflict_masks(self) -> Tuple[int, ...]:
        masks = [0] * self.size
        for left_index, left_value in enumerate(self.values):
            mask = 1 << left_index
            for right_index, right_value in enumerate(self.values):
                if left_index == right_index:
                    continue
                if left_value % right_value == 0 or right_value % left_value == 0:
                    mask |= 1 << right_index
            masks[left_index] = mask
        return tuple(masks)

    def legal_moves(self, played_mask: int) -> Tuple[int, ...]:
        cached = self.legal_cache.get(played_mask)
        if cached is not None:
            return cached
        legal: List[int] = []
        for index, value in enumerate(self.values):
            if played_mask & (1 << index):
                continue
            if played_mask & self.conflict_masks[index]:
                continue
            legal.append(value)
        result = tuple(legal)
        self.legal_cache[played_mask] = result
        return result

    def ordered_moves(self, played_mask: int, prolonger_turn: bool) -> Tuple[int, ...]:
        legal = self.legal_moves(played_mask)
        if prolonger_turn:
            return tuple(
                sorted(
                    legal,
                    key=lambda value: (
                        0 if value > self.lower_cutoff else 1,
                        -self.degree[self.index_of[value]],
                        -len(self._legal_conflicts_with_move(played_mask, value)),
                        value,
                    ),
                )
            )
        return tuple(
            sorted(
                legal,
                key=lambda value: (
                    0 if (value <= self.lower_cutoff and _is_prime(value)) else 1,
                    0 if value <= self.lower_cutoff else 1,
                    -self.degree[self.index_of[value]],
                    value,
                ),
            )
        )

    def _legal_conflicts_with_move(self, played_mask: int, move: int) -> Tuple[int, ...]:
        move_index = self.index_of[move]
        conflicts = self.conflict_masks[move_index]
        return tuple(
            value
            for value in self.legal_moves(played_mask)
            if value != move and (conflicts & (1 << self.index_of[value]))
        )

    def solve_position(self, played_mask: int, prolonger_turn: bool, alpha: int, beta: int) -> int:
        cached = self.transposition.get((played_mask, prolonger_turn))
        if cached is not None:
            return cached.total_moves_from_here

        legal = self.ordered_moves(played_mask, prolonger_turn)
        if not legal:
            self.transposition[(played_mask, prolonger_turn)] = PositionResult(0, None)
            return 0

        best_move: int | None = None
        cut = False
        if prolonger_turn:
            value = -1
            for move in legal:
                child_mask = played_mask | (1 << self.index_of[move])
                child_value = 1 + self.solve_position(child_mask, False, alpha - 1, beta - 1)
                if child_value > value:
                    value = child_value
                    best_move = move
                alpha = max(alpha, value)
                if alpha >= beta:
                    cut = True
                    break
        else:
            value = self.size + 1
            for move in legal:
                child_mask = played_mask | (1 << self.index_of[move])
                child_value = 1 + self.solve_position(child_mask, True, alpha - 1, beta - 1)
                if child_value < value:
                    value = child_value
                    best_move = move
                beta = min(beta, value)
                if alpha >= beta:
                    cut = True
                    break

        if not cut:
            self.transposition[(played_mask, prolonger_turn)] = PositionResult(value, best_move)
        return value

    def exact_choice(self, played_mask: int, prolonger_turn: bool) -> PositionResult:
        legal = self.ordered_moves(played_mask, prolonger_turn)
        if not legal:
            return PositionResult(0, None)
        best_move: int | None = None
        if prolonger_turn:
            best_value = -1
            for move in legal:
                child_mask = played_mask | (1 << self.index_of[move])
                child_value = 1 + self.solve_position(child_mask, False, -1, self.size + 1)
                if child_value > best_value:
                    best_value = child_value
                    best_move = move
        else:
            best_value = self.size + 1
            for move in legal:
                child_mask = played_mask | (1 << self.index_of[move])
                child_value = 1 + self.solve_position(child_mask, True, -1, self.size + 1)
                if child_value < best_value:
                    best_value = child_value
                    best_move = move
        return PositionResult(best_value, best_move)

    def principal_variation(self) -> List[int]:
        variation: List[int] = []
        played_mask = 0
        prolonger_turn = True
        while True:
            position = self.exact_choice(played_mask, prolonger_turn)
            if position.best_move is None:
                break
            variation.append(position.best_move)
            played_mask |= 1 << self.index_of[position.best_move]
            prolonger_turn = not prolonger_turn
        return variation

    def solve(self) -> Dict[str, object]:
        total = self.solve_position(0, True, -1, self.size + 1)
        principal_variation = self.principal_variation()
        return {
            "n": self.n,
            "L_n": total,
            "first_move": principal_variation[0] if principal_variation else None,
            "principal_variation": principal_variation,
            "positions_evaluated": len(self.transposition),
        }


def _brute_force_conflicts(n: int) -> Dict[int, Tuple[int, ...]]:
    values = range(2, n + 1)
    conflicts: Dict[int, Tuple[int, ...]] = {}
    for value in values:
        blocked = []
        for other in values:
            if value == other:
                blocked.append(other)
                continue
            if value % other == 0 or other % value == 0:
                blocked.append(other)
        conflicts[value] = tuple(blocked)
    return conflicts


def brute_force_minimax(n: int) -> Dict[str, object]:
    conflicts = _brute_force_conflicts(n)
    values = tuple(range(2, n + 1))
    cache: Dict[Tuple[frozenset[int], bool], Tuple[int, int | None]] = {}

    def legal_moves(played: frozenset[int]) -> Tuple[int, ...]:
        legal: List[int] = []
        for value in values:
            if value in played:
                continue
            if any(other in played for other in conflicts[value]):
                continue
            legal.append(value)
        return tuple(legal)

    def solve(played: frozenset[int], prolonger_turn: bool) -> Tuple[int, int | None]:
        key = (played, prolonger_turn)
        cached = cache.get(key)
        if cached is not None:
            return cached
        legal = legal_moves(played)
        if not legal:
            cache[key] = (0, None)
            return cache[key]
        if prolonger_turn:
            best_value = -1
            best_move = None
            for move in legal:
                child_value, _ = solve(played | {move}, False)
                child_value += 1
                if child_value > best_value:
                    best_value = child_value
                    best_move = move
        else:
            best_value = len(values) + 1
            best_move = None
            for move in legal:
                child_value, _ = solve(played | {move}, True)
                child_value += 1
                if child_value < best_value:
                    best_value = child_value
                    best_move = move
        cache[key] = (best_value, best_move)
        return cache[key]

    total, _ = solve(frozenset(), True)
    variation: List[int] = []
    played = frozenset()
    prolonger_turn = True
    while True:
        _, move = cache[(played, prolonger_turn)]
        if move is None:
            break
        variation.append(move)
        played = played | {move}
        prolonger_turn = not prolonger_turn
    return {"n": n, "L_n": total, "first_move": variation[0] if variation else None, "principal_variation": variation}


class LegacyExactReplay:
    """Faithful replay of the Phase 1 exact solver for diagnostics only."""

    def __init__(self, n: int):
        self.n = n
        self.values = list(range(2, n + 1))
        self.size = len(self.values)
        self.index_of = {value: index for index, value in enumerate(self.values)}
        self.lower_cutoff = n // 2
        self.lower_values = {value for value in self.values if value <= self.lower_cutoff}
        self.upper_values = {value for value in self.values if value > self.lower_cutoff}
        self.primes = {value for value in self.values if _is_prime(value)}
        self.ban_masks = self._build_ban_masks()
        self.degrees = self._build_degrees()
        self.pb_score = self._build_prime_block_scores()
        self.cache: Dict[Tuple[int, bool], int] = {}
        self.best_move: Dict[Tuple[int, bool], int | None] = {}
        self.full_mask = (1 << self.size) - 1

    def _build_ban_masks(self) -> List[int]:
        masks = [0] * self.size
        for index, value in enumerate(self.values):
            mask = 1 << index
            for other in range(value * 2, self.n + 1, value):
                mask |= 1 << self.index_of[other]
            for divisor in range(2, value):
                if value % divisor == 0:
                    mask |= 1 << self.index_of[divisor]
            masks[index] = mask
        return masks

    def _build_degrees(self) -> List[int]:
        degrees = [0] * self.size
        for index, mask in enumerate(self.ban_masks):
            degrees[index] = mask.bit_count() - 1
        return degrees

    def _build_prime_block_scores(self) -> List[int]:
        scores = [0] * self.size
        for index, value in enumerate(self.values):
            score = 0
            for prime in self.primes:
                if prime <= self.lower_cutoff and value % prime == 0:
                    score += 1
            scores[index] = score
        return scores

    def legal_values_from_mask(self, legal_mask: int) -> List[int]:
        return [value for index, value in enumerate(self.values) if legal_mask & (1 << index)]

    def move_order(self, legal_mask: int, prolonger_turn: bool) -> List[int]:
        legal_values = self.legal_values_from_mask(legal_mask)
        if prolonger_turn:
            uppers = [value for value in legal_values if value in self.upper_values]
            lowers = [value for value in legal_values if value in self.lower_values]
            ordered = sorted(
                uppers,
                key=lambda value: (
                    -self.pb_score[self.index_of[value]],
                    -self.degrees[self.index_of[value]],
                    value,
                ),
            )
            ordered.extend(
                sorted(
                    lowers,
                    key=lambda value: (
                        -self.pb_score[self.index_of[value]],
                        -self.degrees[self.index_of[value]],
                        value,
                    ),
                )
            )
            return ordered
        lower_primes = [value for value in legal_values if value in self.lower_values and value in self.primes]
        if lower_primes:
            return sorted(lower_primes)
        return sorted(
            legal_values,
            key=lambda value: (
                -self.degrees[self.index_of[value]],
                value,
            ),
        )

    def solve_position(self, legal_mask: int, prolonger_turn: bool, alpha: int, beta: int) -> int:
        key = (legal_mask, prolonger_turn)
        cached = self.cache.get(key)
        if cached is not None:
            return cached
        if legal_mask == 0:
            self.cache[key] = 0
            self.best_move[key] = None
            return 0
        ordered = self.move_order(legal_mask, prolonger_turn)
        cut = False
        if prolonger_turn:
            value = 0
            move_choice: int | None = None
            for move in ordered:
                child_mask = legal_mask & ~self.ban_masks[self.index_of[move]]
                child_value = 1 + self.solve_position(child_mask, False, alpha, beta)
                if child_value > value:
                    value = child_value
                    move_choice = move
                alpha = max(alpha, value)
                if alpha >= beta:
                    cut = True
                    break
        else:
            value = self.size
            move_choice = None
            for move in ordered:
                child_mask = legal_mask & ~self.ban_masks[self.index_of[move]]
                child_value = 1 + self.solve_position(child_mask, True, alpha, beta)
                if child_value < value:
                    value = child_value
                    move_choice = move
                beta = min(beta, value)
                if alpha >= beta:
                    cut = True
                    break
        if not cut:
            self.cache[key] = value
            self.best_move[key] = move_choice
        return value

    def solve(self) -> Dict[str, object]:
        total, first_move = self.optimal_choice(self.full_mask, True, 0, self.size)
        variation = self.principal_variation()
        return {
            "n": self.n,
            "L_n": total,
            "first_move": first_move,
            "principal_variation": variation,
            "positions_evaluated": len(self.cache),
        }

    def optimal_choice(self, legal_mask: int, prolonger_turn: bool, alpha: int, beta: int) -> Tuple[int, int | None]:
        ordered = self.move_order(legal_mask, prolonger_turn)
        if not ordered:
            return 0, None
        if prolonger_turn:
            best_value = -1
            best_move = None
            local_alpha = alpha
            for move in ordered:
                child_mask = legal_mask & ~self.ban_masks[self.index_of[move]]
                value = 1 + self.solve_position(child_mask, False, local_alpha, beta)
                if value > best_value or (value == best_value and (best_move is None or move < best_move)):
                    best_value = value
                    best_move = move
                if value > local_alpha:
                    local_alpha = value
            return best_value, best_move
        best_value = self.size + 1
        best_move = None
        local_beta = beta
        for move in ordered:
            child_mask = legal_mask & ~self.ban_masks[self.index_of[move]]
            value = 1 + self.solve_position(child_mask, True, alpha, local_beta)
            if value < best_value or (value == best_value and (best_move is None or move < best_move)):
                best_value = value
                best_move = move
            if value < local_beta:
                local_beta = value
        return best_value, best_move

    def principal_variation(self) -> List[int]:
        variation: List[int] = []
        legal_mask = self.full_mask
        prolonger_turn = True
        while legal_mask:
            _, move = self.optimal_choice(legal_mask, prolonger_turn, 0, self.size)
            if move is None:
                break
            variation.append(move)
            legal_mask &= ~self.ban_masks[self.index_of[move]]
            prolonger_turn = not prolonger_turn
        return variation


def load_existing_exact_table(csv_path: Path) -> Dict[int, Dict[str, object]]:
    with csv_path.open(newline="") as handle:
        reader = csv.DictReader(handle)
        return {
            int(row["n"]): {
                "L_n": int(row["L_n"]),
                "first_move": int(row["first_move"]) if row["first_move"] else None,
                "elapsed_sec": float(row["elapsed_sec"]) if row.get("elapsed_sec") else None,
            }
            for row in reader
        }


def compare_against_csv(csv_path: Path, limit: int) -> List[Dict[str, object]]:
    existing = load_existing_exact_table(csv_path)
    rows: List[Dict[str, object]] = []
    for n in range(2, limit + 1):
        solver = ExactSolverV2(n)
        result = solver.solve()
        prior = existing.get(n)
        rows.append(
            {
                "n": n,
                "new_L_n": result["L_n"],
                "new_first_move": result["first_move"],
                "old_L_n": None if prior is None else prior["L_n"],
                "old_first_move": None if prior is None else prior["first_move"],
                "matches": prior is not None and prior["L_n"] == result["L_n"],
            }
        )
    return rows


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Run the independent exact minimax solver.")
    parser.add_argument("--n", type=int, help="Single n to solve.")
    parser.add_argument("--compare-csv", type=Path, help="Compare solver output to an existing exact_minimax.csv.")
    parser.add_argument("--limit", type=int, default=32, help="Upper limit for CSV comparison.")
    parser.add_argument("--legacy", action="store_true", help="Use the legacy replay solver instead of v2.")
    args = parser.parse_args(argv)

    if args.n is not None:
        solver = LegacyExactReplay(args.n) if args.legacy else ExactSolverV2(args.n)
        result = solver.solve()
        print(result)

    if args.compare_csv is not None:
        for row in compare_against_csv(args.compare_csv, args.limit):
            print(row)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
