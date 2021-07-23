-- Place a rectangle
local cfun = computerLib
local tfun = turtleLib
-- Args and vars def
local width = 0
local length = 0
local height = 0
local centerStart = false -- By default turtle start ad left corner
local blockType = "minecraft:stone"
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
elseif #args > 4 then
  print("Usage: ", args[0], " <width> <length> <height> <centerStart>")
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
function init()
  if centerStart then
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
  tfun.place(blockType, "down")
  for i = 1, length - 1 do
    -- cfun.printProcess("Largeur: " .. (i + 1) .. "/" .. length)
    tfun.digAndForward(1)
    tfun.place(blockType, "down")
  end
end

local isFirst = true
function layers(h)
  for i = 1, h do
    if not isFirst then
      tfun.turnAround()
      tfun.digUpAndUp(1)
    end
    local lwidth = 0
    repeat
      if lwidth ~= 0 then
        if i % 2 == 1 then
          tfun.turnDigAndForwardRight()
        else
          tfun.turnDigAndForwardLeft()
        end
      end
      cfun.printProcess("Longeur: " .. (lwidth + 1) .. "/" .. width .. " Height: " .. i .. "/" .. height)
      line()
      lwidth = lwidth + 1
    until not (lwidth < width)
    isFirst = false
  end
end

function mainLoop()
  layers(height)
end

function clean()
  -- When is not back at start
  if height % 2 ~= 0 then
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
  if height > 0 then
    tfun.digDownAndDown(height - 1)
  end
  -- TODO: reset center ?
end

function start()
  init()
  mainLoop()
  clean()
end

start()
