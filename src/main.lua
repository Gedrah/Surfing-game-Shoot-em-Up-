local player

function love.keypressed(key)
  if (key == "escape") then
    love.event.quit()
  end
end

function love.load()
  player = love.graphics.newImage("media/surfer.png")
end

function love.update(dt)
end

function love.draw()
  love.graphics.draw(player, 0, 0)
end