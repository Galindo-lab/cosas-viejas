
(defvar *data-base* nil)
(defvar *query-io* nil)
(defconstant data-base-path "~/programacion/lisp/test.db")

(defun new-cd (title artist rating ripped)
  "crear un registro nuevo para la base de datos, para añadirlo se utiliza la funcion @add-record"
  (list :title  title
	:artist artist
	:rating rating
	:ripped ripped ))

(defun add-record (cd)
  "añadir registro a la base de datos"
  (push cd *data-base*))

(defun list-db (db)
  "mostrar todos los registros de la base de datos"
  (format t "~{~{~a:~10t~a~%~}~%~}" db) )

(defun prompt-read (prompt)
  "lectura del prompt"
  (format *query-io* "~a~10t: " prompt)
  (force-output *query-io*)
  (read-line *query-io* ))

(defun prompt-for-cd ()
  "prompt para añadir nuevos cds"
  (add-record
   (new-cd
    (prompt-read "title")
    (prompt-read "artist")
    (or (parse-integer (prompt-read "rating") :junk-allowed t) 0)
    (y-or-n-p (format t "ripped [y/n]:") ))))

(defun add-cds ()
  "añadir cds en bucle"
  (loop (prompt-for-cd)
	(if (not (y-or-n-p "Another? [y/n]: "))
	    (return))))

(defun save-db (filename)
  (with-open-file (out filename
                   :direction :output
                   :if-exists :supersede)
    (with-standard-io-syntax
      (print *data-base* out))))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *data-base* (read in)))))
