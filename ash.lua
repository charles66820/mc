-- Farm ash
local cfun = require("computerLib")
local tfun = require("turtleLib")
-- Args and vars def
local args = {...}

-- functions
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
    tfun.place("forestry:wood_pile", "front")
    turtle.turnRight()
    tfun.digAndForward(1)
    tfun.place("forestry:wood_pile", "up")
    turtle.turnLeft()
  end
  tfun.place("forestry:wood_pile", "front")
  turtle.turnRight()
  tfun.digAndForward(1)
  turtle.turnLeft()
  tfun.place("forestry:wood_pile", "front")
  tfun.turnAround()
  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnLeft()
  tfun.digAndForward(1)

  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  tfun.place("forestry:wood_pile", "up")
  tfun.turnAround()
  tfun.digAndForward(1)

  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  tfun.digUpAndUp(1)
  tfun.place("forestry:wood_pile", "up")
  tfun.digDownAndDown(1)
  tfun.place("forestry:wood_pile", "up")
  tfun.turnAround()
  tfun.digAndForward(1)

  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  tfun.place("forestry:wood_pile", "up")
  tfun.turnAround()
  tfun.digAndForward(1)

  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnRight()
  tfun.digAndForward(1)

  tfun.place("forestry:wood_pile", "front")
  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  tfun.place("forestry:wood_pile", "up")

  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  tfun.place("forestry:wood_pile", "up")

  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")
  tfun.place("forestry:wood_pile", "up")

  turtle.turnLeft()
  tfun.digAndForward(1)
  turtle.turnRight()
  tfun.place("forestry:wood_pile", "front")

  turtle.turnRight()
  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("forestry:wood_pile", "front")
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("forestry:wood_pile", "front")
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("forestry:wood_pile", "front")
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnLeft()

  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("forestry:wood_pile", "front")
  turtle.turnRight()

  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("forestry:wood_pile", "front")
  tfun.turnAround()

  tfun.digAndForward(1)
  tfun.turnAround()
  tfun.place("minecraft:flint_and_steel", "front")
  tfun.place("minecraft:end_stone", "front")
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
