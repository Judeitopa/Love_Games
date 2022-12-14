BUTTON_HEIGHT = 64
local

function newButton(text, fn)
return {
    text = text,
    fn = fn
}
end
 
local buttons = {}

function love.load()

    table.insert(buttons, newButton(
        "Start Game",
    function()
      print("Starting game")
    end))

    table.insert(buttons, newButton(
        "Load Game",
    function()
      print("Loading gamed")
    end))

    table.insert(buttons, newButton(
        "Settings",
    function()
      print("going to settings menu")
    end))

    table.insert(buttons, newButton(
        "Exit",
    function()
      love.event.quit(0)
    end))
end

function love.update(dt)
end

function love.draw()
    
    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight()

    local button_width = ww * (1/3)
    for i, button in ipairs(buttons) do
        love.graphics.rectangle("fill",
        (ww * 0.5) - (button_width * 0.5),
    (wh * 0.5) - (BUTTON_HEIGHT * 0.5),
      button_width,
      BUTTON_HEIGHT
    )
        

    end

end

