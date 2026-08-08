import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators





theorem Herstein_exercise_2_1_21 (G : Type*) [Group G] [Fintype G]
  (hG : card G = 5) :
  ∀ a b : G, a*b = b*a := by
  sorry
