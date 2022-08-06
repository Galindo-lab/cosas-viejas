map = {

   --[[
     @param drawable elemento dibujable (imagen del tilemap)
     @param tileset secciones en las que el drawable esta dividido 
      @see map.tileset para mas infomracion del tileset
     @param tile_size espaciado entre las "tiles" del mapa, recomendado usar el tamaño en el que se dividio las tiles
     @param layout disposicon del "tilemap", tiene que ser una lista bidimencinal 
   ]]

   draw = function(drawable,tileset,tile_size,layout)
      for i=1,#layout do
	 for j=1,#layout[i] do
	    local cell = layout[i][j]
	    if tileset[cell] ~= nil then
	       love.graphics.draw(
		  drawable,
		  tileset[cell],
		  (j-1)*tile_size,
		  (i-1)*tile_size
	       )
	    end
	 end
	 
      end
   end,

   --[[
      @param drawable elemento dibujable para dividir
      @param tileSize tamaño de las "tiles" o secciones en las que se va a dividir el drawable
      @param padding espaciado entre las tiles 
      @return el drawable dividido en seciones
   ]]
   
   tileset = function(drawable,tileSize,padding)
      local height,width = drawable:getDimensions()
      local tileset = {}
      local padding = padding*2 or 0
      
      local section = function(x,y,size,drawable)
	 return love.graphics.newQuad(x,y,size,size,drawable:getDimensions())
      end

      for i = 0, width/tileSize-1 do
	 for j = 0, height/tileSize-1 do
	    table.insert(tileset, section(
		(j*tileSize)+padding,
		(i*tileSize)+padding,
		tileSize,
		drawable)
	   )
	 end
	 
      end

      return tileset      
   end,

   get = function(map,x,y)
      return map[x][y]
   end,
   
}
