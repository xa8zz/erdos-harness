from __future__ import annotations

import argparse
from collections import defaultdict
from dataclasses import dataclass
from itertools import combinations, product


Certificate = tuple[int, ...]
Target = tuple[int, ...]
UsefulShield = tuple[Target, int, Target]


@dataclass(frozen=True)
class ToyState:
    scored_stars: tuple[Target, ...]
    claims: tuple[Certificate, ...]


@dataclass(frozen=True)
class UsefulShieldEvent:
    shield: UsefulShield
    first_useful_round: int
    first_prime_round: int
    latest_pair_round: int
    latest_pair: Certificate
    has_fresh_pair_witness: bool
    has_fresh_degree_h_witness: bool


class OneCylinderToy:
    """Minimal arithmetic toy with one scored star-cylinder and lower defects."""

    def __init__(self, h: int, M: int):
        if not (3 <= h <= M):
            raise ValueError("require 3 <= h <= M")
        self.h = h
        self.M = M
        self.Y = tuple(range(1, M + 1))
        self.star_targets = tuple((0, *subset) for subset in combinations(self.Y, h - 1))
        self.residual_targets = tuple(combinations(self.Y, h))
        self.targets = self.star_targets + self.residual_targets

        certificates: set[Certificate] = set()
        for target in self.targets:
            for size in range(1, len(target)):
                certificates.update(combinations(target, size))
        self.certificates = tuple(sorted(certificates, key=lambda cert: (len(cert), cert)))

    def initial_state(self) -> ToyState:
        return ToyState(scored_stars=(), claims=())

    def live_targets(self, state: ToyState) -> tuple[Target, ...]:
        scored_set = set(state.scored_stars)
        claim_sets = [set(claim) for claim in state.claims]
        live: list[Target] = []
        for target in self.targets:
            if target in scored_set:
                continue
            target_set = set(target)
            if any(claim_set.issubset(target_set) for claim_set in claim_sets):
                continue
            live.append(target)
        return tuple(live)

    def legal_star_targets(self, state: ToyState) -> tuple[Target, ...]:
        live = set(self.live_targets(state))
        return tuple(target for target in self.star_targets if target in live)

    def certificate_unavailable(self, certificate: Certificate, state: ToyState) -> bool:
        certificate_set = set(certificate)
        if any(certificate_set.issubset(target) for target in state.scored_stars):
            return True
        for claim in state.claims:
            claim_set = set(claim)
            if claim_set.issubset(certificate_set) or certificate_set.issubset(claim_set):
                return True
        return False

    def legal_certificates(self, state: ToyState) -> tuple[Certificate, ...]:
        live = self.live_targets(state)
        legal: list[Certificate] = []
        for certificate in self.certificates:
            if self.certificate_unavailable(certificate, state):
                continue
            certificate_set = set(certificate)
            if any(certificate_set.issubset(target) for target in live):
                legal.append(certificate)
        return tuple(legal)

    def degree(self, certificate: Certificate, state: ToyState) -> int:
        certificate_set = set(certificate)
        return sum(1 for target in self.live_targets(state) if certificate_set.issubset(target))

    def sigma_star(self, state: ToyState) -> Certificate | None:
        legal = self.legal_certificates(state)
        if not legal:
            return None
        return max(
            legal,
            key=lambda certificate: (
                self.degree(certificate, state),
                -len(certificate),
                tuple(-value for value in certificate),
            ),
        )

    def play_round(self, state: ToyState, star_target: Target) -> ToyState:
        if star_target not in self.legal_star_targets(state):
            raise ValueError(f"illegal Prolonger star target: {star_target}")
        after_score = ToyState(
            scored_stars=(*state.scored_stars, star_target),
            claims=state.claims,
        )
        claim = self.sigma_star(after_score)
        if claim is None:
            return after_score
        return ToyState(
            scored_stars=after_score.scored_stars,
            claims=(*after_score.claims, claim),
        )

    def useful_residual_targets(self, state: ToyState) -> tuple[Target, ...]:
        live = set(self.live_targets(state))
        useful: list[Target] = []
        for target in self.residual_targets:
            if target not in live:
                continue
            all_blocked = True
            for size in range(1, len(target)):
                for certificate in combinations(target, size):
                    if not self.certificate_unavailable(certificate, state):
                        all_blocked = False
                        break
                if not all_blocked:
                    break
            if all_blocked:
                useful.append(target)
        return tuple(useful)

    def useful_shields(self, state: ToyState) -> tuple[UsefulShield, ...]:
        scored_set = set(state.scored_stars)
        shields: list[UsefulShield] = []
        for target in self.useful_residual_targets(state):
            for missing in target:
                facet = tuple(value for value in target if value != missing)
                witness = (0, *facet)
                if witness in scored_set:
                    shields.append((target, missing, witness))
        return tuple(shields)

    def same_prime_prehistory_counts(self, state: ToyState, target: Target) -> dict[int, int]:
        counts = {prime: 0 for prime in target}
        for star in state.scored_stars:
            for prime in target:
                if prime in star:
                    counts[prime] += 1
        return counts

    def fresh_witnesses(
        self,
        shield: UsefulShield,
        state: ToyState,
        exact_size: int | None = None,
        exact_defect: int | None = None,
        minimum_degree: int | None = None,
    ) -> tuple[tuple[Certificate, int], ...]:
        """Fresh proper-subset witnesses c ⊊ S for a useful shield of S."""

        target, _, _ = shield
        if exact_size is not None and exact_defect is not None:
            raise ValueError("use at most one of exact_size or exact_defect")
        if exact_defect is not None:
            exact_size = len(target) - exact_defect
        witnesses: list[tuple[Certificate, int]] = []
        for size in range(1, len(target)):
            if exact_size is not None and size != exact_size:
                continue
            for certificate in combinations(target, size):
                if self.certificate_unavailable(certificate, state):
                    continue
                degree = self.degree(certificate, state)
                if minimum_degree is None or degree >= minimum_degree:
                    witnesses.append((certificate, degree))
        return tuple(witnesses)


