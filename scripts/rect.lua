-- Dig a rectangle
local cfun = computerLib
local tfun = turtleLib
local config = configLoader.getConfig()
-- Args and vars def
local width = 0
local length = 0
local height = 0
local centerStart = false -- By default turtle start ad left corner
local reset = true
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
    centerStart = true
  end
elseif #args == 5 then
  width = tonumber(args[1])
  length = tonumber(args[2])
  height = tonumber(args[3])
  if args[4] == "true" then
    centerStart = true
  end
  if args[5] == "true" then
    reset = true
  else
    reset = false
  end
elseif #args > 5 then
  print("Usage: ", arg[0] or fs.getName(shell.getRunningProgram()), " <width> <length> <height> <centerStart> <reset>")
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

local restLayer = height % 3
local nbThreeLayer = (height - restLayer) / 3
local nbLayer = nbThreeLayer
if restLayer ~= 0 then
  nbLayer = nbLayer + 1
end

-- functions
function init()
  if centerStart then
    tfun.digAndForward(1)
    if height > 1 then
      tfun.digUpAndUp(1)
    end
    turtle.turnLeft()
    tfun.digAndForward(math.floor(length / 2))
    tfun.turnAround()
  else
    if height > 1 then
      tfun.digUpAndUp(1)
    end
    turtle.turnRight()
  end
end
function line(h)
  if h == 3 then
    turtle.digUp()
  end
  if h >= 2 then
    turtle.digDown()
  end
  for i = 1, length - 1 do
    -- cfun.printProcess("Largeur: " .. (i + 1) .. "/" .. length)
    tfun.digAndForward(1)
    if h == 3 then
      turtle.digUp()
    end
    if h >= 2 then
      turtle.digDown()
    end
  end
end

local isFirst = true
function layers(n, h)
  for i = 1, n do
    if not isFirst then
      tfun.turnAround()
      if h < 3 then
        tfun.digUpAndUp(h + 1)
      else
        tfun.digUpAndUp(h)
      end
    end
    local lwidth = 0
    repeat
      if lwidth ~= 0 then -- if is first line start
        local pivo = 0 -- if width is odd
        -- if width is peer and is back layer or is peer last layer
        if width % 2 == 0 and (i % 2 == 0 or (nbThreeLayer % 2 == 1 and h ~= 3)) then
          pivo = 1
        end
        if lwidth % 2 == pivo then
          tfun.turnDigAndForwardRight()
        else
          tfun.turnDigAndForwardLeft()
        end
      end
      cfun.printProcess("Longeur: " .. (lwidth + 1) .. "/" .. width .. " Layer: " .. i .. "/" .. nbLayer)
      line(h)
      lwidth = lwidth + 1
    until not (lwidth < width)
    isFirst = false
  end
end

function mainLoop()
  if nbThreeLayer > 0 then
    layers(nbThreeLayer, 3)
  end
  if restLayer ~= 0 then
    layers(1, restLayer)
  end
end

function clean()
  -- When is not back at start
  if nbLayer % 2 ~= 0 then
    if width % 2 == 0 then -- When is at left
      turtle.turnLeft()
      tfun.digAndForward(width - 1)
      turtle.turnLeft()
    else -- When is at right
      turtle.turnRight()
      tfun.digAndForward(width - 1)
      turtle.turnRight()
      tfun.digAndForward(length - 1)
      tfun.turnAround()
    end
  else
    tfun.turnAround()
  end
  if restLayer == 1 or restLayer == 2 then
    tfun.digDownAndDown(height - 1)
  else
    tfun.digDownAndDown(height - 2)
  end
  -- reset center
  if centerStart then
    tfun.digAndForward(math.floor(length / 2))
    turtle.turnRight()
    tfun.digAndForward(1)
    tfun.turnAround()
  else
    turtle.turnLeft()
  end
end

function start()
  init()
  mainLoop()
  if (reset) then
    clean()
  end
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
