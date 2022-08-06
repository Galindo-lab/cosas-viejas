game_scene = {
   jump_pressed = false,

   draw = function()
      love.graphics.polygon("line", player.body:getWorldPoints( player.shape:getPoints()))
      love.graphics.polygon("fill",static.b:getWorldPoints(static.s:getPoints()))

      local x,y = player.body:getLinearVelocity()
      love.graphics.print(x.."\n"..y)
   end,

   update = function(dt)
      world:update(dt)

      
      local x,y = player.body:getLinearVelocity()

      if love.keyboard.isDown("right") then
	 player.body:applyForce(1000,0)
      elseif love.keyboard.isDown("left") then
	 player.body:applyForce(-1000,0)
      end
      
      if love.keyboard.isDown("up") and not(game_scene.jump_pressed) then
	 game_scene.jump_pressed = true
	 player.body:applyForce(0, -5000)
      elseif not(love.keyboard.isDown("up"))  then
	 game_scene.jump_pressed = false
      end

   end,
}
