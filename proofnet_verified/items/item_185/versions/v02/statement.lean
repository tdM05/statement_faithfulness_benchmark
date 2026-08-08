import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators





theorem Artin_exercise_2_8_6 {G H : Type*} [Group G] [Group H] :
    Subgroup.center (G × H) = (Subgroup.center G).prod (Subgroup.center H) := by
  sorry
