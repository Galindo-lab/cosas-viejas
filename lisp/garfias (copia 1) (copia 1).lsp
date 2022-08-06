;;; Funciones para convertir de polar a rectangular
(defun rec (rad) (* rad (/ 180 pi)))
(defun rad (rec) (/ rec (/ 180 pi)))

#|| Todas las funciones a continuacion definidas deberían
ser iguales a las que usa la Casio fx-82MS ||#
(defun ratan (v) (rec (atan v)))
(defun rcos (v) (cos (rad v)))
(defun rsin (v) (sin (rad v)))

#|| corregir las coordenadas polares respecto a su cuadrante ||#
(defun crt(real img)
  (cond
   ((and (zerop real) (zerop img)) 0 )
   ((plusp img) 90)
   ((minusp img) 270)
   ((plusp real) 360)
   ((minusp real) 180)))

(defun quadrant(real img)
  (cond
   ((and (plusp  real) (plusp  img)) (+ 0  (ratan (/ img real)) ))    
   ((and (minusp real) (plusp  img)) (- 90  (ratan (/ img real)) ))    
   ((and (minusp real) (minusp img)) (+ 180 (ratan (/ img real)) ))    
   ((and (plusp  real) (minusp img)) (+ 360 (ratan (/ img real)) ))))  

(defun corregir(real img)
  (if (or (zerop real) (zerop img))
      (crt real img)
    (quadrant real img)))

;;converciones
(defun polar->rectangular(amp face)
  (if (minusp amp)
      (format t "la amplitud no puede ser negativa")
    (format t "resultado: ~,4f + (~,4f)i~%"
	    (* amp (rcos face))(* amp (rsin face)))))

(defun rectangular->polar(real img)
  (format t "resultado: (~,4f, ~,4f°) ~%"
	  (sqrt (+ (expt real 2) (expt img 2))) (corregir real img)))

(defun pol->rec(amp face)
  (if (minusp amp)
      (list 0 0 :error "error, la amplitud no puede ser negativa")
    (list (* amp (rcos face)) (* amp (rsin face)))))

(defun rec->pol(real img)
  (list (sqrt (+ (expt real 2) (expt img 2))) (corregir real img)))

(defun check(amp face) ;ingresar un polar
 (rec->pol (nth 0 (pol->rec amp face)) (nth 1 (pol->rec amp face)) )
  )

#||(defun rectangular->polar(real img)
  (format t "resultado: (~,4f, ~,4f°) ~%"
	  (sqrt (+ (expt real 2) (expt img 2) ) )
	  (+ (ratan (/ img real)) (corregir real img)  ))
  
)||#


