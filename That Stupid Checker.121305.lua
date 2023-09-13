button_parameters = {}
button_parameters.label = 'Press Me'
button_parameters.position = {0,0.8,0}
button_parameters.rotation = {0,0,0}
button_parameters.width = 500
button_parameters.height = 500
button_parameters.font_size = 10

function onload()
  count = Global.call('getCheckerCount')
  Global.call('incrementCheckerCount')
  message = "That Stupid Checker.121305.lua: onload(): count: %d"
  print(string.format(message, count))
  if (count == 0)
  then
    self.setName('That Stupid Checker')
    button_parameters.click_function = 'buttonClicked'
    button_parameters.function_owner = self
    self.createButton(button_parameters)
  else
    self.setName('That Stupid Checker ' .. count)
    Wait.frames(jump, 1)
  end
end

function new ()
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function buttonClicked()
    local newChecker = self.clone()
    print(newChecker == nil)
end

function jump ()
  print('Jump')
  self.addForce({0,100,0}, 3)
end