class ProductCellToy:
    """Product-cell toy: targets choose one point from each microcell."""

    def __init__(self, cell_sizes: tuple[int, ...]):
        if any(size <= 0 for size in cell_sizes):
            raise ValueError("cell sizes must be positive")
        self.h = len(cell_sizes)
        self.cell_sizes = cell_sizes

        next_point = 1
        cells: list[tuple[int, ...]] = []
        point_to_cell: dict[int, int] = {}
        for cell_index, size in enumerate(cell_sizes):
            points = tuple(range(next_point, next_point + size))
            for point in points:
                point_to_cell[point] = cell_index
            cells.append(points)
            next_point += size

        self.cells = tuple(cells)
        self.point_to_cell = point_to_cell
        self.targets = tuple(tuple(choice) for choice in product(*self.cells))

        certificates: set[Certificate] = set()
        for target in self.targets:
            for size in range(1, len(target)):
                certificates.update(combinations(target, size))
        self.certificates = tuple(sorted(certificates, key=lambda cert: (len(cert), cert)))

    def initial_state(self) -> ToyState:
        return ToyState(scored_stars=(), claims=())

    def live_targets(self, state: ToyState) -> tuple[Target, ...]:
        scored_set = set(state.scored_stars)
        claim_sets = [set(claim) for claim in state.claims]
        live: list[Target] = []
        for target in self.targets:
            if target in scored_set:
                continue
            target_set = set(target)
            if any(claim_set.issubset(target_set) for claim_set in claim_sets):
                continue
            live.append(target)
        return tuple(live)

    def legal_star_targets(self, state: ToyState) -> tuple[Target, ...]:
        return self.live_targets(state)

    def certificate_unavailable(self, certificate: Certificate, state: ToyState) -> bool:
        certificate_set = set(certificate)
        if any(certificate_set.issubset(target) for target in state.scored_stars):
            return True
        for claim in state.claims:
            claim_set = set(claim)
            if claim_set.issubset(certificate_set) or certificate_set.issubset(claim_set):
                return True
        return False

    def legal_certificates(self, state: ToyState) -> tuple[Certificate, ...]:
        live = self.live_targets(state)
        legal: list[Certificate] = []
        for certificate in self.certificates:
            if self.certificate_unavailable(certificate, state):
                continue
            certificate_set = set(certificate)
            if any(certificate_set.issubset(target) for target in live):
                legal.append(certificate)
        return tuple(legal)

    def degree(self, certificate: Certificate, state: ToyState) -> int:
        certificate_set = set(certificate)
        return sum(1 for target in self.live_targets(state) if certificate_set.issubset(target))

    def sigma_star(self, state: ToyState) -> Certificate | None:
        legal = self.legal_certificates(state)
        if not legal:
            return None
        return max(
            legal,
            key=lambda certificate: (
                self.degree(certificate, state),
                -len(certificate),
                tuple(-value for value in certificate),
            ),
        )

    def play_round(self, state: ToyState, star_target: Target) -> ToyState:
        if star_target not in self.legal_star_targets(state):
            raise ValueError(f"illegal Prolonger target: {star_target}")
        after_score = ToyState(
            scored_stars=(*state.scored_stars, star_target),
            claims=state.claims,
        )
        claim = self.sigma_star(after_score)
        if claim is None:
            return after_score
        return ToyState(
            scored_stars=after_score.scored_stars,
            claims=(*after_score.claims, claim),
        )

    def useful_residual_targets(self, state: ToyState) -> tuple[Target, ...]:
        live = set(self.live_targets(state))
        useful: list[Target] = []
        for target in self.targets:
            if target not in live:
                continue
            all_blocked = True
            for size in range(1, len(target)):
                for certificate in combinations(target, size):
                    if not self.certificate_unavailable(certificate, state):
                        all_blocked = False
                        break
                if not all_blocked:
                    break
            if all_blocked:
                useful.append(target)
        return tuple(useful)

    def useful_shields(self, state: ToyState) -> tuple[UsefulShield, ...]:
        shields: list[UsefulShield] = []
        for target in self.useful_residual_targets(state):
            target_set = set(target)
            for missing in target:
                cell = self.point_to_cell[missing]
                facet_set = target_set - {missing}
                witness: Target | None = None
                for scored in state.scored_stars:
                    scored_set = set(scored)
                    if not facet_set.issubset(scored_set):
                        continue
                    extra = tuple(scored_set - facet_set)
                    if len(extra) != 1:
                        continue
                    replacement = extra[0]
                    if replacement != missing and self.point_to_cell[replacement] == cell:
                        witness = scored
                        break
                if witness is not None:
                    shields.append((target, missing, witness))
        return tuple(shields)

    def same_prime_prehistory_counts(self, state: ToyState, target: Target) -> dict[int, int]:
        counts = {prime: 0 for prime in target}
        for scored in state.scored_stars:
            for prime in target:
                if prime in scored:
                    counts[prime] += 1
        return counts

    def fresh_witnesses(
        self,
        shield: UsefulShield,
        state: ToyState,
        exact_size: int | None = None,
        exact_defect: int | None = None,
        minimum_degree: int | None = None,
    ) -> tuple[tuple[Certificate, int], ...]:
        target, _, _ = shield
        if exact_size is not None and exact_defect is not None:
            raise ValueError("use at most one of exact_size or exact_defect")
        if exact_defect is not None:
            exact_size = len(target) - exact_defect
        witnesses: list[tuple[Certificate, int]] = []
        for size in range(1, len(target)):
            if exact_size is not None and size != exact_size:
                continue
            for certificate in combinations(target, size):
                if self.certificate_unavailable(certificate, state):
                    continue
                degree = self.degree(certificate, state)
                if minimum_degree is None or degree >= minimum_degree:
                    witnesses.append((certificate, degree))
        return tuple(witnesses)


