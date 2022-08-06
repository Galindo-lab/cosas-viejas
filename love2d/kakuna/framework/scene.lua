local sceneManger = {
   scenes = {},
}

local nothing = function() end

sceneManger.__index = sceneManger

--[[
   crea una nueva escena
   @param update funcion de update
   @param draw   funcion de dibujar
]]

local function new(update, draw)
   return {
      update = update or nothing,
      draw = draw or nothing,
   }
end

--[[
   crea una escena nueva
   @param index nombre de la escena
]]

function sceneManger:createScene(index, scene)
   self.scenes[index] = new(scene.update,scene.draw)
end

--[[
   cambia la escena actual
   @param index nombre de la escena
]]

function sceneManger:startScene(index)
   love.draw = self.scenes[index].draw
   love.update = self.scenes[index].update
end

return sceneManger
