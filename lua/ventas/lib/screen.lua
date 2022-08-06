local module = { version = "1.1" }

local screen = {}
screen.__index = screen

local function new()   
   return setmetatable(
      {
	 s = {},
      }, screen)
end

function screen:add(screen_data,key)
   self.s[key] = screen_data
end

function screen:display(key)
   print(self.s[key])
end

return setmetatable(module,{__call = function(_,...) return new(...) end})
