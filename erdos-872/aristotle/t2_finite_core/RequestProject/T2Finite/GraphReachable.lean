import RequestProject.T2Finite.Defs

open Finset

namespace RequestProject.T2Finite

variable {V E : Type} [DecidableEq V] [Fintype V] [DecidableEq E] [Fintype E]

/-- The vertices touched by already-claimed edges. -/
def claimedVerts (G : GraphSystem V E) (s : GraphState V E) : Finset V :=
  s.claimed.biUnion G.verts

lemma claimedVerts_makerMove
    (G : GraphSystem V E) (s : GraphState V E) (e : E) :
    claimedVerts G (makerMove G s e) = claimedVerts G s ∪ G.verts e := by
  classical
  ext v
  simp [claimedVerts, makerMove, Finset.mem_union, or_comm, or_left_comm, or_assoc]

lemma claimedVerts_breakDeleteVertex
    (G : GraphSystem V E) (s : GraphState V E) (v : V) :
    claimedVerts G (breakDeleteVertex s v) = claimedVerts G s := by
  unfold claimedVerts breakDeleteVertex
  simp

lemma claimedVerts_breakDeleteEdge
    (G : GraphSystem V E) (s : GraphState V E) (e : E) :
    claimedVerts G (breakDeleteEdge s e) = claimedVerts G s := by
  unfold claimedVerts breakDeleteEdge
  simp

/-- Reachable states of the pair-capture game after Breaker's reply. -/
inductive GraphReachable (G : GraphSystem V E) : GraphState V E → Prop
  | empty : GraphReachable G emptyState
  | breakDeleteVertex
      {s : GraphState V E} {f : E} {v : V}
      (hs : GraphReachable G s)
      (hf : liveEdge G s f)
      (hv : v ∉ (makerMove G s f).captured) :
      GraphReachable G (breakDeleteVertex (makerMove G s f) v)
  | breakDeleteEdge
      {s : GraphState V E} {f e : E}
      (hs : GraphReachable G s)
      (hf : liveEdge G s f)
      (he : liveEdge G (makerMove G s f) e) :
      GraphReachable G (breakDeleteEdge (makerMove G s f) e)

lemma captured_eq_claimedVerts_of_graphReachable
    (G : GraphSystem V E) {s : GraphState V E} (hs : GraphReachable G s) :
    s.captured = claimedVerts G s := by
  induction hs with
  | empty =>
      simp [claimedVerts, emptyState]
  | breakDeleteVertex hs hf hv ih =>
      ext x
      simp [claimedVerts, breakDeleteVertex, makerMove, ih, or_comm, or_left_comm, or_assoc]
  | breakDeleteEdge hs hf he ih =>
      ext x
      simp [claimedVerts, breakDeleteEdge, makerMove, ih, or_comm, or_left_comm, or_assoc]

lemma not_mem_claimed_of_mem_verts_of_not_captured
    (G : GraphSystem V E) {s : GraphState V E} (hs : GraphReachable G s)
    {e : E} {v : V}
    (hv : v ∉ s.captured) (hve : v ∈ G.verts e) :
    e ∉ s.claimed := by
  intro he
  have hclaimed : v ∈ claimedVerts G s := by
    exact mem_biUnion.mpr ⟨e, he, hve⟩
  rw [← captured_eq_claimedVerts_of_graphReachable G hs] at hclaimed
  exact hv hclaimed

end RequestProject.T2Finite
