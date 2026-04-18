import RequestProject.Shortener.Defs
import RequestProject.Shortener.Compression
import RequestProject.Shortener.Sieve
import RequestProject.Shortener.MainTheorem

/-!
# Divisibility-Antichain Saturation Game: L(n) ≤ 13/36 n + o(n)

This project formalizes the proof from `shortener_13_36_v2.tex` that the
game value of the divisibility-antichain saturation game satisfies
L(n) ≤ 13/36 · n + o(n).

## File structure

- `Defs.lean` — Core definitions: divisibility antichains, D-free integers,
  odd part, counting function N_D(n), game setup.
- `Compression.lean` — The compression lemma (Lemma 2): the odd-part map
  φ(x) = x/2^v₂(x) is injective on divisibility antichains, giving
  |A| ≤ N_D(n) for D-free antichains.
- `Sieve.lean` — The sieve bound (Lemma 3): the second-order Bonferroni
  inequality gives N_D(n) ≤ 13/36 · n + (|D|+1)² when ∑ 1/q ≥ 1/3.
- `MainTheorem.lean` — The main theorem combining all pieces.
-/
