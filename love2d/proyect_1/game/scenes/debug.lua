
player = {x = 0, y = 0 }

sceneManger:createScene("debug",
{
   draw = function()
      --push:start()
      love.graphics.setColor(0,0.50,0.5,0.5)
      love.graphics.rectangle("fill", 0,0, 800, 600 )

      love.graphics.setColor(1,0,0,1)
      love.graphics.rectangle("fill",player.x,player.y,50,50)
      love.graphics.print("X:"..player.x.." Y:"..player.y)

      --push:finish()
   end,

   update = function()
      if love.keyboard.isDown( "down" ) then
	 player.y = player.y + 5
      end

      if love.keyboard.isDown("up") then
	 player.y = player.y - 5
      end

      if love.keyboard.isDown("left") then
	 player.x = player.x - 5
      end

      if love.keyboard.isDown("right") then
	 player.x = player.x + 5
      end
   end,
})
