local module = { version = "1.1" }

local storage = {}
storage.__index = storage

local function new()   
   return setmetatable({
	 data = {},
      }, storage)
end

local function table_tostring(tbl)
   local result = "{"
   for k, v in pairs(tbl) do
      if type(k) == "string" then
	 result = result.."[\""..k.."\"]".."="
      end

      if type(v) == "table" then
	 result = result..table_to_string(v)
      elseif type(v) == "boolean" then
	 result = result..tostring(v)
      else
	 result = result.."\""..v.."\""
      end
      result = result..","
   end

   if result ~= "" then
      result = result:sub(1, result:len()-1)
   end
   return result.."}"
end

function storage:get(key)
   if self.data[key] ~= nil then
      print("id:       ",key)
      print("nombre:   ",self.data[key].nombre)
      print("cantidad: ",self.data[key].cantidad,"\n")
   else
      print("\n","no existe ese registro")
   end
end

function storage:delete(key)
   self.data[key] = nil
end

function storage:push(a,key)
   self.data[key] = a
end

function storage:existRegister(key)
   return not(self.data[key] == nil)
end

function storage:list_register()
   for i,v in pairs(self.data) do
      print("id:",i)
      print("nombre: ",v.nombre)
      print("cantidad: ",v.cantidad,"\n")
   end
end

--[[
   @param format funcion para formatear la tabla
]]
function storage:save()
   local file = io.open("data_registers.lua","w")
   file:write("return "..table_tostring(self.data))
   file:close()
end

--[[
   recargar la base de datos
]]
function storage:load()
   self.data = require("data_registers")
end

return setmetatable(module, {__call = function(_,...) return new(...) end})
