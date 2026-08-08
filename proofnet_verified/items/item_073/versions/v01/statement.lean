import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators
noncomputable section



instance Herstein_exercise_2_2_5 {G : Type*} [Group G]
  (h : ∀ (a b : G), (a * b) ^ 3 = a ^ 3 * b ^ 3 ∧ (a * b) ^ 5 = a ^ 5 * b ^ 5) :
  CommGroup G := by
  sorry