class FastOneCylinderAudit:
    """Bitset-backed analyzer for larger one-cylinder cases."""

    def __init__(self, h: int, M: int):
        if not (3 <= h <= M):
            raise ValueError("require 3 <= h <= M")
        self.h = h
        self.M = M
        self.star_targets = tuple((0, *subset) for subset in combinations(range(1, M + 1), h - 1))
        self.residual_targets = tuple(combinations(range(1, M + 1), h))
        self.targets = self.star_targets + self.residual_targets
        self.star_count = len(self.star_targets)
        self.target_count = len(self.targets)
        self.residual_target_count = len(self.residual_targets)

        self.star_masks = tuple(self._mask(target) for target in self.star_targets)
        self.residual_masks = tuple(self._mask(target) for target in self.residual_targets)
        self.target_masks = self.star_masks + self.residual_masks
        self.star_index = {mask: index for index, mask in enumerate(self.star_masks)}
        self.residual_index = {mask: index for index, mask in enumerate(self.residual_masks)}

        certificates: set[int] = set()
        for target in self.target_masks:
            points = self._bits(target)
            for size in range(1, len(points)):
                certificates.update(self._mask(subset) for subset in combinations(points, size))
        self.cert_masks = tuple(sorted(certificates, key=lambda mask: (mask.bit_count(), self._bits(mask))))
        self.cert_index = {mask: index for index, mask in enumerate(self.cert_masks)}
        self.cert_tuples = tuple(self._bits(mask) for mask in self.cert_masks)
        self.cert_sizes = tuple(len(certificate) for certificate in self.cert_tuples)
        self.cert_tiebreak = tuple(tuple(-value for value in certificate) for certificate in self.cert_tuples)

        self.contains_targets: list[int] = []
        self.contained_in_stars: list[int] = []
        self.claim_conflicts: list[int] = []
        for cert_mask in self.cert_masks:
            target_bits = 0
            star_bits = 0
            for target_index, target_mask in enumerate(self.target_masks):
                if cert_mask & ~target_mask == 0:
                    target_bits |= 1 << target_index
                    if target_index < self.star_count:
                        star_bits |= 1 << target_index
            self.contains_targets.append(target_bits)
            self.contained_in_stars.append(star_bits)

        for cert_mask in self.cert_masks:
            conflicts = 0
            for other_index, other_mask in enumerate(self.cert_masks):
                if cert_mask & ~other_mask == 0 or other_mask & ~cert_mask == 0:
                    conflicts |= 1 << other_index
            self.claim_conflicts.append(conflicts)

        self.residual_subset_indices: list[tuple[int, ...]] = []
        self.witness_star_indices: list[dict[int, int]] = []
        for residual_mask in self.residual_masks:
            points = self._bits(residual_mask)
            subset_indices: list[int] = []
            witnesses: dict[int, int] = {}
            for size in range(1, len(points)):
                for subset in combinations(points, size):
                    subset_indices.append(self.cert_index[self._mask(subset)])
            for missing in points:
                facet = tuple(value for value in points if value != missing)
                witnesses[missing] = self.star_index[self._mask((0, *facet))]
            self.residual_subset_indices.append(tuple(subset_indices))
            self.witness_star_indices.append(witnesses)

    @staticmethod
    def _mask(values: tuple[int, ...]) -> int:
        mask = 0
        for value in values:
            mask |= 1 << value
        return mask

    @staticmethod
    def _bits(mask: int) -> tuple[int, ...]:
        values: list[int] = []
        value = 0
        while mask:
            if mask & 1:
                values.append(value)
            mask >>= 1
            value += 1
        return tuple(values)

    def initial_state(self) -> tuple[int, int, int]:
        return 0, 0, (1 << self.target_count) - 1

    def cert_unavailable(self, cert_index: int, scored_bits: int, claimed_bits: int) -> bool:
        return bool((self.contained_in_stars[cert_index] & scored_bits) or (self.claim_conflicts[cert_index] & claimed_bits))

    def sigma_star(self, scored_bits: int, claimed_bits: int, live_bits: int) -> int | None:
        best_index: int | None = None
        best_key: tuple[int, int, tuple[int, ...]] | None = None
        for cert_index in range(len(self.cert_masks)):
            if self.cert_unavailable(cert_index, scored_bits, claimed_bits):
                continue
            degree = (live_bits & self.contains_targets[cert_index]).bit_count()
            if degree == 0:
                continue
            key = (degree, -self.cert_sizes[cert_index], self.cert_tiebreak[cert_index])
            if best_key is None or key > best_key:
                best_index = cert_index
                best_key = key
        return best_index

    def play_round(self, state: tuple[int, int, int], star_index: int) -> tuple[int, int, int]:
        scored_bits, claimed_bits, live_bits = state
        if not ((live_bits >> star_index) & 1):
            raise ValueError(f"illegal star index: {star_index}")
        scored_bits |= 1 << star_index
        live_bits &= ~(1 << star_index)
        claim_index = self.sigma_star(scored_bits, claimed_bits, live_bits)
        if claim_index is None:
            return scored_bits, claimed_bits, live_bits
        claimed_bits |= 1 << claim_index
        live_bits &= ~self.contains_targets[claim_index]
        return scored_bits, claimed_bits, live_bits

    def useful_residual_indices(self, state: tuple[int, int, int]) -> tuple[int, ...]:
        scored_bits, claimed_bits, live_bits = state
        useful: list[int] = []
        for residual_index, subset_indices in enumerate(self.residual_subset_indices):
            target_index = self.star_count + residual_index
            if not ((live_bits >> target_index) & 1):
                continue
            if all(self.cert_unavailable(cert_index, scored_bits, claimed_bits) for cert_index in subset_indices):
                useful.append(residual_index)
        return tuple(useful)

    def useful_shields(self, state: tuple[int, int, int]) -> tuple[UsefulShield, ...]:
        scored_bits, _, _ = state
        shields: list[UsefulShield] = []
        for residual_index in self.useful_residual_indices(state):
            for missing, star_index in self.witness_star_indices[residual_index].items():
                if (scored_bits >> star_index) & 1:
                    shields.append((self.residual_targets[residual_index], missing, self.star_targets[star_index]))
        return tuple(shields)

    def fresh_witnesses(
        self,
        shield: UsefulShield,
        state: tuple[int, int, int],
        *,
        exact_size: int | None = None,
        exact_defect: int | None = None,
        minimum_degree: int | None = None,
    ) -> tuple[tuple[Certificate, int], ...]:
        target, _, _ = shield
        residual_index = self.residual_index[self._mask(target)]
        if exact_size is not None and exact_defect is not None:
            raise ValueError("use at most one of exact_size or exact_defect")
        if exact_defect is not None:
            exact_size = self.h - exact_defect
        scored_bits, claimed_bits, live_bits = state
        witnesses: list[tuple[Certificate, int]] = []
        for size in range(1, len(target)):
            if exact_size is not None and size != exact_size:
                continue
            for certificate in combinations(target, size):
                cert_index = self.cert_index[self._mask(certificate)]
                if self.cert_unavailable(cert_index, scored_bits, claimed_bits):
                    continue
                degree = (live_bits & self.contains_targets[cert_index]).bit_count()
                if minimum_degree is None or degree >= minimum_degree:
                    witnesses.append((certificate, degree))
        return tuple(witnesses)

    def greedy_sequence(self, *, clustered_dense_size: int | None = None) -> tuple[list[Target], list[tuple[int, int, int]]]:
        state = self.initial_state()
        sequence: list[Target] = []
        states = [state]
        while True:
            scored_bits, _, live_bits = state
            legal_stars = [index for index in range(self.star_count) if ((live_bits >> index) & 1) and not ((scored_bits >> index) & 1)]
            if not legal_stars:
                break
            best_index: int | None = None
            best_key: tuple[object, ...] | None = None
            best_state: tuple[int, int, int] | None = None
            for star_index in legal_stars:
                candidate_state = self.play_round(state, star_index)
                useful_count = len(self.useful_residual_indices(candidate_state))
                if clustered_dense_size is None:
                    key = (
                        useful_count,
                        tuple(-value for value in self.star_targets[star_index]),
                    )
                else:
                    dense_count = sum(1 for value in self.star_targets[star_index] if 0 < value <= clustered_dense_size)
                    dense_pairs = dense_count * (dense_count - 1) // 2
                    key = (
                        dense_pairs,
                        dense_count,
                        useful_count,
                        tuple(-value for value in self.star_targets[star_index]),
                    )
                if best_key is None or key > best_key:
                    best_key = key
                    best_index = star_index
                    best_state = candidate_state
            if best_index is None or best_state is None:
                break
            sequence.append(self.star_targets[best_index])
            state = best_state
            states.append(state)
        return sequence, states


