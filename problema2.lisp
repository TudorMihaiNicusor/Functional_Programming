(DEFUN map-loop (f li)
    (LET
        ((lista '()))
    (loop
        (WHEN (ENDP li) (return lista))
        (SETQ lista (APPEND (LIST(funcall f (CAR li))) lista))
        (SETF li (CDR li))
    ))

)

(map-loop #'oddp '(1 2 3 4))
(map-loop #'evenp '(1 2 3 4))

(DEFUN map-do (f li)
    (do
        ((iter (length li) (1- iter))
         (lista '())
        )
        ((zerop iter) (return lista))
        (SETQ lista (APPEND lista (LIST (funcall f (CAR li)))))
        (SETF li (CDR li))
    )
)

(map-do #'oddp '(1 2 3 4))
(map-do #'evenp '(1 2 3 4))

(DEFUN map-do-steluta (f li)
    (do*
        ((iter (length li) (1- iter))
         (lista '())
        )
        ((zerop iter) (return lista))
        (SETQ lista (APPEND lista (LIST (funcall f (CAR li)))))
        (SETF li (CDR li))
    )
)

(map-do-steluta #'oddp '(1 2 3 4))
(map-do-steluta #'evenp '(1 2 3 4))