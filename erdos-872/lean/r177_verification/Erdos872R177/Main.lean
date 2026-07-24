import Erdos872R177.AnalyticInputs
import Erdos872R177.Asymptotic
import Erdos872R177.Bridge
import Erdos872R177.ConeOrder
import Erdos872R177.ConeProjection
import Erdos872R177.ConcreteSweep
import Erdos872R177.DenseFactorization
import Erdos872R177.DensityRecursion
import Erdos872R177.GameStrategies
import Erdos872R177.MinimalRoots
import Erdos872R177.ParameterLimit
import Erdos872R177.SweepAccounting
import Erdos872R177.TailSup
import Erdos872R177.UsefulTags

/-! # R177 verification aggregate and unconditional endpoint -/

open Filter

namespace Erdos872

/-- The minimax length of the original divisor-antichain game is sublinear. -/
theorem main :
    Tendsto (originalRatio Erdos872R177.L) atTop (nhds 0) :=
  Erdos872R177.main_of_concreteSweepFamily
    Erdos872R177.concreteSweepFamily

end Erdos872
