from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations


Certificate = tuple[int, ...]
Target = tuple[int, ...]
UsefulShield = tuple[Target, int, Target]


@dataclass(frozen=True)
class ToyState:
    scored_stars: tuple[Target, ...]
    claims: tuple[Certificate, ...]


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

    def fresh_witnesses(
        self,
        shield: UsefulShield,
        state: ToyState,
        minimum_degree: int | None = None,
    ) -> tuple[tuple[Certificate, int], ...]:
        """Fresh proper-subset witnesses c ⊊ S for a useful shield of S."""

        target, _, _ = shield
        witnesses: list[tuple[Certificate, int]] = []
        for size in range(1, len(target)):
            for certificate in combinations(target, size):
                if self.certificate_unavailable(certificate, state):
                    continue
                degree = self.degree(certificate, state)
                if minimum_degree is None or degree >= minimum_degree:
                    witnesses.append((certificate, degree))
        return tuple(witnesses)


def greedy_useful_residual_sequence(h: int, M: int) -> tuple[OneCylinderToy, list[Target], list[ToyState]]:
    """Closure-seeking Prolonger against deterministic sigma* in the toy model."""

    toy = OneCylinderToy(h, M)
    state = toy.initial_state()
    sequence: list[Target] = []
    states = [state]
    while True:
        legal_stars = toy.legal_star_targets(state)
        if not legal_stars:
            break
        best_target = max(
            legal_stars,
            key=lambda target: (
                len(toy.useful_residual_targets(toy.play_round(state, target))),
                tuple(-value for value in target),
            ),
        )
        state = toy.play_round(state, best_target)
        sequence.append(best_target)
        states.append(state)
    return toy, sequence, states
