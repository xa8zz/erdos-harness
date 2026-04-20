import Mathlib

open scoped BigOperators
open Finset

noncomputable section

namespace RequestProject.T2Finite

/-- A finite weighted 3-uniform hypergraph-like system for the scored slot-game core. -/
structure HyperSystem (V E : Type) [DecidableEq V] [DecidableEq E] where
  verts : E → Finset V
  verts_card_three : ∀ e, (verts e).card = 3
  weight : E → ℕ

/-- State of the finite scored 3-uniform capture game. -/
structure HyperState (V E : Type) [DecidableEq V] [DecidableEq E] where
  captured : Finset V := ∅
  scored : Finset E := ∅
  deletedVerts : Finset V := ∅

variable {V E : Type} [DecidableEq V] [Fintype V] [DecidableEq E] [Fintype E]

/-- A hyperedge is live if it is not already scored and it avoids the deleted vertices. -/
def liveHyperEdge (H : HyperSystem V E) (s : HyperState V E) (e : E) : Prop :=
  e ∉ s.scored ∧ Disjoint (H.verts e) s.deletedVerts

/-- Number of captured vertices of a hyperedge. -/
def hyperCapturedCount (H : HyperSystem V E) (s : HyperState V E) (e : E) : ℕ :=
  ((H.verts e) ∩ s.captured).card

/-- Scaled potential for a live hyperedge. Coefficients are `1,2,4,8` for `0,1,2,3` captured vertices. -/
def hyperEdgePot (H : HyperSystem V E) (s : HyperState V E) (e : E) : ℤ :=
  by
    classical
    exact
      if liveHyperEdge H s e then
        ((2 ^ hyperCapturedCount H s e) * H.weight e : ℕ)
      else
        0

/-- Total contribution of one hyperedge to the scaled potential `HQ8`. -/
def hyperEdgeContrib (H : HyperSystem V E) (s : HyperState V E) (e : E) : ℤ :=
  if e ∈ s.scored then
    ((8 * H.weight e : ℕ) : ℤ)
  else
    hyperEdgePot H s e

/-- Total scored weight. -/
def scoredWeight (H : HyperSystem V E) (s : HyperState V E) : ℤ :=
  s.scored.sum fun e => (H.weight e : ℤ)

/-- Scaled scored-hypergraph potential. -/
def HQ8 (H : HyperSystem V E) (s : HyperState V E) : ℤ :=
  Finset.univ.sum fun e => hyperEdgeContrib H s e

/-- Sum of live hyperedge potentials incident to a vertex. -/
def hyperIncidentPot8 (H : HyperSystem V E) (s : HyperState V E) (v : V) : ℤ :=
  by
    classical
    exact
      (Finset.univ.filter fun e => liveHyperEdge H s e ∧ v ∈ H.verts e).sum fun e =>
        hyperEdgePot H s e

/-- Maker scores a hyperedge and captures all of its vertices. -/
def makerScoreMove (H : HyperSystem V E) (s : HyperState V E) (e : E) : HyperState V E where
  captured := s.captured ∪ H.verts e
  scored := insert e s.scored
  deletedVerts := s.deletedVerts

/-- Breaker deletes a vertex. -/
def breakerDeleteVertex (s : HyperState V E) (v : V) : HyperState V E where
  captured := s.captured
  scored := s.scored
  deletedVerts := insert v s.deletedVerts

/-- Breaker scores a live hyperedge. -/
def breakerScoreEdge (s : HyperState V E) (e : E) : HyperState V E where
  captured := s.captured
  scored := insert e s.scored
  deletedVerts := s.deletedVerts

/-- Empty initial hypergraph state. -/
def emptyHyperState : HyperState V E := {}

end RequestProject.T2Finite
