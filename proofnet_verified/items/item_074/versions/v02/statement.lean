import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators





theorem Herstein_exercise_2_3_17 {G : Type*} [Group G] (a x : G) :
  centralizer {x⁻¹ * a * x} = (fun g : G => x⁻¹ * g * x) '' (centralizer {a}) := by
  sorry