def greedy_useful_sequence(toy: OneCylinderToy | ProductCellToy) -> tuple[list[Target], list[ToyState]]:
    state = toy.initial_state()
    sequence: list[Target] = []
    states = [state]
    while True:
        legal_targets = toy.legal_star_targets(state)
        if not legal_targets:
            break
        best_target = max(
            legal_targets,
            key=lambda target: (
                len(toy.useful_residual_targets(toy.play_round(state, target))),
                tuple(-value for value in target),
            ),
        )
        state = toy.play_round(state, best_target)
        sequence.append(best_target)
        states.append(state)
    return sequence, states


def greedy_useful_residual_sequence(h: int, M: int) -> tuple[OneCylinderToy, list[Target], list[ToyState]]:
    """Closure-seeking Prolonger against deterministic sigma* in the toy model."""

    toy = OneCylinderToy(h, M)
    sequence, states = greedy_useful_sequence(toy)
    return toy, sequence, states


def first_shield_round(certificate: Certificate, scored_targets: tuple[Target, ...]) -> int | None:
    certificate_set = set(certificate)
    for index, target in enumerate(scored_targets, start=1):
        if certificate_set.issubset(target):
            return index
    return None


def first_appearance_rounds(scored_targets: tuple[Target, ...]) -> dict[int, int]:
    rounds: dict[int, int] = {}
    for index, target in enumerate(scored_targets, start=1):
        for point in target:
            if point == 0:
                continue
            rounds.setdefault(point, index)
    return rounds


