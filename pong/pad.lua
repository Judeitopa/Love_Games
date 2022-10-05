pad = Entity:extend()

function pad:new()
    pad.super.new(self,50,100,10,100)
     self.keyUp = "up"
     self.keyDown = "down"    
      
end
   

function pad:update(dt)
   if love.keyboard.isDown(self.keyUp)then
        self.ySpeed = -400
     
     else if love.keyboard.isDown(self.keyDown) then
        self.ySpeed = 400
    
    else self.ySpeed = 0
    end
end

    pad.super.update(self, dt)
end