init = {
    load = function()
        player.drawable = graphics.newImage("images/sheep.png")
    end,

    draw = function()

        graphics.draw(image.prop(player))
    end,

    update = function(dt)
        player.x = player.x + player.vx*dt
        player.y = player.y + player.vy*dt

        if keyboard.isDown("down") then
            player.vy = 500
        elseif keyboard.isDown("up") then
            player.vy = -500
        else
            player.vy = 0
        end

        if keyboard.isDown("right") then
            player.vx = 500
        elseif keyboard.isDown("left") then
            player.vx = -500
        else
            player.vx = 0
        end

        if keyboard.isDown("w") then
            player.r = player.r + (math.rad(100)*dt)
        elseif keyboard.isDown("s") then
            player.r = player.r - (math.rad(100)*dt)
        end
    end,
}
