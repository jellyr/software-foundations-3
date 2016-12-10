Require Export D.



(** **** Exercise: 3 stars (types_unique)  *)
(** Another pleasant property of the STLC is that types are
    unique: a given term (in a given context) has at most one
    type. *)

Lemma type_is_unique: forall t G T T'
    (TYPED: G |- t \in T)
    (TYPED': G |- t \in T'),
  T = T'.
Proof with eauto.
  intros t G T T' HT HT'. generalize dependent T'.
  induction HT; intros T' HT'; inversion HT'; subst; try reflexivity; eauto.
  - rewrite H2 in H. inversion H...
  - apply IHHT in H4. subst...
  - apply IHHT1 in H2. inversion H2...
  - apply IHHT1 in H2. apply IHHT2 in H4. subst...
  - apply IHHT in H1. inversion H1...
  - apply IHHT in H1. inversion H1...
  - apply IHHT2. apply IHHT1 in H4. subst...
  - apply IHHT in H3. subst...
  - apply IHHT in H3. subst...
  - apply IHHT1 in H6. inversion H6. subst. apply IHHT2 in H7.  apply IHHT3 in H8...
  -  apply IHHT in H1. inversion H1. subst...
Qed.

