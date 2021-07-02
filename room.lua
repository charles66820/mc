local tfun = require("turtleLib")

-- Args and vars def
local width = 20
local length = 11
local height = 6
local haveCeil = true
local args = { ... }

if #args >= 1 then
  width = tonumber(args[1])
end

-- functions
function digCeil()
  tfun.digUpAndUp(1)
  if height % 2 == 0 then tfun.turnAround() end
  tfun.digAndForward(2)
  tfun.digUpAndUp(1)
  turtle.turnLeft()
  tfun.digAndForward(width-2)
  turtle.turnRight()
  tfun.digAndForward(1)
  turtle.turnRight()
  tfun.digAndForward(width-2)
  turtle.turnLeft()
  while turtle.detectUp() do
    turtle.digUp()
  end
  tfun.digAndForward(1)
  turtle.turnLeft()
  for i = 1, width-2 do
    while turtle.detectUp() do
      turtle.digUp()
    end
    tfun.digAndForward(1)
  end
  turtle.turnRight()
  while turtle.detectUp() do
    turtle.digUp()
  end
  tfun.digAndForward(1)
  turtle.turnRight()
  for i = 1, width-2 do
    while turtle.detectUp() do
      turtle.digUp()
    end
    tfun.digAndForward(1)
  end
  turtle.turnLeft()
  while turtle.detectUp() do
    turtle.digUp()
  end
  tfun.digAndForward(1)
  turtle.turnLeft()
  for i = 1, width-2 do
    while turtle.detectUp() do
      turtle.digUp()
    end
    tfun.digAndForward(1)
  end
  turtle.turnRight()
  tfun.digAndForward(1)
  turtle.turnRight()
  tfun.digAndForward(width-2)
  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnLeft()
  tfun.digAndForward(width-2)
end

function mainLoop()
  shell.run("rect " .. width .. length .. height .. "true")
  if haveCeil then digCeil() end
end

function clean()
  -- TODO
end

function start()
  mainLoop()
  clean()
end

start()