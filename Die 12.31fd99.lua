count = nil
vScale = 10
sizeChange = 0.1

function onLoad()
  self.roll()
  count = Global.getVar("count")
  self.setName("Die " .. count)
  print("onLoad: " .. self.getName())
  Global.call("incrementCount")

  if count > 0 then
    self.roll()
    self.scale({sizeChange, sizeChange, sizeChange})
    Wait.condition(start, isDoneMoving, 3, errorStart)
  end

end

numDice = 50
rainDuration = 5

function makeDie()
  print("makeDie: " .. self.getName())
  self.clone()
end

function rain()
  print("rain: " .. self.getName())
  for i = 1, numDice do
    Wait.time(makeDie, i * rainDuration / numDice)
  end
end

function start()
  print("start: " .. self.getName())
  self.rotate({0, count * 360 / numDice, 0}, false, true)
  Wait.condition(jump, isDoneMoving, 3, errorStart)
end

function jump()
  print("jump: " .. self.getName())
  self.rotate({x = 0, y = count * 360 / numDice, z = 0})
  self.setPositionSmooth({0, 50, 0}, false, true)  
  Wait.condition(afterJumping, isDoneMoving, 3, errorAfterJumping)
end

function afterJumping()
  print("afterJumping: " .. self.getName())
  v = self.getTransformForward()
  print(v)
  self.setVelocity(v * vScale)
  self.scale({1/sizeChange, 1/sizeChange, 1/sizeChange})
end

function isDoneMoving()
  return self.isSmoothMoving() == false
end

function errorAfterJumping()
  print("Error: Die did not finish jumping: " .. self.getName())
end

function errorStart()
  print("Error: Die did not finish jumping: " .. self.getName())
end
