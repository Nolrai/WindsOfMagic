---

function onLoad()
  print("Global.-1.lua: onLoad")
  Global.checkerCount = Global.checkerCount or 0
end

function getCheckerCount()
  print("Global.-1.lua: getCheckerCount")
  return Global.checkerCount
end

function incrementCheckerCount()
  print("Global.-1.lua: incrementCheckerCount")
  Global.checkerCount = Global.checkerCount + 1
end
