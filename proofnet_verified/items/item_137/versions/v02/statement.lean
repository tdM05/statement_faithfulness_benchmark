import Mathlib

open Filter Real Function
open scoped Topology





theorem Pugh_exercise_2_41
    (m : ℕ) (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (hdim : Module.finrank ℝ E = m) :
    IsCompact (Metric.closedBall (0 : E) 1) :=
    sorry
