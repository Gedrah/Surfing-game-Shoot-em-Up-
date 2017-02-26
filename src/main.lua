player_data = require("player")
boss_data = require("boss")
activated = 0

--sprites
local background
local waves

-- wave scrolling management
local wave_x = 0
local wave_y = -2700
local wave_width = 0.5

-- music and sound management
local background_music

-- time
time = 0

function love.keypressed(key)
  if (key == "escape") then
    love.event.quit()
  end
  if (key == "a") then
    if (activated == 0) then
      activated = 1
      proj_x = player_x - player_width
      proj_y = player_y + player_width
    end
  end
end

function love.load()
  background = love.graphics.newImage("media/bg.png")
  waves = love.graphics.newImage("media/wave.png")
  background_music = love.audio.newSource("media/surf.ogg", "stream")
  player_animation()
  boss_animation()
  proj_animation()
  play_music()
end

function love.update(dt)
  time = time + dt
  animation_management()
  wave_scrolling()
  player_command()
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(waves, wave_x, wave_y)
  love.graphics.draw(player, playerSprite[activeFrame], player_x, player_y)
  love.graphics.draw(boss, bossSprite[bossFrame], boss_x, boss_y, 0, 3)
  if (activated == 1) then
    love.graphics.draw(player_proj, projSprite[projframe], proj_x, proj_y, -1.57)
  end
  love.graphics.print(tostring(wave_y), 0, 0)
end


function play_music()
  background_music:setLooping(true)
  --background_music:play()
end


function wave_scrolling()
  wave_y = wave_y + 1
  if (wave_y == 800) then
    wave_y = -2700
  end
end

function animation_management()
  if (time > 0.2) then
    activeFrame = activeFrame + 1
    projframe = projframe + 1
    bossFrame = bossFrame + 1
    time = 0
  end
  if (activeFrame > 3) then
    activeFrame = 1
  end
  if (projframe > 5) then
    projframe = 4
  end
  if (activated == 1) then
    proj_y = proj_y - 10
  end
  if (proj_y < 0) then
    activated = 0
    proj_y = player_y + player_height
  end
  if (bossFrame > 4) then
    bossFrame = 1
  end
end