def useful_shield_first_events(
    toy: OneCylinderToy | ProductCellToy | FastOneCylinderAudit,
    states: list[ToyState] | list[tuple[int, int, int]],
    *,
    exact_defect: int | None = None,
    minimum_degree: int,
    scored_targets: tuple[Target, ...] | None = None,
) -> list[UsefulShieldEvent]:
    if not states:
        return []
    if scored_targets is None:
        last_state = states[-1]
        if not isinstance(last_state, ToyState):
            raise ValueError("scored_targets is required for bitset states")
        scored_targets = last_state.scored_stars

    first_prime_round = first_appearance_rounds(scored_targets)
    seen_shields: set[UsefulShield] = set()
    events: list[UsefulShieldEvent] = []
    for round_index, state in enumerate(states[1:], start=1):
        for shield in toy.useful_shields(state):
            if shield in seen_shields:
                continue
            seen_shields.add(shield)

            target, missing, _ = shield
            latest_round = 0
            latest_pairs: list[Certificate] = []
            ok = True
            for point in target:
                if point == missing:
                    continue
                pair = tuple(sorted((missing, point)))
                pair_round = first_shield_round(pair, scored_targets)
                if pair_round is None:
                    ok = False
                    break
                if pair_round > latest_round:
                    latest_round = pair_round
                    latest_pairs = [pair]
                elif pair_round == latest_round:
                    latest_pairs.append(pair)
            if not ok or latest_round == 0:
                continue

            fresh_pairs = toy.fresh_witnesses(shield, state, exact_size=2)
            events.append(
                UsefulShieldEvent(
                    shield=shield,
                    first_useful_round=round_index,
                    first_prime_round=first_prime_round[missing],
                    latest_pair_round=latest_round,
                    latest_pair=min(latest_pairs),
                    has_fresh_pair_witness=bool(fresh_pairs),
                    has_fresh_degree_h_witness=bool(
                        toy.fresh_witnesses(
                            shield,
                            state,
                            exact_defect=exact_defect,
                            minimum_degree=minimum_degree,
                        )
                    ),
                )
            )
    return events


