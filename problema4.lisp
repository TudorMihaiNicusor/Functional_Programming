(DEFUN reverse-tree (tree)
  (IF (NULL tree) NIL
      (LET 
        ((root (CAR tree)) (tree (CDR tree)))
        (IF (NULL tree)
            (LIST root)
            (LIST root (reverse-tree (CADR tree)) ;; dreapta 
                       (reverse-tree (CAR tree)))))) ;;stanga => schimb ordinea
)

(reverse-tree '(1 (2 (3) (4)) (5 (6) (7))))