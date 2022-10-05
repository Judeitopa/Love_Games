require "game"
function love.load()
    love.graphics.setBackgroundColor(0,0.75,0)
    interval = 20
    add_apple()
end

function love.update(dt)
    if state == GameStates.running then
        interval = interval - 1
    if interval < 0 then
        game_update()

        if tail_length <= 5 then
         interval = 20
        else if tail_length > 5 and tail_length <= 10 then
            interval = 15 
        else if tail_length > 10 and tail_length <= 15 then
            interval = 10
        else 
            interval = 5
        end
    end
        end
        
    end
end
end

function love.draw()
  game_draw()
  if state == GameStates.game_over then
    love.graphics.print("Game Over!",330,350,0,4,4)
    love.graphics.print("Press Space to Restart",270,450,0,3,3)
  end
  if state == GameStates.pause then
    love.graphics.print("Pause", 300,300,0,4,4)
  end
end

function love.keypressed(key)

    if key == "escape" then
        love.event.quit()
    else if key =="left" then
     left, right, up , down = true, false , false, false
    else if key =="right" then
        left, right, up , down = false, true , false, false
    else if key =="up" then
        left, right, up , down = false, false , true, false
    else if key =="down" then
        left, right, up , down = false, false , false, true
    else if key == "space" and state == GameStates.game_over then
        game_restart()
    else if key == "p" then  
        if state == GameStates.running then
        state = GameStates.pause 
        else
            state = GameStates.running
        end
    end
    end
    end
end
end
end
end


end