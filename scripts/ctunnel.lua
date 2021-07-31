-- Mine a circle tunnel
local cfun = computerLib
local tfun = turtleLib
local config = configLoader.getConfig()
-- Args and vars def
local width = 0
local args = {...}

if #args == 1 then
  width = tonumber(args[1])
elseif #args > 1 then
  print("Usage: ", args[0], " <longeur>")
  return 128
end

if width <= 0 then
  print("Longeur :")
  width = tonumber(read())
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
  for i = 1, width do
    circle()
    cfun.printProcess("Longeur: " .. i .. "/" .. width)
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

function inventoryListener()
  while true do
    os.pullEvent("turtle_inventory")
    -- Clean inventory
    if config.dropBadItems then
    tfun.dropBadItems()
    end
  end
end

parallel.waitForAny(inventoryListener, start)