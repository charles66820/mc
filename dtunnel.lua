-- Mine a circle down tunnel
local tfun = require("turtleLib")
-- Args and vars def
local deeper = 0
local invert = false
local args = {...}

if #args == 1 then
  deeper = tonumber(args[1])
elseif #args == 2 then
  deeper = tonumber(args[1])
  if args[2] == "true" then
    invert = true
  else
    invert = false
  end
elseif #args > 2 then
  print("Usage: ", args[0], " <deeper> <invert>")
  os.exit()
end

if deeper <= 0 then
  print("Profondeur :")
  deeper = tonumber(read())
end

-- functions
function circle()
  if not invert then
    tfun.digDownAndDown(1)
  else
    tfun.digUpAndUp(1)
  end
  for i = 1, 3 do
    turtle.dig()
    turtle.turnRight()
  end
  tfun.digAndForward(3)
  turtle.turnRight()
  for i = 1, 4 do
    tfun.digAndForward(1)
    turtle.turnRight()
    tfun.digAndForward(1)
    for j = 1, 2 do
      turtle.dig()
      turtle.turnLeft()
      tfun.digAndForward(1)
      turtle.turnRight()
      tfun.digAndForward(1)
    end
  end
  turtle.turnRight()
  tfun.digAndForward(3)
  turtle.turnLeft()
end

function mainLoop()
  for i = 1, deeper do
    circle()
    tfun.printProcess("Profondeur: " .. i .. "/" .. deeper)
  end
end

function clean()
  if not invert then
    tfun.digDownAndDown(deeper)
  else
    tfun.digUpAndUp(deeper)
  end
end

function start()
  mainLoop()
  clean()
end

start()
