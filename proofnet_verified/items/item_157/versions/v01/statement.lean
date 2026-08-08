import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators
noncomputable section



theorem Rudin_exercise_2_28 (X : Type*) [MetricSpace X] [SeparableSpace X]
  (A : Set X) (hA : IsClosed A) :
  ∃ P₁ P₂ : Set X, A = P₁ ∪ P₂ ∧
  IsClosed P₁ ∧ P₁ = {x | ClusterPt x (𝓟 P₁)} ∧
  Set.Countable P₂ := by
  sorry