def pair_first_charge_multiplicities(
    events_or_toy: list[UsefulShieldEvent] | OneCylinderToy | ProductCellToy | FastOneCylinderAudit,
    state: ToyState | tuple[int, int, int] | None = None,
    *,
    scored_targets: tuple[Target, ...] | None = None,
) -> tuple[dict[int, int], int]:
    charges: dict[int, int] = defaultdict(int)
    if isinstance(events_or_toy, list):
        for event in events_or_toy:
            if not event.has_fresh_pair_witness:
                charges[event.latest_pair_round] += 1
        return dict(charges), 0

    if state is None:
        raise ValueError("state is required when charging directly from a toy state")
    if scored_targets is None:
        if not isinstance(state, ToyState):
            raise ValueError("scored_targets is required for bitset states")
        scored_targets = state.scored_stars

    for shield in events_or_toy.useful_shields(state):
        if events_or_toy.fresh_witnesses(shield, state, exact_size=2):
            continue
        target, missing, _ = shield
        latest_round = 0
        ok = True
        for point in target:
            if point == missing:
                continue
            pair = tuple(sorted((missing, point)))
            round_index = first_shield_round(pair, scored_targets)
            if round_index is None:
                ok = False
                break
            latest_round = max(latest_round, round_index)
        if not ok or latest_round == 0:
            continue
        charges[latest_round] += 1
    return dict(charges), 0


