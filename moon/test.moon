-- title:  game title
-- author: game developer
-- desc:   short description
-- script: moon

t=0
x=96
y=24

sprites = {}

dirs = {
  up:{0, -1},
  down:{0, 1},
  left:{-1, 0},
  right:{1, 0}
}

new_sprite = (id,x,y,colorkey,scale,flip,rotate,w,h) -> 
  table.insert(sprites,{
    id: id,
    x: x,
    y: y,
    colorkey: colorkey or -1,
    scale: scale or 1,
    flip: flip or 0,
    rotate: rotate or 0,
    w: w or 1,
    h: h or 1
  })

get_sprite_prop = (s) ->
  s.id,s.x,s.y,s.colorkey,s.scale,s.flip,s.rotate,s.w,s.h


export TIC=->
  if btn 0
    y-=1
  if btn 1
    y+=1
  if btn 2
    x-=1
  if btn 3
    x+=1

  cls 13

  --spr 1+(t%60)//30*2,x,y,14,3,0,0,2,2
  print "HELLO WORLD! FG",84,84
  t+=1
