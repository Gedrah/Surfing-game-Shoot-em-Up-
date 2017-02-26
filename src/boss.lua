boss = love.graphics.newImage("media/boss.png")

--boss sprite management
bossSprite = {}
boss_width = 96
boss_height = 96
bossFrame = 1
boss_x = (love.graphics.getWidth() / 2) - (boss_width * 3/ 2)
boss_y = 0
speed = 3

function boss_animation()
  frame = 0
  for i=1, 4 do
    bossSprite[i] = love.graphics.newQuad(0 + frame,0,boss_width, boss_height, boss:getDimensions())
    frame = frame + 96
  end
end
