--[[player = {
    drawable = "none",
    x = 0,
    y = 0,
    r = 0,
    --sx = 1,
    --sy = 1,
    ox = 16,-- 78/100,
    oy = 32,-- 100/2,

    vx=0,
    vy=0
   }]]

player = {}
player.body = love.physics.newBody(world, 100,100,"dynamic")
player.body:setMass(10)
player.shape = love.physics.newRectangleShape(32,32)
player.fixture = love.physics.newFixture(player.body,player.shape)
player.fixture:setRestitution(0)
