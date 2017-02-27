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
    proj_y = player_y + player_height    
  end
  if (key == "e") then
    projboss_y = projboss_y + 10
  end
end

function love.load()
  background = love.graphics.newImage("media/bg.png")
  waves = love.graphics.newImage("media/wave.png")
  background_music = love.audio.newSource("media/surf.ogg", "stream")
  player_animation()
  boss_animation()
  beam_animation()
  proj_animation()
  play_music()
end

function love.update(dt)
  time = time + dt
  for i,v in ipairs(projPlayer) do
		v.y = v.y - (v.dy + speed)
	end
  animation_management()
  wave_scrolling()
  player_command()
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(waves, wave_x, wave_y)
  create_tears()
  love.graphics.draw(player, playerSprite[activeFrame], player_x, player_y)
  love.graphics.draw(boss, bossSprite[bossFrame], boss_x, boss_y, 0, 5)
  love.graphics.draw(boss_proj, projbossSprite[projbossframe], projboss_x, projboss_y, 1.57)
  love.graphics.draw(boss_beam, beamSprite[beamFrame], beam_x, beam_y, 3.15, 1, 6)
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
    beamFrame = beamFrame - 1
    projbossframe = projbossframe + 1
    time = 0
  end
  if (activeFrame > 3) then
    activeFrame = 1
  end
  if (projbossframe > 5) then
    projbossframe = 4
  end
  if (bossFrame > 3) then
    bossFrame = 1
  end
  if (beamFrame < 1) then
    beamFrame = 10
  end
  projboss_y = projboss_y + 5
  if (projboss_y > love.graphics.getHeight()) then
    projboss_y = boss_y + boss_height * 5 
  end
end