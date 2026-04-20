import RequestProject.T2Finite.Defs
import RequestProject.T2Finite.GraphGame
import RequestProject.T2Finite.GraphReachable
import RequestProject.T2Finite.HyperDefs
import RequestProject.T2Finite.HyperGame
import RequestProject.T2Finite.EmbeddingCore
import RequestProject.T2Finite.EmbeddingFamily
import RequestProject.T2Finite.ResidualComparison
import RequestProject.Round15Bonferroni4.Envelope
import RequestProject.Round15Bonferroni4.FlatMass
import RequestProject.Round15Bonferroni4.Inversion
import RequestProject.Round15Bonferroni4.PrimeBounds

/-!
# T2 Finite Core

This project begins the formalization of the finite Maker-first core behind the
T2 lower bound. The first target is the weighted graph capture game, with the
scaled potential `Q8` used in the repaired Maker-first argument.
-/
