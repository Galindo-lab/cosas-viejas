

(var player
     {:int  0 :will 0 :pre  0    ;Mental Group
      :tech 0 :ref  0 :dex  0    ;Combat Group 
      :con  0 :str  0 :body 0})


(fn derived-char [char]
  {:stun (* char.body 5)
   :hits (* char.body 5)
   :sd   (* char.con  2)
   :rec  (+ char.str char.con)})


(fn tree [list]
  (each [index value (pairs list)]
    (print index value)))

