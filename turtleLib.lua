function refuel()
  local fuelLevel = turtle.getFuelLevel()
  if fuelLevel == "unlimited" or fuelLevel > 0 then
    return
  end
  local function tryRefuel()
    for n = 1, 16 do
      if turtle.getItemCount(n) > 0 then
        turtle.select(n)
        if turtle.refuel(1) then
          turtle.select(1)
          return true
        end
      end
    end
    turtle.select(1)
    return false
  end
  if not tryRefuel() then
    print("ajouter du carburant pour continuer")
    while not tryRefuel() do
      os.pullEvent("turtle_inventory")
    end
  end
end

function digAndForward(nb)
  while nb > 0 do
    refuel()
    while turtle.detect() do
      turtle.dig()
    end
    turtle.forward()
    nb = nb - 1
  end
end

function digUpAndUp(nb)
  while nb > 0 do
    refuel()
    while turtle.detectUp() do
      turtle.digUp()
    end
    turtle.up()
    nb = nb - 1
  end
end

function digDownAndDown(nb)
  while nb > 0 do
    refuel()
    while turtle.detectDown() do
      turtle.digDown()
    end
    turtle.down()
    nb = nb - 1
  end
end

function turnAround()
  turtle.turnLeft()
  turtle.turnLeft()
end

return {
  refuel = refuel,
  digAndForward = digAndForward,
  digUpAndUp = digUpAndUp,
  digDownAndDown = digDownAndDown,
  turnAround = turnAround
}
