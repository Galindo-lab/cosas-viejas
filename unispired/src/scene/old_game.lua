

--tilemap.tileset = map.tileset(tilemap.drawable,32)


game_scene = {
   load = function()
      player.drawable = graphics.newImage("images/player.png")
      tilemap.drawable = graphics.newImage("images/tileset.png")
      
   end,
   
   draw = function()
      local x,y =
	 math.floor(player.x/world.tileSize),
         math.floor(player.y/world.tileSize),
			   
      
      map.draw(world.drawable,world.tileset,world.tileSize,world.data)

      local debug_text = {
	 string.format("FPS: %d",love.timer.getFPS( )),
	 string.format("position x,y:  %.2f, %.2f",player.x,player.y),
	 string.format("tiles x,y,v :  %-s %-s",tostring(x),tostring(y))
      }
      
      graphics.print(table.concat(debug_text,"\n"), 10, 10, 0, 2, 2)

      --if world.data[x][y] == nil then
	-- print("ok")
      --end

      graphics.draw(image.prop(player))
      
   end,

   keyboard = function()
      return
	 keyboard.isDown("up"),
         keyboard.isDown("down"),
	 keyboard.isDown("left"),
	 keyboard.isDown("right")
   end,
   

   update = function(dt)
      --capura los estados de las teclas
      local up,down,left,right = game_scene.keyboard()
      
      --player speed
      local speed = 200
      local jumpForce = 800
      local gravity = 500
	 

      --si el boton saltar es precioando y la velocidad vertical es 0
      --entonces salta
      if up and player.vy == 0 then
	 player.vy = -jumpForce
      else
	 --
	 if player.y + player.vy*dt <= game.screen_height then
	    if player.vy < 1000 then
	       player.vy = player.vy + (gravity*10)*dt
	    end
	    
	 else
	    if player.y + (player.vy/2)*dt <= game.screen_height then
	       player.vy = player.vy/2
	    else
	       player.vy = 0
	    end
	    
	 end
      end

      --

      if left and not(right) then
	 player.vx = -speed
      elseif right and not(left) then
	 player.vx = speed
      else
	 player.vx = 0
      end

     
      
      

      player.x = player.x + player.vx*dt
      player.y = player.y + player.vy*dt

      
   end,

   keypressed = function(key)
      if key == "escape" then
	 love.event.push("quit")
      end

      if key == "q" then
	 print("oka")
      end
   end
}


