import Mathlib

open scoped BigOperators
open Finset

noncomputable section

namespace RequestProject.T2Finite

/-- A finite weighted graph-like system for the rank-2 Maker-first core. -/
structure GraphSystem (V E : Type) [DecidableEq V] [DecidableEq E] where
  verts : E → Finset V
  verts_card_two : ∀ e, (verts e).card = 2
  weight : E → ℕ

/-- State of the finite graph capture game. -/
structure GraphState (V E : Type) [DecidableEq V] [DecidableEq E] where
  captured : Finset V := ∅
  claimed : Finset E := ∅
  deletedVerts : Finset V := ∅
  deletedEdges : Finset E := ∅

variable {V E : Type} [DecidableEq V] [Fintype V] [DecidableEq E] [Fintype E]

/-- An edge is live if it is not already claimed or deleted and it avoids the deleted vertices. -/
def liveEdge (G : GraphSystem V E) (s : GraphState V E) (e : E) : Prop :=
  e ∉ s.claimed ∧ e ∉ s.deletedEdges ∧ Disjoint (G.verts e) s.deletedVerts

/-- Number of captured endpoints of an edge. -/
def capturedCount (G : GraphSystem V E) (s : GraphState V E) (e : E) : ℕ :=
  ((G.verts e) ∩ s.captured).card

/-- Scaled potential for a live edge. Coefficients are `1,2,4` for `0,1,2` captured endpoints. -/
def edgePot (G : GraphSystem V E) (s : GraphState V E) (e : E) : ℤ :=
  by
    classical
    exact
      if liveEdge G s e then
        ((2 ^ capturedCount G s e) * G.weight e : ℕ)
      else
        0

/-- Total contribution of one edge to the scaled potential `Q8`. -/
def edgeContrib (G : GraphSystem V E) (s : GraphState V E) (e : E) : ℤ :=
  if e ∈ s.claimed then
    ((8 * G.weight e : ℕ) : ℤ)
  else
    edgePot G s e

/-- Total claimed weight. -/
def claimedWeight (G : GraphSystem V E) (s : GraphState V E) : ℤ :=
  s.claimed.sum fun e => (G.weight e : ℤ)

/-- Scaled graph potential. -/
def Q8 (G : GraphSystem V E) (s : GraphState V E) : ℤ :=
  Finset.univ.sum fun e => edgeContrib G s e

/-- Sum of live edge potentials incident to a vertex. -/
def incidentPot8 (G : GraphSystem V E) (s : GraphState V E) (v : V) : ℤ :=
  by
    classical
    exact
      (Finset.univ.filter fun e => liveEdge G s e ∧ v ∈ G.verts e).sum fun e =>
        edgePot G s e

/-- Maker claims an edge and captures both endpoints. -/
def makerMove (G : GraphSystem V E) (s : GraphState V E) (e : E) : GraphState V E where
  captured := s.captured ∪ G.verts e
  claimed := insert e s.claimed
  deletedVerts := s.deletedVerts
  deletedEdges := s.deletedEdges

/-- Breaker deletes a vertex. -/
def breakDeleteVertex (s : GraphState V E) (v : V) : GraphState V E where
  captured := s.captured
  claimed := s.claimed
  deletedVerts := insert v s.deletedVerts
  deletedEdges := s.deletedEdges

/-- Breaker deletes an edge. -/
def breakDeleteEdge (s : GraphState V E) (e : E) : GraphState V E where
  captured := s.captured
  claimed := s.claimed
  deletedVerts := s.deletedVerts
  deletedEdges := insert e s.deletedEdges

/-- Empty initial state. -/
def emptyState : GraphState V E := {}

end RequestProject.T2Finite
