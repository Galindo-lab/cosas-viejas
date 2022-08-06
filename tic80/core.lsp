;(defvar *query-io* nil)

(defvar *player*
  (list :int  1 :will 1 :pre  1   
	:tech 1 :ref  1 :dex  1
	:con  1 :str  1 :body 1))

(defun derived-char(data)
  (list :stun (* (getf data :body) 5)
	:hits (* (getf data :body) 5)
	:sd   (* (getf data :con) 2)
	:rec  (+ (getf data :str) (getf *player* :con))))

