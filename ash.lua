-- Farm ash
local cfun = require("computerLib")
local tfun = require("turtleLib")
-- Args and vars def
local args = {...}

-- functions
function placeWoodPile()
  tfun.place("forestry:wood_pile", "wood pile", "front")
end

function placeUpWoodPile()
  tfun.place("forestry:wood_pile", "wood pile", "up")
end

function placeCloseBlock()
  tfun.place("minecraft:end_stone", "end stone", "front")
end

function placeFlintAndSteel()
  tfun.place("minecraft:flint_and_steel", "flint & steel", "front")
end

function collect()
  cfun.printProcess("Collecting...")
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
  cfun.printProcess("Placing...")
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
    os.sleep(900)
    collect()
  end
end

function start()
  mainLoop()
end

start()