def first_appearance_charge_multiplicities(
    events_or_toy: list[UsefulShieldEvent] | OneCylinderToy | ProductCellToy | FastOneCylinderAudit,
    state: ToyState | tuple[int, int, int] | None = None,
    *,
    defect: int | None = None,
    minimum_degree: int | None = None,
    scored_targets: tuple[Target, ...] | None = None,
) -> tuple[dict[int, int], int]:
    charges: dict[int, int] = defaultdict(int)
    if isinstance(events_or_toy, list):
        for event in events_or_toy:
            if not event.has_fresh_degree_h_witness:
                charges[event.first_prime_round] += 1
        return dict(charges), 0

    if state is None:
        raise ValueError("state is required when charging directly from a toy state")
    if defect is None or minimum_degree is None:
        raise ValueError("defect and minimum_degree are required for direct charge computation")
    if scored_targets is None:
        if not isinstance(state, ToyState):
            raise ValueError("scored_targets is required for bitset states")
        scored_targets = state.scored_stars

    first_round = first_appearance_rounds(scored_targets)
    for shield in events_or_toy.useful_shields(state):
        if events_or_toy.fresh_witnesses(shield, state, exact_defect=defect, minimum_degree=minimum_degree):
            continue
        _, missing, _ = shield
        round_index = first_round.get(missing)
        if round_index is None:
            continue
        charges[round_index] += 1
    return dict(charges), 0


def analyze_useful_shield_multiplicity(
    toy: OneCylinderToy | ProductCellToy | FastOneCylinderAudit,
    sequence: list[Target],
    states: list[ToyState] | list[tuple[int, int, int]],
    minimum_degree: int,
) -> dict[str, object]:
    scored_targets = tuple(sequence)
    events = useful_shield_first_events(
        toy,
        states,
        minimum_degree=minimum_degree,
        scored_targets=scored_targets,
    )
    pair_charges, pair_skipped = pair_first_charge_multiplicities(events)
    prime_charges, prime_skipped = first_appearance_charge_multiplicities(events)
    max_pair_charge, _ = summarize_charges(pair_charges)
    max_prime_charge, _ = summarize_charges(prime_charges)
    return {
        "events": events,
        "first_useful_shield_count": len(events),
        "no_fresh_pair_shield_count": sum(not event.has_fresh_pair_witness for event in events),
        "no_fresh_degree_h_shield_count": sum(not event.has_fresh_degree_h_witness for event in events),
        "pair_charge_counts": pair_charges,
        "prime_charge_counts": prime_charges,
        "pair_skipped": pair_skipped,
        "prime_skipped": prime_skipped,
        "max_pair_charge": max_pair_charge,
        "max_prime_charge": max_prime_charge,
        "mean_pair_charge": summarize_charges(pair_charges)[1],
        "mean_prime_charge": summarize_charges(prime_charges)[1],
        "pair_charge_mean_per_shield": charge_mean_per_shield(pair_charges),
        "prime_charge_mean_per_shield": charge_mean_per_shield(prime_charges),
    }


def summarize_charges(charges: dict[int, int]) -> tuple[int, float]:
    if not charges:
        return 0, 0.0
    values = tuple(charges.values())
    return max(values), sum(values) / len(values)


def charge_mean_per_shield(charges: dict[int, int]) -> float:
    if not charges:
        return 0.0
    values = tuple(charges.values())
    total = sum(values)
    return sum(value * value for value in values) / total


def balanced_cell_sizes(h: int, total_points: int) -> tuple[int, ...]:
    if total_points < h:
        raise ValueError("total points must be at least h")
    base, extra = divmod(total_points, h)
    return tuple(base + (1 if index < extra else 0) for index in range(h))


def clustered_cell_sizes(h: int, total_points: int) -> tuple[int, ...]:
    if total_points < h:
        raise ValueError("total points must be at least h")
    return (total_points - h + 1,) + (1,) * (h - 1)


