local tfun = require("turtleLib")
-- Args and vars def
local width = 4
local length = 4
local args = {...}

if #args >= 2 then
  width = tonumber(args[1])
  length = tonumber(args[2])
end

-- functions
function rect(n)
  if n % 2 == 1 then
    if n ~= 1 then
      turtle.turnLeft()
      tfun.digAndForward(1)
      turtle.turnLeft()
    end
    tfun.digAndForward(width - 1)
  else
    turtle.turnRight()
    tfun.digAndForward(1)
    turtle.turnRight()
    tfun.digAndForward(width - 1)
  end
end

function mainLoop()
  local llength = length
  while llength > 0 do
    rect(length - llength + 1)
    llength = llength - 1
  end
end

function clean()
  if length % 2 == 1 then
    turtle.turnLeft()
    tfun.digAndForward(length - 1)
    turtle.turnLeft()
    tfun.digAndForward(width - 1)
    tfun.turnAround()
  else
    turtle.turnRight()
    tfun.digAndForward(length - 1)
    turtle.turnRight()
  end
end

function start()
  mainLoop()
  clean()
end

start()
