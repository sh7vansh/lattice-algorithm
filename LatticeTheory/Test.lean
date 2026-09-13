import Mathlib.Order.CompleteLattice.Defs
import Mathlib.Order.WellFounded
import Mathlib.SetTheory.Ordinal.Basic
import Mathlib.SetTheory.Ordinal.Principal
import Mathlib.Data.Set.Basic

variable {L : Type} [CompleteLattice L]
variable {J : Type} [LinearOrder J] [WellFoundedLT J]
variable (embed : J → L)

class IsGenerated {L J : Type} [CompleteLattice L] (embed : J → L) : Prop where
  top_eq_iSup : (⨆ j, embed j) = ⊤

variable [IsGenerated embed]

lemma candidates_nonempty (x : L) (h : x < ⊤) : { j : J | ¬ (embed j ≤ x) }.Nonempty := by
  rw [Set.nonempty_def]
  by_contra h_contra
  have h_le : (⨆ j, embed j) ≤ x := by
    apply iSup_le
    intro j
    by_contra h_contra_j
    have h2 : j ∈ { j : J | ¬ (embed j ≤ x) } := h_contra_j
    have h3 : { j : J | ¬ (embed j ≤ x) }.Nonempty := ⟨j, h2⟩
    exact h_contra h3
  rw [IsGenerated.top_eq_iSup (embed := embed)] at h_le
  have h_eq_top : x = ⊤ := top_le_iff.mp h_le
  exact h.ne h_eq_top

open Classical in
noncomputable def fixedPriorityPhi (x : L) (h : x < ⊤) : J :=
  let candidates := { j : J | ¬ (embed j ≤ x) }
  have h_nonempty : candidates.Nonempty := candidates_nonempty embed x h
  WellFounded.min wellFounded_lt candidates h_nonempty

theorem novelty_of_fixedPriorityPhi (x : L) (h : x < ⊤) :
    ¬ (embed (fixedPriorityPhi embed x h) ≤ x) := by
  have h1 := WellFounded.min_mem wellFounded_lt { j : J | ¬ (embed j ≤ x) } (candidates_nonempty embed x h)
  exact h1

open Classical in
noncomputable def x_seq (o : Ordinal) : L :=
  Ordinal.limitRecOn o
    (⊥ : L)
    (fun _ x => if h : x < ⊤ then x ⊔ embed (fixedPriorityPhi embed x h) else x)
    (fun a _ f => ⨆ (b : Ordinal) (hb : b < a), f b hb)

noncomputable def sieve_output : L :=
  ⨆ (o : Ordinal.{0}), x_seq embed o
