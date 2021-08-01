-- Dig a room
local cfun = computerLib
local tfun = turtleLib

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
  print("Usage: ", arg[0] or fs.getName(shell.getRunningProgram()), " <width> <length> <height> <haveCeil>")
  return 128
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
  cfun.printProcess("Digging ceil...")
  tfun.digAndForward(1)
  if height >= 3 then
    tfun.digUpAndUp(height)
  end
  -- if height % 2 == 0 then
  --   tfun.turnAround()
  -- end
  turtle.turnLeft()
  tfun.digAndForward(3)
  turtle.turnRight()

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
    tfun.digDownAndDown(height)
    turtle.turnLeft()
    tfun.digAndForward(1)
    tfun.turnAround()
  end
end

function start()
  mainLoop()
  clean()
end

start()
