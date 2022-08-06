function get_keys(tbl)
   local keys = {}
   for key, value in pairs(tbl) do
      table.insert(keys,key)
   end
   return keys
end


player = {
   name = "Luis",  
}

dialogs = {
   ["bienvenido"] = {
      name = "Dra. Thera",
      text = "Buenos días, hoy te voy a atender. Mi nombre es Thera soy doctora mucho gusto "..player.name..".",

      answ = {
	 ["Buenos dias Dra"] = "continuar",
	 ["Ya me quiero ir"] = "responder",
      },
   },

   node = function(self,node)
      return self[node]
   end,
   answers = function(self,node)
      return get_keys(self[node].answ)
   end,
}

function loop()
   local current_node = "bienvenido"
      
   while(true) do
      print("")
   end
   
   return 0
end

