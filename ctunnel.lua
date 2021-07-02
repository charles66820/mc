-- Mine a circle tunnel
local tfun = require("turtleLib")
-- Args and vars def
local width = 4
local args = {...}

if #args >= 1 then
  width = tonumber(args[1])
end

-- functions
function circle()
  tfun.digAndForward(1)
  tfun.digUpAndUp(1)
  turtle.turnLeft()
  turtle.digUp()
  tfun.digAndForward(1)
  turtle.dig()
  turtle.digDown()
  for i = 1, 2 do
    tfun.digUpAndUp(1)
    turtle.digUp()
    tfun.digAndForward(1)
    turtle.dig()
  end
  for i = 1, 2 do
    tfun.digUpAndUp(1)
    turtle.dig()
  end
  turtle.digUp()
  tfun.turnAround()
  tfun.digAndForward(1)
  tfun.digUpAndUp(1)
  turtle.digUp()
  tfun.digAndForward(1)
  turtle.digDown()
  turtle.dig()
  tfun.digUpAndUp(1)
  turtle.digUp()
  for i = 1, 2 do
    tfun.digAndForward(1)
    turtle.digUp()
  end
  for i = 1, 2 do
    turtle.dig()
    tfun.digDownAndDown(1)
    turtle.digDown()
    tfun.digAndForward(1)
  end
  for i = 1, 2 do
    turtle.dig()
    tfun.digDownAndDown(1)
  end
  turtle.dig()
  turtle.digDown()
  tfun.turnAround()
  tfun.digAndForward(1)
  turtle.dig()
  for i = 1, 2 do
    tfun.digDownAndDown(1)
    turtle.digDown()
    tfun.digAndForward(1)
  end
  tfun.digUpAndUp(3)
  turtle.digUp()
  turtle.dig()
  tfun.turnAround()
  turtle.dig()
  turtle.turnLeft()
  for i = 1, 4 do
    tfun.digDownAndDown(1)
  end
end

function mainLoop()
  local lwidth = width
  while lwidth > 0 do
    circle()
    lwidth = lwidth - 1
  end
end

function clean()
  tfun.turnAround()
  tfun.digAndForward(width)
  tfun.turnAround()
end

function start()
  mainLoop()
  clean()
end

start()
