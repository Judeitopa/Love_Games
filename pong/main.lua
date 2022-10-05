function love.load()
    object = require "classic"
    
    require "game"
    require "entity"
    require "pad"
    require "ball"
    

    game = Game()
end

function love.update(dt)
     game:update(dt)
end

function love.draw()
     game:draw()
end

function love.keypressed(k)
     if k == "r" then
          love.load()
     end  
     end