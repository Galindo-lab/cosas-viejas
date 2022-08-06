scale = {
    draw = function()
        graphics.push()
        
        -- scale horizontally
        graphics.scale(love.graphics.getWidth() / game.screen_width)
        
        -- or scale vertically
        -- love.graphics.scale(love.graphics.getHeight() / game.screen_height)
    
    
        -- drawable area
        graphics.setColor(0,1,0,1)
        graphics.rectangle("fill", 0,0, game.screen_width, game.screen_height )
    
        -- a red square
        graphics.setColor(1,0,0,1)
        graphics.rectangle("fill", player.x,player.y, 50,50)
        graphics.pop()
    end,
    
    update = function(dt)
        player.x = player.x + player.vx*dt
        player.y = player.y + player.vy*dt

        if love.keyboard.isDown("down") then
            rect.vy = 500
        elseif love.keyboard.isDown("up") then
            player.vy = -500
        else
            player.vy = 0
        end

        if love.keyboard.isDown("right") then
            player.vx = 500
        elseif love.keyboard.isDown("left") then
            player.vx = -500
        else
            player.vx = 0
        end
    end,
}