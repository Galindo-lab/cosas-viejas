-- Modules
push = require("lib.push")
sceneManager = require("framework.scene")

--blind clases

--constants
require("game.settings")
require("game.scale")

function love.resize(w, h)
  push:resize(w, h)
end


function love.draw()
   push:start()
   love.graphics.setColor(1,0,0,1)
   love.graphics.rectangle("fill", 100, 100, 50,50)
   --   love.graphics.print("Hello World!", 400, 300)

   push:finish()
end
