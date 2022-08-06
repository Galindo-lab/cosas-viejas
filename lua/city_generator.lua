
city = {
   ["main"] = {
      descripcion = "main street, es la calle pricipal",
      nodes = {
	 ["calle 1"] = "calle 1",
      }
   },
   
   ["calle 1"] = {
      descripcion = "una calle generica",
      tipo = "calle",
      nodes = {
	 ["main"] = "main",
	 ["calle 2"] = "calle 2",
	 ["calle 3"] = "calle 3"
      }
   },

   ["calle 2"] = {
      descripcion = "calle conectada con la calle 1",
      tipo = "calle",
      nodes = {
	 ["calle 1"] = "calle 1",
	 ["tienda 1"] = "tienda 1"
      }
   },

   ["tienda 1"] = {
      descripcion = "tienda 1 conectada con la calle 2",
      tipo = "tienda",
      nodes = {
	 ["calle 2"] = "calle 2"
      }
   },

   ["calle 3"] = {
      descripcion = "calle fea",
      tipo = "calle",
      nodes = {
	 ["calle 1"] = "calle 1"
      }
   },   
}


function get_keys(tbl)
   local keys = {}
   for key, value in pairs(tbl) do
      table.insert(keys,key)
   end
   return keys
end

function get_nodes(tbl)
   if tbl.nodes ~= nil then
      return get_keys(tbl.nodes)
   else
      return get_keys(tbl)
   end	 
end


function loop()
   local input,ctrl = "main","main"

   while(true)do
      print(ctrl)
      print(city[ctrl].descripcion)

      print("salidas")
      
      print(
	 table.concat(get_nodes(city[ctrl]["nodes"]),"\n")
      )

      input = io.read()

      if city[input] ~= nil and city[ctrl]["nodes"][input] ~= nil  then
	 ctrl = input
      else
	 print("esa opcion no existe")	 
      end

      print("")

      if input == "0" then break; end
   end
end

--[[function node_to_string(dl,node)
   return table.concat({
	 node,
	 "descripcion: "..getnode(dl,node).descripcion,l
	 "tipo:.."..getnode(dl,node).tipo,
	 
		       },"\n")
   end]]

--[[function move()
   print(
      string.format("", )
   )
   end]]
