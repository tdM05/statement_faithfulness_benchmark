import Mathlib
import Mathlib.Tactic.IntervalCases

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators





theorem Dummit_Foote_exercise_4_5_13 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 56) :
  ∃ (p : ℕ) (P : Sylow p G), p.Prime ∧ (p ∣ card G) ∧ P.Normal := by
  sorry
