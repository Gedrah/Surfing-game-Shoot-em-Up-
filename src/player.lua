player = love.graphics.newImage("media/surfer.png")

--player sprite management
playerSprite = {}
activeFrame = 1
player_x = 80
player_y = 600
speed = 200
player_width = 50
player_height = 64

--projectile management
projHeight = 153
projWidth = 153
projframe = 1
projPlayer = {}
proj_x = player_x - player_width / 2
proj_y = player_y + player_height / 2


function player_animation()
  playerSprite[0] = love.graphics.newQuad(0,192,player_width, player_height, player:getDimensions())
  playerSprite[1] = love.graphics.newQuad(50,192,player_width, player_height, player:getDimensions())
  playerSprite[2] = love.graphics.newQuad(100,192,player_width, player_height, player:getDimensions())
  playerSprite[3] = love.graphics.newQuad(150,192, player_width, player_height, player:getDimensions())
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
  if (love.keyboard.isDown("a")) then
      proj_x = player_x + player_width / 2
      proj_y = player_y + player_height / 2
      table.insert(projPlayer, {x = proj_x, y = proj_y, dx = speed, dy = speed})
      activated = 1
  end
end

function create_tears()
  love.graphics.setColor(255, 255, 255)
  for i,v in ipairs(projPlayer) do
		love.graphics.circle("fill", v.x, v.y, 3)
	end
end
