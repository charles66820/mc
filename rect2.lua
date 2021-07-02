local tfun = require("turtleLib")
-- Args and vars def
local width = 0
local length = 0
local height = 0
local centerStart = false -- By default turtle start ad left corner
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
elseif #args > 2 then
  print("Usage: ", args[0], " <width> <length> <height>")
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

local restLayer = height % 3
local nbThreeLayer = (height - restLayer) / 3
local nbLayer = nbThreeLayer
if restLayer ~= 0 then nbLayer = nbLayer + 1 end

-- functions
function line(h)
  if h == 3 then turtle.digUp() end
  if h >= 2 then turtle.digDown() end
  for i=1,length-1 do
    -- tfun.printProcess("Largeur: " .. (i + 1) .. "/" .. length)
    tfun.digAndForward(1)
    if h == 3 then turtle.digUp() end
    if h >= 2 then turtle.digDown() end
  end
end

local isFirst = true
function layers(n, h)
  for i=1, n do
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
      if lwidth ~= 0 then
        local pivo = 0
        if width % 2 == 0 then
          if h < 3 then
            if nbThreeLayer == 0 then pivo = 0 else pivo = 1 end
          else
            pivo = (i + 1) % 2
          end
        end
        if lwidth % 2 == pivo then
          turtle.turnRight()
          tfun.digAndForward(1)
          turtle.turnRight()
        else
          turtle.turnLeft()
          tfun.digAndForward(1)
          turtle.turnLeft()
        end
      end
      tfun.printProcess("Longeur: " .. (lwidth + 1) .. "/" .. width .. " Layer: " .. i .. "/" .. nbLayer)
      line(h)
      lwidth = lwidth + 1
    until not (lwidth < width)
    isFirst = false
  end
end

function mainLoop()
  if nbThreeLayer > 0 then layers(nbThreeLayer, 3) end
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
  end
  tfun.digDownAndDown(height)
end

function start()
  -- init()
  mainLoop()
  --clean()
end

start()