def parse_cases(raw: str) -> list[tuple[int, int]]:
    cases: list[tuple[int, int]] = []
    for piece in raw.split(","):
        h_raw, m_raw = piece.split(":")
        cases.append((int(h_raw), int(m_raw)))
    return cases


def parse_defects(raw: str) -> list[int]:
    return [int(piece.strip()) for piece in raw.split(",") if piece.strip()]


def build_variant(
    h: int,
    size_parameter: int,
    variant: str,
) -> tuple[OneCylinderToy | ProductCellToy | FastOneCylinderAudit, str, list[Target], list[ToyState | tuple[int, int, int]]]:
    if variant == "one-cylinder":
        toy = FastOneCylinderAudit(h, size_parameter)
        detail = f"M={size_parameter}"
        sequence, states = toy.greedy_sequence()
    elif variant == "balanced":
        cell_sizes = balanced_cell_sizes(h, size_parameter)
        toy = ProductCellToy(cell_sizes)
        detail = f"cell_sizes={cell_sizes}"
        sequence, states = greedy_useful_sequence(toy)
    elif variant == "clustered":
        cell_sizes = clustered_cell_sizes(h, size_parameter)
        toy = ProductCellToy(cell_sizes)
        detail = f"cell_sizes={cell_sizes}"
        sequence, states = greedy_useful_sequence(toy)
    else:
        raise ValueError(f"unknown variant {variant}")
    return toy, detail, sequence, states

def run_case(
    h: int,
    size_parameter: int,
    variant: str,
    defects: tuple[int, ...],
) -> list[str]:
    toy, detail, sequence, states = build_variant(h, size_parameter, variant)
    pair_events = useful_shield_first_events(
        toy,
        states,
        minimum_degree=h,
        scored_targets=tuple(sequence),
    )
    pair_charges, pair_skipped = pair_first_charge_multiplicities(pair_events)
    pair_bad = sum(not event.has_fresh_pair_witness for event in pair_events)
    pair_max, pair_mean = summarize_charges(pair_charges)
    pair_mean_per_shield = charge_mean_per_shield(pair_charges)

    lines = [
        (
            f"h={h} {detail} scored={len(sequence)} useful_shields={len(pair_events)} "
            f"pair_bad={pair_bad} pair_max={pair_max} pair_mean={pair_mean:.3f} "
            f"pair_mean_per_shield={pair_mean_per_shield:.3f} pair_skipped={pair_skipped}"
        )
    ]

    for defect in defects:
        bad_events = useful_shield_first_events(
            toy,
            states,
            exact_defect=defect,
            minimum_degree=h,
            scored_targets=tuple(sequence),
        )
        bad_charges, bad_skipped = first_appearance_charge_multiplicities(bad_events)
        bad_count = sum(not event.has_fresh_degree_h_witness for event in bad_events)
        bad_max, bad_mean = summarize_charges(bad_charges)
        bad_mean_per_shield = charge_mean_per_shield(bad_charges)
        lines.append(
            (
                f"  M_{defect}(h): bad={bad_count} max={bad_max} mean={bad_mean:.3f} "
                f"mean_per_shield={bad_mean_per_shield:.3f} skipped={bad_skipped}"
            )
        )
    return lines


def main() -> None:
    parser = argparse.ArgumentParser(description="Freshness toy multiplicity audit.")
    parser.add_argument(
        "--cases",
        default="4:14,5:14,6:12,4:20,5:20",
        help="Comma-separated h:M cases",
    )
    parser.add_argument(
        "--variants",
        default="one-cylinder,balanced,clustered",
        help="Comma-separated variants: one-cylinder, balanced, clustered",
    )
    parser.add_argument(
        "--defects",
        default="1,2",
        help="Comma-separated defect values k for M_k(h)",
    )
    args = parser.parse_args()
    defects = tuple(parse_defects(args.defects))

    for variant in [item.strip() for item in args.variants.split(",") if item.strip()]:
        print(f"[{variant}]")
        for h, size_parameter in parse_cases(args.cases):
            for line in run_case(h, size_parameter, variant, defects):
                print(line)


if __name__ == "__main__":
    main()
