image = {
    colide = function()
        --
    end,

    --[[
        @param img imagen para obtener propiedades
        @return drawable A drawable object.
        @return x The position to draw the object (x-axis)
        @return y The position to draw the object (y-axis)        
        @return r Orientation (radians)
        @return sx Scale factor (x-axis) 
        @return sy Scale factor (y-axis) 
        @return ox Origin offset (x-axis) 
        @return oy Origin offset (y-axis)
    ]]
    
    prop = function(img)
        return
           img.drawable,
           img.x,
           img.y,
           img.r,
           img.sx,
           img.sy,
           img.ox,
           img.oy  
    end
}
