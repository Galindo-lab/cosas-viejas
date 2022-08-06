;vectores
(defun suma(vec-a vec-b)
  (list
   (sumar-pos vec-a vec-b 0)
   (sumar-pos vec-a vec-b 1)
   (sumar-pos vec-a vec-b 2) ))

(defun resta(vec-a vec-b)
  (list
   (resta-pos vec-a vec-b 0)
   (resta-pos vec-a vec-b 1)
   (resta-pos vec-a vec-b 2) ))

(defun sumar-pos(a b pos)
  (+ (nth pos a) (nth pos b)))

(defun resta-pos(a b pos)
  (- (nth pos a) (nth pos b)))
