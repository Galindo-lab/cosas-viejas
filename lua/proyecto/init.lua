
--[[
Ejecutar funcion anonima.
   @param fun funcion anonima a ejecurtar
   @param parametros_variables parametros de la funcion anonima
]]

function lambda(fun,...)
   return fun(...)
end

--[[
   revisar que sistema operativo se esta utilzando.
   @return nombre del sitema operativo (Windows, Linux o MacOS), BSD no soportado, valor default Unknown
]]

function os.name()
   return lambda(function(binaryformat)
	 if binaryformat == "dll" then
	    return "Windows"
	 elseif binaryformat == "so" then
	    return "Linux"
	 elseif binaryformat == "dylib" then
	    return "MacOS"
	 else
	    return "Unknown"
	 end
   end,package.cpath:match("%p[\\|/]?%p(%a+)"))
end

----------------------------------------------------------------------


--[[
   analiza si la cadena no es igual a ""
   @param value cadena a evaluar.
   @return nil si values esta vacio.
   @return value si value no esta vacio
]]

function not_empty(value)
   if value == "" or value == nil then
      return nil
   else
      return value
   end
end

--[[
   imprime un mensage y lee un valor
   @param message mensaje a imprimir
   @param config configuracion para io.read, el default es *line, opcional.
   @return el valor leido 
]]

function print_and_read(message,config)
   print(message)
   return io.read(config or "*line")
end

