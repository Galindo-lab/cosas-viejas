local imgx, imgy, img, vx, vy, time

function love.load()
	imgx = love.graphics.getWidth() / 2
	imgy = love.graphics.getHeight() / 2
	img = love.graphics.newImage("data/img/thing.png")
	vx = math.random(-400, 400)
	vy = math.random(-400, 400)
	time = 0
end

function love.draw()
	love.graphics.draw(img, imgx, imgy, time, 2+math.sin(time), 2+math.sin(time), img:getWidth() / 2, img:getHeight() / 2)
end

function love.update(dt)
	time = time + dt
	imgx = imgx + (vx * dt)
	imgy = imgy + (vy * dt)
	if imgx < 0 or imgx > 800 then
		vx = vx * -1
	end
	if imgy < 0 or imgy > 800 then
		vy = vy * -1
	end
end