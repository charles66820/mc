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

function place(name, title, dir)
  if not selectBlock(name) then
    print("Add " .. title .. " to continue")
    while not selectBlock(name) do
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

function dropBadItems()
  for n = 1, 16 do
    turtle.select(n)
    local data = turtle.getItemDetail()
    if data and hasValue(dropItemList, data.name) then
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
  local saveColor = term.getTextColor()
  local saveBgColor = term.getBackgroundColor()
  term.setCursorPos(1, 1)
  term.clearLine()
  term.setTextColor(colors.black)
  term.setBackgroundColor(colors.white)
  term.write(msg)
  term.setCursorPos(x, y)
  term.setTextColor(saveColor)
  term.setBackgroundColor(saveBgColor)
end

return {
  refuel = refuel,
  selectBlock = selectBlock,
  place = place,
  dropBadItems = dropBadItems,
  digAndForward = digAndForward,
  digUpAndUp = digUpAndUp,
  digDownAndDown = digDownAndDown,
  turnAround = turnAround,
  turnDigAndForwardLeft = turnDigAndForwardLeft,
  turnDigAndForwardRight = turnDigAndForwardRight,
  printProcess = printProcess
}
