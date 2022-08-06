
local module = {
  _version = "1.0",
  _description = "clase generadora de ciudades",
  _url = "",
  _license = [[
    Copyright (c) 2018 themousery
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
  ]]
}

local generador = {}
generador.__index = generador 

--[[local function new(x,y)
   return setmetatable(
      {x
	 x=x or 0,
	 y=y or 0
      }, generador)
   end]]


local function new(places)
   return setmetatable(
      {
	 mapa = generar_mapa(places),
      }, generador)
end


local function generar_mapa(places)
   local map = {}
      
   for index, place in ipairs(places) do
      map[place].nodos = {"hola"}
   end

   return map
end


return setmetatable(module, {__call = function(_,...) return new(...) end})
