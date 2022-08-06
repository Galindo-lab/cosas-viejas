

(defun epsilon()
  (let ((eps 1.0))

    (loop while (/= (- 1 eps) 1 ) do
      (setq eps (/ eps 2)))

    (* eps 2)
   
))
