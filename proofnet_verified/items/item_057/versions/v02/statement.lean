import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators





theorem Dummit_Foote_exercise_4_5_28 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 105) (P : Sylow 3 G) [hP : P.Normal] :
  ∀ a b : G, a*b = b*a := by
  sorry
