local module = {_version = "1.0"}

local grafo = {}

grafo.__index = grafo

local function new()
   return setmetatable({}, grafo)
end

return setmetatable(module, {__call = function(_,...) return new(...) end})
