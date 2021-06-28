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
function init()
  tfun.digAndForward(1)
  tfun.digUpAndUp(1)
  turtle.turnLeft()
  for i=1,length/2 do
    turtle.digUp()
    turtle.digDown()
    tfun.digAndForward(1)
  end
end

function line()
  turtle.digUp()
  turtle.digDown()
  for i=1,length-1 do
    tfun.digAndForward(1)
    turtle.digUp()
    turtle.digDown()
  end
end

local isInitRot = true
function layer()
  lWidth = width-2
  tfun.turnAround()
  line()
  while lWidth > 0 do
    lWidth = lWidth - 1
    turtle.turnLeft()
    tfun.digAndForward(1)
    turtle.turnLeft()
    line()
    if lWidth >= 1 then
      lWidth = lWidth - 1
      turtle.turnRight()
      tfun.digAndForward(1)
      turtle.turnRight()
      line()
      isInitRot = true
    else
      isInitRot = false
    end
  end
end

function digCeil()
  tfun.digUpAndUp(1)
  tfun.turnAround()
  tfun.digAndForward(2)
  tfun.digUpAndUp(1)
  turtle.turnRight()
  tfun.digAndForward(width-1)
  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnLeft()
  tfun.digAndForward(width-1)
  turtle.turnRight()
  while turtle.detectUp() do
    turtle.digUp()
  end
  tfun.digAndForward(1)
  turtle.turnRight()
  for i = 1, width-1 do
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
  for i = 1, width-1 do
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
  for i = 1, width-1 do
    while turtle.detectUp() do
      turtle.digUp()
    end
    tfun.digAndForward(1)
  end
  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnLeft()
  tfun.digAndForward(width-1)
  turtle.turnRight()
  tfun.digAndForward(1)
  turtle.turnRight()
  tfun.digAndForward(width-1)
end

function mainLoop()
  nbUp = (height / 3) - 1
  layer()
  while nbUp > 0 do
    if not isInitRot then
      tfun.turnAround()
      for i=1,length-1 do
        tfun.digAndForward(1)
      end
    end
    tfun.digUpAndUp(3)
    layer()
    nbUp = nbUp - 1
  end
  if haveCeil then digCeil() end
end

function clean()
  -- TODO
  if haveCeil then return end
  tfun.turnAround()
  for i=1,4 do turtle.down() end
  for i=1,5 do turtle.forward() end
  turtle.turnLeft()
  turtle.forward()
  tfun.turnAround()
end

function start()
  init()
  mainLoop()
  clean()
end

start()