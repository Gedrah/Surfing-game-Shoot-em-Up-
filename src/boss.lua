boss = love.graphics.newImage("media/boss.png")
boss_proj = love.graphics.newImage("media/attack.png")
boss_beam = love.graphics.newImage("media/beam.png")

--boss sprite management
bossSprite = {}
boss_width = 96
boss_height = 96
bossFrame =1
boss_x = (love.graphics.getWidth() / 2) - (boss_width * 5/ 2)
boss_y = -boss_height * 5 / 2
speed = 3

--projectile management
projbossHeight = 153
projbossWidth = 153
projbossframe = 1
projbossSprite = {}
projboss_x = love.graphics.getWidth() / 2 + projbossWidth / 2
projboss_y = boss_y + boss_height * 5

--beam management
beamHeight = 164
beamWidth = 119.4
beamFrame = 8
beamSprite = {}
beam_x = love.graphics.getWidth() / 2 + beamWidth / 2 - 10
beam_y = boss_y + boss_height * 5 + beamHeight * 6 - beamHeight+ 20

function boss_animation()
  framei = 0
  framej = 0
  l = 0
  for j=1, 3 do 
    for i=1, 4 do
      bossSprite[l] = love.graphics.newQuad(0 + framei, 0 + framej, boss_width, boss_height, boss:getDimensions())
      framei = framei + 96
      l = l + 1
    end
    framej = framej + 96
    framei = 0
  end
end

function proj_animation()
  frame = 0
  for i=1, 6 do
    projbossSprite[i] = love.graphics.newQuad(0 + frame, 0, projbossWidth, projbossHeight, boss_proj:getDimensions())
    frame = frame + 153
  end
end

function beam_animation()
   frame = 0
  for i=1, 10 do
    beamSprite[i] = love.graphics.newQuad(0 + frame, 0, beamWidth, beamHeight, boss_beam:getDimensions())
    frame = frame + 119.4
  end
end