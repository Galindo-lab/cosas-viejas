;; title:  game title
;; author: game developer
;; desc:   short description
;; script: fennel

;482 485
                                        ;variables
(var player
     {:x 10 :y 10
      :frame 485
      :moving false
      :flip 0 :speed 0.6
      :map-x 0 :map-y 0} )

(var player-sprite
     {:id 0 :x 0 :y 0
      :colorkey -1 :scale 1
      :flip 0 :rotate 0 :w 1 :h 1})
                                        ;Listas inmutables
(local dir
     {:up    [ 0 -1  7 -1]
      :down  [ 0  8  7  8]
      :left  [-1  0 -1  7]
      :right [ 8  0  8  7]})

(local dirs
     {:up    [ 0 -1]
      :down  [ 0  1]
      :left  [-1  0]
      :right [ 1  0]})

(fn inc [value] (+ value 1) )
(fn dec [value] (- value 1) )
(fn => [f g] (fn[...] (f (g ...))))

                                        ;funciones del jugador
(fn draw-player [frame] (spr frame player.x player.y 0 1 player.flip))
(fn draw-spr [s]
  (spr s.id s.x s.y s.colorkey s.scale s.flip s.rotate s.w s.h))

(fn player-pos []
  {:x (+ player.x (* player.map-x 240))
   :y (+ player.y (* player.map-y 136))})

(fn move-player [direction]
  "mxover al jugador a la direccion que se le indique :up :down :left :right"
  (set player.x (+ player.x (* player.speed (. direction 1))))
  (set player.y (+ player.y (* player.speed (. direction 2))))
  (set player.moving true))

                                        ;animar sprite
(fn animation [id handler frames]
  (+ id(*(/(% handler 60)120)(* frames 2))))

                                        ;Evaluar tiles
(fn tile [x y](mget (/ x 8) (/ y 8)))
(fn solid [cell](and (>= cell 16) (<= cell 31)  ))

(local solid-tile (=> solid tile))

(fn not-solid-tile [pos dir]
  (let [tile-solid
        (partial(fn [p x y](solid-tile (+ p.x x) (+ p.y y))) pos )]
    (and (not (tile-solid (. dir 1) (. dir 2)))
         (not (tile-solid (. dir 3) (. dir 4))))))


(fn dungeon []
  "Dibujar todos los elementos de la escena"
  (cls 0)
  
  "dibujar mapa"
  (map
   (* player.map-x 30)
   (* player.map-y 17))
  
  "Dibujar al jugador"
  (draw-player
   (if (. player :moving)(animation player.frame (/ (time) 10) 3 )
       (not (. player :moving)) 483 ))

  "hacer todas las acciones"
  (when (> player.x 240)
    (set player.map-x (inc player.map-x))
    (set player.x (- player.x 240) ))

  (when (< player.x 0)
    (set player.map-x (dec player.map-x))
    (set player.x (+ player.x 240) ))

  (when (> player.y 136)
    (set player.map-y (inc player.map-y))
    (set player.y (- player.y 136) ))
  
  (when (< player.y 0)
    (set player.map-y (dec player.map-y))
    (set player.y (+ player.y 136) ))


  "controles del personaje: se tine que devolder player moving a falso cada ciclo para desactivar la animacion"
  (set player.moving false)


  "moverse arriba"
  (when (and (btn 0) (not (btn 1))
             (not-solid-tile (player-pos) dir.up))
    (move-player (. dirs :up))
    (set player.frame 482))
  
  "moverse abajo"
  (when (and (btn 1) (not (btn 0))
             (not-solid-tile (player-pos) dir.down))
    (move-player (. dirs :down))
    (set player.frame 482))

  "moverse izquierda"
  (when (and (btn 2) (not (btn 3))
             (not-solid-tile (player-pos) dir.left))
    (move-player (. dirs :left))
    (set player.frame 485)
    (set player.flip 1))
  
  "moverse derecha"
  (when (and (btn 3) (not (btn 2))
             (not-solid-tile (player-pos) dir.right))
    (move-player (. dirs :right))
    (set player.frame 485)
    (set player.flip 0))

  
  
  (when (btnp 4)
    (trace (+ (table.unpack [1 2 3]) )  ))

  )

(global TIC (fn tic [] (dungeon) ))
;./tic80 game.tic -code-watch game.fnl
