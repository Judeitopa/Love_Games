Game = object:extend()

function Game:new()
    self.padLeft = pad()
    self.padLeft.keyUp = "w"
    self.padLeft.keyDown = "s"
    self.padRight = pad()
    self.padRight.x = 740
    self.ball = ball()

    self.scoreLeft = 0
    self.scoreRight = 0
    
end

function Game:update(dt)
    self.padLeft:update(dt)
    self.padRight:update(dt)
    self.ball:update(dt)
    self.ball:bounce(self.padRight)
    self.ball:bounce(self.padLeft)

    local ball_status = self.ball:getOutOfBounds()

    if ball_status == "left" then
         self.scoreRight = self.scoreRight + 1
         self.ball = ball()
    else if ball_status == "right" then
        self.scoreLeft = self.scoreLeft + 1
        self.ball = ball()
    end 
end
end
 
function Game:draw()
    for i=0,10 do
    love.graphics.rectangle("fill",390,80 * i, 20, 60)
    end
    self.padLeft:draw()
    self.padRight:draw()
    self.ball:draw()
    love.graphics.print(self.scoreLeft .. " - " .. self.scoreRight,350,20,0,4,4)
end