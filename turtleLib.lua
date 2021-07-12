local dropItemList = {"minecraft:cobblestone", "minecraft:stone", "minecraft:andesite", "minecraft:diorite",
                      "minecraft:granite", "minecraft:gravel", "minecraft:netherrack"}
local fuelList = {"minecraft:coal", "minecraft:charcoal"}

config = {
  dropBadItems = true
}

local function hasValue(arr, val)
  for i, v in ipairs(arr) do
    if v == val then
      return true
    end
  end
  return false
end

function refuel()
  if config.dropBadItems then
    dropBadItems()
  end -- Clean inventory before refuel
  local fuelLevel = turtle.getFuelLevel()
  if fuelLevel == "unlimited" or fuelLevel > 0 then
    return
  end
  local function tryRefuel()
    for n = 1, 16 do
      turtle.select(n)
      local data = turtle.getItemDetail()
      if data and data.count > 0 and hasValue(fuelList, data.name) then
        turtle.refuel(1)
        turtle.select(1)
        return true
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

function selectEmptySlot()
  for n = 1, 16 do
    if turtle.getItemCount(n) == 0 then
      turtle.select(n)
      return true
    end
  end
  return false
end

function selectItem(name)
  for n = 1, 16 do
    turtle.select(n)
    local data = turtle.getItemDetail()
    if data and data.name == name then
      return true
    end
  end
  return false
end

function place(name, dir)
  if not selectItem(name) then
    print("Ajouter " .. name .. " pour continuer")
    while not selectItem(name) do
      os.pullEvent("turtle_inventory")
    end
  end
  if dir == "up" then
    turtle.placeUp()
  elseif dir == "down" then
    turtle.placeDown()
  else
    turtle.place()
  end
end

function suckItem(dir, type, nb)
  if not selectEmptySlot() then
    print("Vider l'inventaire de la turtle pour continuer")
    while not selectEmptySlot() do
      os.pullEvent("turtle_inventory")
    end
  end
  if dir == "up" then
    turtle.suckUp()
  elseif dir == "down" then
    turtle.suckDown()
  else
    turtle.suck()
  end
  local data = turtle.getItemDetail()
  if data and hasValue(arr, data.name) then
end

function dropAllItems(arr, dir)
  for n = 1, 16 do
    turtle.select(n)
    local data = turtle.getItemDetail()
    if data and hasValue(arr, data.name) then
      if dir == "down" then
        turtle.dropDown()
      elseif dir == "up" then
        turtle.dropUp()
      else
        turtle.drop()
      end
    end
  end
end

function dropBadItems()
  dropAllItems(dropItemList, "down")
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

return {
  refuel = refuel,
  selectItem = selectItem,
  place = place,
  suckItem = suckItem,
  dropAllItems = dropAllItems,
  dropBadItems = dropBadItems,
  digAndForward = digAndForward,
  digUpAndUp = digUpAndUp,
  digDownAndDown = digDownAndDown,
  turnAround = turnAround,
  turnDigAndForwardLeft = turnDigAndForwardLeft,
  turnDigAndForwardRight = turnDigAndForwardRight
}
