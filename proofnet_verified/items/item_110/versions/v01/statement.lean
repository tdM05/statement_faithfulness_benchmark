import Mathlib

open Filter Set TopologicalSpace
open Topology
noncomputable section

def lower_limit_topology (X : Type) [Preorder X] :=
  generateFrom {S : Set X | ∃ a b, a < b ∧ S = Ico a b}



theorem Munkres_exercise_13_8b :
  (generateFrom {S : Set ℝ | ∃ a b : ℚ, a < b ∧ S = Ico ↑a ↑b}).IsOpen ≠
  (lower_limit_topology ℝ).IsOpen := by
  sorry
