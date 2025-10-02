(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defun dough-calculator (pizzas diameter)
  (let ((dough-per-pizza (+ (/ (* 45 pi diameter) 20) 200)))
    (round (* pizzas dough-per-pizza))))

;; Can't see the mathematical basis for this one, we'll just use it as-is.
(defun size-from-sauce (sauce)
  (sqrt (/
         (* 40 sauce)
         (* 3 pi))))

(defun pizzas-per-cube (cube-size diameter)
  (let ((cube-volume (* 2 (expt cube-size 3)))
        (pizza-size (* 3 pi (expt diameter 2))))
    (floor (/ cube-volume pizza-size))))

(defun fair-share-p (pizzas friends)
  (let ((slice-count (* pizzas 8)))
    (zerop (mod slice-count friends))))
