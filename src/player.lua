player = love.graphics.newImage("media/surfer.png")
player_proj = love.graphics.newImage("media/attack.png")

--player sprite management
playerSprite = {}
activeFrame = 1
player_x = 80
player_y = 600
speed = 3
player_width = 50
player_height = 64

--projectile management
projHeight = 153
projWidth = 153
projframe = 1
projSprite = {}
proj_x = player_x - player_width
proj_y = player_y + player_height

function player_animation()
  playerSprite[0] = love.graphics.newQuad(0,192,player_width, player_height, player:getDimensions())
  playerSprite[1] = love.graphics.newQuad(50,192,player_width, player_height, player:getDimensions())
  playerSprite[2] = love.graphics.newQuad(100,192,player_width, player_height, player:getDimensions())
  playerSprite[3] = love.graphics.newQuad(150,192, player_width, player_height, player:getDimensions())
end

function proj_animation()
  frame = 0
  for i=1, 6 do
    projSprite[i] = love.graphics.newQuad(0 + frame, 0, projWidth, projHeight, player_proj:getDimensions())
    frame = frame + 153
  end
end

function player_command()
  if love.keyboard.isDown("left") then
    if (player_x > 0) then
        player_x = player_x - speed
    end
  end
  if love.keyboard.isDown("right") then
    if (player_x < love.graphics.getWidth() - 50) then
      player_x = player_x + speed
    end
  end
  if love.keyboard.isDown("up") then
    if (player_y > 0) then
      player_y = player_y - speed
    end
  end
  if love.keyboard.isDown("down") then
    if (player_y < love.graphics.getHeight() - 64) then
      player_y = player_y + speed
    end
  end
end

