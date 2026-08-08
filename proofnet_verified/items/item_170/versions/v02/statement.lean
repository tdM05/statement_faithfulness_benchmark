import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators





theorem Rudin_exercise_4_19
  {f : ℝ → ℝ}
  (hf : ∀ a b c, a < b →
      ((f a < c ∧ c < f b) ∨ (f b < c ∧ c < f a)) →
      ∃ x, a < x ∧ x < b ∧ f x = c)
  (hg : ∀ r : ℚ, IsClosed {x | f x = r}) : Continuous f := by
  sorry
