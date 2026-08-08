import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators





theorem Dummit_Foote_exercise_4_5_15 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 351) :
  ∃ (p : ℕ) (P : Sylow p G), p.Prime ∧ (p ∣ card G) ∧  P.Normal := by
  sorry
