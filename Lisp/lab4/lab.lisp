;;; package -- Summary
;;; Commentary:
;;;
;;; Code:
(defun exp-let (m n)
  (let ((rez 1))
    (do
     ((exp n (- exp 1)))
     ((zerop exp))
      (setf rez (* rez m)))
    rez))


(defun exp-nolet (m n)
  (do
   ((rez 1)
    (exp n (- exp 1)))
   ((zerop exp) rez)
    (setf rez (* rez m))))


(defun exp-do (m n)
  (do
   ((rez 1 (* rez m))
    (exp n (- exp 1)))
   ((zerop exp) rez)))


(defun fact2 (n)
  (do
   ((rez 1)
    (ft n (- ft 1)))
   ((zerop ft) rez)
    (setf rez (* rez ft))))

(defun fact-loop (n)
  (let
      ((rez 1))
    (loop
      (when (zerop n) (return rez))
      (setf rez (* rez n) n (- n 1)))))


(defun lun-do (lista)
  (do
   ((lung 0 (+ lung 1))
    (parc lista (cdr parc)))
   ((endp parc) lung)))


(defun cresc (lista)
  (do*
   ((seq lista (cdr seq))
    (st (first seq) (first seq))
    (nd (second seq) (second seq)))
   ((or (null nd) (> st nd)) (null nd))))


(defun fibo (n)
  (do
   ((iter (- n 1) (- iter 1))
    (acc1 0 acc2)
    (acc2 1 (+ acc1 acc2)))
   ((zerop iter) acc1)))


(defun elim-nr (lista)
  (do
   ((iter lista (cdr iter))
    (rez nil))
   ((null iter) rez)
    (setf rez (append rez (if
			   (not (numberp (car iter)))
			   (list (car iter)))))))


(defun elim-nr-l (lista)
  (let ((rez nil) (iter lista))
    (loop
      (if (null iter) (return rez))
      (when (not (numberp (car iter)))
	(setf rez (append rez (list (car iter)))))
      (setf iter (cdr iter)))
    rez))


(defun elim-num (lista)
  (do
   ((iter lista (cdr iter))
    (elem (car lista) (car iter))
    (rez nil))
   ((endp iter) rez)
    (setf rez (append rez (cond
			    ((listp (car iter))
			     (list (elim-num (car iter))))
			    ((not (numberp (car iter)))
			     (list (car iter))))))))


(defun add-numere-do (lista)
  (do
   ((iter lista (cdr iter))
    (rez 0))
   ((null iter) rez)
    (setf rez (+ rez (car iter)))))


(defun add-numere-do-secv (lista)
  (do*
   ((rez 0 (+ rez  (car iter)))
    (iter lista (cdr iter)))
   ((null iter) rez)))


(defun remove-num (lista)
  (do*
   ((iter lista (cdr iter))
    (rez (if (not (numberp (car iter)))
	     (list (car iter))
	     nil)
	 (if (not (numberp (car iter)))
	     (append rez (list (car iter)))
	     rez)))
   ((null iter) rez)))

;;; lab2.lisp ends here
