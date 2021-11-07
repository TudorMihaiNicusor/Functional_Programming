;; am vrut sa arat ca sunt in stare sa fac problemele, mai putin de a 3-a,
;; unde nu aveam nicio idee xD

(DEFUN repeat (n el)
    (COND
        ((EQUAL n 1) el)
        (T (APPEND (repeat-back (- n 1) el) el))
    )
)

(DEFUN repeat-back (n li)
    (COND
        ((NULL li) nil)
        (T (apply #'append (MAPCAR (lambda (x) (repeat n (LIST x))) li)))
    )
)

(DEFUN repeat-for (n li &optional(lista nil))
    (COND
        ((NULL li) lista)
        (T (APPEND lista
            (apply #'append (MAPCAR (lambda (x) (repeat n (LIST x))) li))))
    )
)

(repeat-back 2 '(1 2 3 4))
(repeat-back 3 '(1 2 3 4))
(repeat-for 3 '(1 2 3 4))