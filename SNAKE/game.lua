GameStates = {pause = "pause", running = "running", game_over = "game over"}
state = GameStates.running
local snakeX = 15
local snakeY = 15
local dirX   = 0
local dirY   = 0

local distance
local apple_Width = 20
local apple_Height= 20

local SIZE_1   = 30
local SIZE_2  = 25
local appleX = 0
local appleY = 0
tail_length = 0
local tail = {}



function add_apple()
math.randomseed(os.time())
appleX = math.random(10,SIZE_1 - 1)
appleY = math.random(10,SIZE_2 - 1)

end

function game_draw()
  for _, v in ipairs(tail) do
  love.graphics.rectangle("fill",v[1]*SIZE_1,v[2]*SIZE_1,30,30,10,10)
  end
love.graphics.print("score: ".. tail_length,10,10,0,1.5,1.5,0,0,0,0)
love.graphics.rectangle("fill",snakeX*SIZE_1,snakeY*SIZE_1,30,30,10,10)
love.graphics.rectangle("fill",appleX*SIZE_2, appleY*SIZE_2, apple_Width, apple_Height, 5, 5)
end



function game_update()
    if up and dirY == 0 then 
        dirX, dirY = 0, -1
          elseif down and dirY ==0 then
        dirX,dirY = 0, 1
           else if left and dirX == 0 then
        dirX,dirY = -1, 0
        else if  right and dirX == 0 then
         dirX,dirY = 1,0
           end
        end
  end
  local oldX = snakeX
  local oldY = snakeY
 snakeX = snakeX + dirX
 snakeY = snakeY + dirY

 

 distance = math.sqrt((appleX*SIZE_2 - snakeX*SIZE_1)^2 + (appleY*SIZE_2 - snakeY*SIZE_1)^2)
 if distance < apple_Width then
   add_apple()
   tail_length = tail_length + 1
   table.insert(tail, {snakeX,snakeY})
 else if distance < apple_Height then
   add_apple()
   tail_length = tail_length + 1
   table.insert(tail, {snakeX,snakeY})
 end
 end

 if snakeX < 0 then 
  snakeX = SIZE_1 
 else if snakeX > SIZE_1  then
  snakeX = 0
 else if snakeY > SIZE_2  then
  snakeY = 0  
 else if snakeY < 0 then
  snakeY = SIZE_2 - 1
 end
end
 end
end

if tail_length > 0 then
for _, v in ipairs(tail) do
local x,y = v[1], v[2]
    v[1], v[2] = oldX , oldY
    oldX,oldY = x, y
end

end

for _, v in ipairs(tail) do
if snakeX == v[1] and snakeY == v[2] then
  state = GameStates.game_over
end
end
end


function game_restart()
    snakeX, snakeY = 15, 15
    dirX , dirY =   0, 0
    tail = {}
    up,down,left,right = false, false, false, false
    tail_length = 0
    state = GameStates.running
    add_apple()
end