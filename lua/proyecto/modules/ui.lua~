ui = {
   scene = {},
   create_screen = function(name,screen)
      ui.scene[name] = table.concat(screen,"\n")
   end,

   display_screen = function(name)
      if os.name() == "Linux" or os.name() == "MacOS" then
	 os.execute("clear")
      elseif os.name() == "Windows" then
	 os.execute("cls")
      end
	 
      print(ui.scene[name] or "that screen not exist")
   end,
}
