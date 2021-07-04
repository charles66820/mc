-- Dig a room
local tfun = require("turtleLib")

-- Args and vars def
local width = 20
local length = 11
local height = 6
local haveCeil = true
local args = {...}

if #args == 1 then
  width = tonumber(args[1])
elseif #args == 2 then
  width = tonumber(args[1])
  length = tonumber(args[2])
elseif #args == 3 then
  width = tonumber(args[1])
  length = tonumber(args[2])
  height = tonumber(args[3])
elseif #args == 4 then
  width = tonumber(args[1])
  length = tonumber(args[2])
  height = tonumber(args[3])
  if args[4] == "true" then
    haveCeil = true
  else
    haveCeil = false
  end
elseif #args > 4 then
  print("Usage: ", args[0], " <width> <length> <height> <haveCeil>")
  os.exit()
end

if width <= 0 then
  print("Longeur :")
  width = tonumber(read())
end

if length <= 0 then
  print("Largeur :")
  length = tonumber(read())
end

if height <= 0 then
  print("Hauteur :")
  height = tonumber(read())
end

-- functions
function digCeil()
  tfun.printProcess("Digging ceil...")
  if height >= 3 then
    tfun.digUpAndUp(height - 2)
  end
  if height % 2 == 0 then
    tfun.turnAround()
  end
  tfun.digAndForward(2)
  tfun.digUpAndUp(1)
  turtle.turnLeft()
  tfun.digAndForward(width - 1)
  tfun.turnDigAndForwardRight()
  tfun.digAndForward(width - 1)
  tfun.turnDigAndForwardLeft()
  -- digUpAndForward
  for i = 1, width - 1 do
    while turtle.detectUp() do
      turtle.digUp()
    end
    tfun.digAndForward(1)
  end
  while turtle.detectUp() do
    turtle.digUp()
  end

  tfun.turnDigAndForwardRight()
  -- digUpAndForward
  for i = 1, width - 1 do
    while turtle.detectUp() do
      turtle.digUp()
    end
    tfun.digAndForward(1)
  end
  while turtle.detectUp() do
    turtle.digUp()
  end

  tfun.turnDigAndForwardLeft()
  -- digUpAndForward
  for i = 1, width - 1 do
    while turtle.detectUp() do
      turtle.digUp()
    end
    tfun.digAndForward(1)
  end
  while turtle.detectUp() do
    turtle.digUp()
  end

  tfun.turnDigAndForwardRight()
  tfun.digAndForward(width - 1)
  tfun.turnDigAndForwardLeft()
  tfun.digAndForward(width - 1)
end

function mainLoop()
  shell.run("rect", width, length, height, "true")
  if haveCeil then
    digCeil()
  end
end

function clean()
  if haveCeil then
    tfun.turnAround()
    tfun.digAndForward(width - 1)
    turtle.turnRight()
    tfun.digAndForward(3) -- NOTE: make relative ?
    turtle.turnRight()
    tfun.digDownAndDown(height - 2)
  end
end

function start()
  mainLoop()
  clean()
end

start()
