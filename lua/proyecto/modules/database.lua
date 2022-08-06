--[[
   muestra todos los valores de una tabla
   @param data tabla donde estan contenidos los datos.
   @param tabs tabulacion para mostrar los datos, opcioal.
]]
function print_tree(data,tabs)
   for key,value in pairs(data) do
      if type(value) == "table" then
	 print_tree(value,(tabs or -1) + 1)
	 print("")
      else
	 print(string.rep("\t",tabs or 0)..key..":",value)
      end
   end
end


DB = {
   --[[
      agregar un registro a la tabla
      @param data tabla donde estan contenidos los datos.
      @param registro registro para agregar a la tabla.
   ]] 
   push = function(data,registro)
      table.insert(data,registro)
   end,

   --[[
      buscar elementos en la tabla, o eliminarlos si se desea
      @param data tabla donde estan contenidos los datos.
      @param search tabla con la que se compararan los datos de la tabla.
      @param remove pasar positivo si se desean eliminar los registros que coinciden con la busqueda. 
]]
   search = function(data,search,remove)
      for i, register in ipairs(data) do
	 for key, value in pairs(register) do
	    if search[key]~=nil and string.find(value, search[key]) then
	       if remove then
		  table.remove(data, i, x)
	       else
		  print_tree(register,0)
		  print("")
	       end
	       break
	    end
	 end
      end
   end,
      
}
