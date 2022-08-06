
--resolucion del juego
local gameWidth, gameHeight = 640, 480

-- tamaño de la ventana
local windowWidth, windowHeight = love.window.getDesktopDimensions()

push:setupScreen(gameWidth, gameHeight, windowWidth*0.7, windowHeight*0.7,settings.view)
