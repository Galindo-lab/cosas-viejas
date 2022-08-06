;; tictactoe

(defun tictactoe()
  "star playing tic tac toe"
  (interactive) 

  (switch-to-buffer "tictactoe")
  (tictactoe-init))

(defun tictactoe-init()
  (setq *tictactoe-board* (make-vector (* *tictactoe-size* *tictactoe-size* ) )

(defvar *tictactoe-board* nil
  "the board itself")

(defvar *tictactoe-size* 3) 
