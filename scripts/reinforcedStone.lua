-- Farm ash
local tfun = turtleLib
-- Args and vars def
local args = {...}

-- functions
function start()
  while true do
    turtle.turnRight()
    tfun.suckItem("front", "ic2:scaffold", 1)
    turtle.turnRight()
    tfun.dropAllItems({"ic2:resource"}, "front")
    tfun.turnAround()
    tfun.dropAllItems({"ic2:foam_sprayer"}, "down")
    tfun.suckItem("up", "ic2:foam_sprayer", 1)
    tfun.place("ic2:scaffold", "front")
    tfun.place("ic2:foam_sprayer", "front")
    turtle.turnLeft()
    tfun.place("minecraft:redstone_torch", "front")
    turtle.dig()
    turtle.turnRight()
    turtle.dig()
  end
end

start()
