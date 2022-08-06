-- blind classes
Storage = require("lib.data")
Screen  = require("lib.screen")

--framework
require("framework.split")
require("framework.tostring")
require("framework.filter")

screen = Screen()
screen:add(require("screens.main"),"main menu")
screen:add(require("screens.exit"),"exit")

storage = Storage()




function loop()
   local buffer = 0
   storage:load()
   repeat
      screen:display("main menu")
      buffer = io.read("*number")

      if buffer == 1 then
	 io.read()

	 print("codigo")
	 local key = io.read("*line")

	 print("nombre")
	 local nombre = io.read("*line")
	 
	 print("cantidad")
	 local cantidad = io.read("*number")


	 if storage:existRegister(key) then
	    print("ese registro ya existe")
	 else
	    storage:push(
	       {
		  nombre = nombre,
		  cantidad = cantidad or 0,
	       },key)
	    
	    storage:save()
	 end
      end

      if buffer == 2 then
	 io.read()

	 print("codigo")
	 local codigo = io.read("*line")

	 storage:get(codigo)
	 storage:save()
      end

      if buffer == 3 then
	 storage:list_register()
      end

      if buffer == 4 then
	 io.read()

	 print("codigo")
	 local codigo = io.read("*line")

	 storage:get(codigo)
	 storage:delete(codigo)
	 storage:save()
      end
      
      if buffer == 0 then
	 screen:display("exit")
	 break
      end

   until(false)
end

loop()
