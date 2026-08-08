import Mathlib

open Filter Real Function
open scoped Topology
noncomputable section



theorem Pugh_exercise_3_4 (n : ℕ) :
  Tendsto (λ n => (sqrt (n + 1) - sqrt n)) atTop (𝓝 0) := by
  sorry
