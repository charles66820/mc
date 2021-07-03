local dropItemList = {
  "minecraft:cobblestone",
  "minecraft:andesite",
  "minecraft:diorite",
  "minecraft:granite",
  "minecraft:gravel",
  "minecraft:netherrack"
}

config = {
  dropBadItems = true
}

function refuel()
  if config.dropBadItems then dropBadItems() end -- Clean inventory before refuel
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

local function hasValue(arr, val)
  for i, v in ipairs(arr) do
    if v == val then
      return true
    end
  end
  return false
end

function dropBadItems()
  for n = 1, 16 do
    local data = turtle.getItemDetail()
    if data and hasValue(dropItemList, data.name) then
      turtle.select(n)
      turtle.dropDown(data.count)
    end
  end
end

function digAndForward(nb)
  while nb > 0 do
    refuel()
    while turtle.detect() do
      turtle.dig()
    end
    while not turtle.forward() do
      turtle.attack("left")
    end
    nb = nb - 1
  end
end

function digUpAndUp(nb)
  while nb > 0 do
    refuel()
    while turtle.detectUp() do
      turtle.digUp()
    end
    while not turtle.up() do
      turtle.attackUp("left")
    end
    nb = nb - 1
  end
end

function digDownAndDown(nb)
  while nb > 0 do
    refuel()
    while turtle.detectDown() do
      turtle.digDown()
    end
    while not turtle.down() do
      turtle.attackDown("left")
    end
    nb = nb - 1
  end
end

function turnAround()
  turtle.turnLeft()
  turtle.turnLeft()
end

function turnDigAndForwardLeft()
  turtle.turnLeft()
  digAndForward(1)
  turtle.turnLeft()
end

function turnDigAndForwardRight()
  turtle.turnRight()
  digAndForward(1)
  turtle.turnRight()
end

function printProcess(msg)
  local x, y = term.getCursorPos()
  term.setCursorPos(1, 1)
  term.clearLine()
  term.write(msg)
  term.setCursorPos(x, y)
end

return {
  refuel = refuel,
  digAndForward = digAndForward,
  digUpAndUp = digUpAndUp,
  digDownAndDown = digDownAndDown,
  turnAround = turnAround,
  turnDigAndForwardLeft = turnDigAndForwardLeft,
  turnDigAndForwardRight = turnDigAndForwardRight,
  printProcess = printProcess
}
