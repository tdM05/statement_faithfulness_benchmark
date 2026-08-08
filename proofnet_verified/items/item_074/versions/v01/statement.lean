import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators
noncomputable section



theorem Herstein_exercise_2_3_17 {G : Type*} [Mul G] [Group G] (a x : G) :
  centralizer {x⁻¹*a*x} =
  (λ g : G => x⁻¹*g*x) '' (centralizer {a}) := by
  sorry
