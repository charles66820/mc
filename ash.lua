-- Farm ash
local tfun = require("turtleLib")
-- Args and vars def
local args = {...}

-- functions
function selectBlock(name)
  for n = 1, 16 do
    turtle.select(n)
    local data = turtle.getItemDetail()
    if data and data.name == name then
      return true
    end
  end
  return false
end

function place(name, title, pos)
  if not selectBlock(name) then
    print("Add " .. title .. " to continue")
    while not selectBlock(name) do
      os.pullEvent("turtle_inventory")
    end
  end
  if pos == "up" then
    turtle.placeUp()
  else
    turtle.place()
  end
end

function placeWoodPile()
  place("forestry:wood_pile", "wood pile", "")
end

function placeUpWoodPile()
  place("forestry:wood_pile", "wood pile", "up")
end

function placeCloseBlock()
  place("minecraft:end_stone", "end stone", "")
end

function placeFlintAndSteel()
  place("minecraft:flint_and_steel", "flint & steel", "")
end

function collect()
  tfun.printProcess("Collecting...")
  tfun.digAndForward(2)
  turtle.turnLeft()
  tfun.digAndForward(2)
  for i = 1, 3 do
    turtle.turnRight()
    tfun.digAndForward(4)
  end
  for i = 1, 2 do
    turtle.turnRight()
    tfun.digAndForward(1)
  end
  for i = 1, 2 do
    turtle.digUp()
    tfun.digAndForward(1)
  end
  turtle.turnLeft()
  for i = 1, 2 do
    turtle.digUp()
    tfun.digAndForward(1)
  end
  turtle.turnLeft()
  for i = 1, 2 do
    turtle.digUp()
    tfun.digAndForward(1)
  end
  turtle.turnLeft()
  turtle.digUp()
  tfun.digAndForward(1)
  turtle.turnLeft()
  turtle.digUp()
  tfun.digAndForward(1)
  tfun.digUpAndUp(1)
  turtle.digUp()
  tfun.digDownAndDown(1)
  tfun.turnAround()
  tfun.digAndForward(4)
  tfun.turnAround()
end

function place()
  tfun.printProcess("Placing...")
  tfun.digAndForward(2)

  turtle.turnLeft()
  tfun.digAndForward(1)
  for i = 1, 3 do
    placeWoodPile()
    turtle.turnRight()
    tfun.digAndForward(1)
    placeUpWoodPile()
    turtle.turnLeft()
  end
  placeWoodPile()
  turtle.turnRight()
  tfun.digAndForward(1)
  turtle.turnLeft()
  placeWoodPile()
  tfun.turnAround()
  tfun.digAndForward(1)
  tfun.turnAround()
  placeWoodPile()
  turtle.turnLeft()
  tfun.digAndForward(1)

  turtle.turnRight()
  placeWoodPile()
  turtle.turnRight()
  placeWoodPile()
  placeUpWoodPile()
  tfun.turnAround()
  tfun.digAndForward(1)

  turtle.turnRight()
  placeWoodPile()
  turtle.turnRight()
  placeWoodPile()
  tfun.digUpAndUp(1)
  placeUpWoodPile()
  tfun.digDownAndDown(1)
  placeUpWoodPile()
  tfun.turnAround()
  tfun.digAndForward(1)

  turtle.turnRight()
  placeWoodPile()
  turtle.turnRight()
  placeWoodPile()
  placeUpWoodPile()
  tfun.turnAround()
  tfun.digAndForward(1)

  turtle.turnRight()
  placeWoodPile()
  turtle.turnRight()
  placeWoodPile()
  turtle.turnRight()
  tfun.digAndForward(1)

  placeWoodPile()
  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  placeWoodPile()
  placeUpWoodPile()

  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  placeWoodPile()
  placeUpWoodPile()

  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  placeWoodPile()
  placeUpWoodPile()

  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  placeWoodPile()

  turtle.turnRight()
  tfun.digAndForward(1)
  tfun.turnAround()
  placeWoodPile()
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  placeWoodPile()
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  placeWoodPile()
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  placeWoodPile()
  turtle.turnLeft()

  tfun.digAndForward(1)
  tfun.turnAround()
  placeWoodPile()
  turtle.turnRight()

  tfun.digAndForward(1)
  tfun.turnAround()
  placeWoodPile()
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  placeFlintAndSteel()
  placeCloseBlock()
end

function mainLoop()
  collect()
  while true do
    place()
    os.sleep(600)
    collect()
  end
end

function start()
  mainLoop()
end

start()
