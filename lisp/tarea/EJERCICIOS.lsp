#|
EJERCICIO 1. Valor 10 Puntos
Realice un algoritmo para determinar el sueldo semanal de un trabajador con base en las horas
trabajadas y el pago por hora, considerando que después de las 40 horas cada hora se considera
como excedente y se paga el doble.
|#

(defun ejercicio-2.1(horas-trabajadas salario-hora)
  (if (> horas-trabajadas 40)
      (+ (* 40 salario-hora)
	 (* (- horas-trabajadas 40) salario-hora 2))
    (* horas-trabajadas salario-hora)))

#|
EJERCICIO 2.
El dueño de un estacionamiento requiere un diagrama de flujo con el algoritmo que le permita
determinar cuánto debe cobrar por el uso del estacionamiento a sus clientes. Las tarifas que se
tienen son las siguientes:
  Las dos primeras horas a $5.00 c/u.
  Las siguientes tres a $4.00 c/u.
  Las cinco siguientes a $3.00 c/u.
  Después de diez horas el costo por cada una es de dos pesos.
|#

(defun ejercicio-2.2(horas)
  (cond
   ((< horas 2)
    (print "menor a 2"))
   ((and (>= horas 2) (<= horas 6))
    (print "mayor o igual a 2 y menor a 6"))
   ()
   ()
   ))

#|  (when (< horas 2)
      (print "menor a 2")
    (and (>= horas 2) (<= horas 6))
    (print "mayor o igual a 2 y menor a 6")))|#
