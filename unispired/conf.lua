function love.conf(t)
    t.window = {
        title = "unispired"        ,-- The window title (string)
        icon = nil                 ,-- Filepath to an image to use as the window's icon (string)
        width = 240*4                ,-- The window width (number)
        height = 136*4               ,-- The window height (number)
        borderless = false         ,-- Remove all border visuals from the window (boolean)
        resizable = true           ,-- Let the window be user-resizable (boolean)
        minwidth = 240*4             ,-- Minimum window width if the window is resizable (number)
        minheight = 136*4            ,-- Minimum window height if the window is resizable (number)
        fullscreen = false         ,-- Enable fullscreen (boolean)
        fullscreentype = "exclusive" ,-- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
        usedpiscale = true         ,-- Enable automatic DPI scaling (boolean)
        console = true             ,-- allowing you to see the result of print calls
    }
    
end
