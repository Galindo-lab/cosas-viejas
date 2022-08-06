local module = {_version = "1.0"}

local node = {}

node.__index = node

local function new(data)
   return setmetatable(
      {
	 data = data or {},
	 nodes = {}
      }, node)
end

function node:set_data(data)
   self.data = data or {}
end

function node:join(key)
   self.nodes[key] = key
end

return setmetatable(module, {__call = function(_,...) return new(...) end})
