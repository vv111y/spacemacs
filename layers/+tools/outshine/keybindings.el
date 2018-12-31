(spacemacs|define-transient-state outshine
  :title "Outshine Transient State"
  :doc "
^Navigation^        ^Visibility^          ^Structure Editing^     ^Date & Time^        ^Meta Data^    ^Properties & Effort
^^^^^^^^^^-------------------------------------------------------------------------------------------------------------------
_n_: next-visible   _v_: as-org           _U_: move-subtree-up    _I_: clock-in        _t_: todo      _y_: set-property
_p_: prev-visible   _V_: as-org-whole     _D_: move-subtree-down  _O_: clock-out       _,_: priority  _Y_: set-prop-&-val
_f_: forward-same   _x_: exit-outorg      _+_: demote             _1_: time-stamp      _0_: priority  _e_: set-effort
_b_: backward-same  _c_: cycle            _-_: promote            _!_: stamp-inactive  _1_: priority  _E_: inc-effort
_u_: up-heading     _C_: cycle-buffer     _i_: insert-heading     _d_: deadline        _2_: priority  _a_: agenda
_o_: open-at-point  _r_: narrow           _S_: sort-entries       _s_: schedule        _3_: priority  _<_: agenda-set-lock
_m_: mark-subtree   _w_: widen                                                     _:_: set-tags  _>_: agenda-remove-lock
_j_: navi           _#_: toggle-comment
_g_: imenu
"

  :foreign-keys run
  ;; :on-enter (unless (bound-and-true-p origami-mode) (origami-mode 1))
  :bindings
  ("n"  (outshine-speed-move-safe
         'outline-next-visible-heading))

  ("p"  (outshine-speed-move-safe
         'outline-previous-visible-heading))

  ("f"  (outshine-speed-move-safe
         'outline-forward-same-level))

  ("u"  (outshine-speed-move-safe
         'outline-up-heading))

  ("b"  (outshine-speed-move-safe
         'outline-backward-same-level))

  ;; ("F"  outshine-next-block)

  ;; ("B"  outshine-previous-block)

  ("j"  outshine-navi)

  ("g"  outshine-imenu)

  ("v"  outorg-edit-as-org)

  ("V" (let ((current-prefix-arg 4))
         (call-interactively 'outorg-edit-as-org)))

  ("x"  outorg-copy-edits-and-exit)

  ("c"  outshine-cycle)

  ("C"  outshine-cycle-buffer)

  (" "  (outshine-use-outorg
         'org-display-outline-path
         'WHOLE-BUFFER-P))

  ("r"  outshine-narrow-to-subtree)

  ("w"  widen)

  ("U"  outline-move-subtree-up)

  ("D"  outline-move-subtree-down)

  ("+"  outline-demote)

  ("-"  outline-promote)

  ("i"  outshine-insert-heading)

  ("S"  outshine-sort-entries)

  ("m"  outline-mark-subtree)

  ("#"  outshine-toggle-comment)

  ("I"  outshine-clock-in)

  ("O"  outshine-clock-out)

  (""  outshine-time-stamp)

  ("!"  outshine-time-stamp-inactive)

  ("d"  outshine-deadline)

  ("s"  outshine-schedule)

  ("x"  outshine-export-dispatch)

  ("t"  outshine-todo)

  (","  outshine-priority)

  ("0"  (outshine-use-outorg
         (lambda () (interactive) (org-priority ?\ ))))

  ("1"  (outshine-use-outorg
         (lambda () (interactive) (org-priority ?A))))

  ("2"  (outshine-use-outorg
         (lambda () (interactive) (org-priority ?B))))

  ("3"  (outshine-use-outorg
         (lambda () (interactive) (org-priority ?C))))

  (":"  outshine-set-tags-command)

  ("y"  outshine-set-property)

  ("Y"  outshine-set-property-and-value)

  ("e"  outshine-set-effort)

  ("E"  outshine-inc-effort)

  ("a"  outshine-agenda)

  ("<"  (outshine-agenda-set-restriction-lock))

  (">"  (outshine-agenda-remove-restriction-lock))

  ("o"  outshine-open-at-point)

  ("?"  outshine-speed-command-help)

  ("q" nil :exit t)
  ("C-g" nil :exit t)
  )

