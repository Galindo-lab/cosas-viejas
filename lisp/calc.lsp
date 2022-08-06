
(defun +- (a b)
  "devuelve la suma y la resta de los valores"
  (list (+ a b) (- a b) ))

(defun numeradores (a b c)
  (+- (- b) (sqrt(- (expt b 2) (* 4 (* a c)))) ))

(defun formula-general (a b c)
  (loop for numerador in (numeradores a b c) do
	(format t "~d ~%" ((lambda (x y)
			     (/ x y) )
			   numerador (* 2 a) )) ) )

;-------------------------------------------------------------------------

(setq p '( nil ))
;(setq q (nil))

(defun multiplos (val)
  (dotimes (x val)
    (if (= (mod val (+ x 1)) 0)
	(format t "~d ~%" (+ x 1))) ))
 
(defun mul(val list)
  (loop for x from 0 to val do
	(append p (list x))))


(defun factores (polinomio)
  (format t "~d~%" (first polinomio) )
  (format t "~d~%" (car(last polinomio))) )



;(multiplos '(1 2 3 4))

;-------------------------------------------------------------------------

