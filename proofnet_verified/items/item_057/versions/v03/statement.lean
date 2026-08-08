import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators





theorem Dummit_Foote_exercise_4_5_28
{G : Type*} [Group G] --"Let $G$ be a group"
[Fintype G] (hG : card G = 105) -- of order 105
:
∃ P : -- "if a"
Sylow 3 G, -- "Sylow 3-subgroup of $G$"
P.Normal -- "is normal"
→ -- "then"
∀ a b : G, a*b = b*a  -- G is abelian
:= by
  sorry
