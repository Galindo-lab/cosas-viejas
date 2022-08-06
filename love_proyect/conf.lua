function love.conf(t)
    t.window = {
        title = "unispired"        ,-- The window title (string)
        icon = nil                 ,-- Filepath to an image to use as the window's icon (string)
        width = 800                ,-- The window width (number)
        height = 600               ,-- The window height (number)
        borderless = false         ,-- Remove all border visuals from the window (boolean)
        resizable = true           ,-- Let the window be user-resizable (boolean)
        minwidth = 800             ,-- Minimum window width if the window is resizable (number)
        minheight = 600            ,-- Minimum window height if the window is resizable (number)
        fullscreen = false         ,-- Enable fullscreen (boolean)
        fullscreentype = "desktop" ,-- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
        usedpiscale = true         ,-- Enable automatic DPI scaling (boolean)
        console = true             ,-- allowing you to see the result of print calls
    }
    
end