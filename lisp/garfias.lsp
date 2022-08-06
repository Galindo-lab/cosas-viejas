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
   ((and (plusp  real) (plusp  img)) -90 )    ;ok
   ((and (minusp real) (plusp  img)) -90 )    ;ok
   ((and (minusp real) (minusp img)) 180 )    ;
   ((and (plusp  real) (minusp img)) -270 )))  ;

(defun corregir(real img)
  (if (or (zerop real) (zerop img))
      (crt real img)
    (quadrant real img)))


;;converciones
(defun polar->rectangular(amp face)
  (if (minusp amp)
      (format t "La amplitud no puede ser negativa")
    (format t "resultado: ~,4F + (~,4F)i~%"
	    (* amp (rcos face))(* amp (rsin face)))))

(defun rectangular->polar(real img)
  (format t "resultado: (~,4F, ~,4F°) ~%"
	  (sqrt (+ (expt real 2) (expt img 2)))
	  (+ (ratan (/ real img)) (corregir real img))))

(defun trigonometrica->polar(magnitud face)
  (format t "resultado: (~,4F, ~,4F°)" magnitud face))

(defun exponencial->polar(mg exp)
  (format t "resultado: (~,4F, ~,4F°) " mg (* exp 180)))

(defun polar->exponencial(mg ang)
  (format t "resultado: ~,4Fe^(~,4F iπ) " mg (/ ang 180)))
