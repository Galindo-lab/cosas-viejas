
require("modules.ui")
require("res.screens")
require("modules.database")
require("modules.file")
require("init")

test = {}

function registro(codigo,nombre,precio)
   return { codigo = codigo, nombre = nombre, precio = precio }
end

function demo_table(elementos)
   for i=0,elementos do
      print(i)
      DB.push(test,registro(
	 "0x00"..i,
	 "objeto de prueba "..i,
	 math.random(0,20)
      ) )
   end
end

function ingresar_registro()
   return registro(
      print_and_read("Codigo del articulo:"),
      print_and_read("Nombre del articulo:"),
      tonumber(print_and_read("Precio del articulo:"))
   )
end

function ingresar_busqueda()
   return registro(
      not_empty(print_and_read("Codigo del articulo:")),
      not_empty(print_and_read("Nombre del articulo:")),
      tonumber(print_and_read("Precio del articulo:"))
   )
end

function loop()
   test = file.load_data()
   repeat
      ui.display_screen("menu")
      local input = io.read("*line")

      if input == "0" then
	 ui.display_screen("SeeU")
	 io.read()
	 break
      elseif input == "1" then
	 DB.push(test,ingresar_registro())
	 file.save(test)
      elseif input == "2" then
	 DB.search(test,ingresar_busqueda())
	 file.save(test)
	 io.read()
      elseif input == "3" then
	 ui.display_screen("listar")
	 print_tree(test)
	 io.read()
      elseif input == "4" then
	 DB.search(test,ingresar_busqueda(),true)
	 file.save(test)
	 io.read()
      elseif input == "h" then
	 print("Working....")
	 io.read()
      elseif input == "demo" then
	 print("creando elementos de prueba")
	 demo_table(10)
      else
	 print("no exite esa opcion")
      end
   until(false)
end

loop()
