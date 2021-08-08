-- Mob farm screen
local cfun = computerLib
local sfun = screenLib
local config = configLoader.getConfig()
-- Args and vars def
local rednetSide = cfun.sideSearch("modem")

if rednetSide == nil then
  print("Can't connet to rednet!")
  print("Modem not found")
  return 1
end

rednet.open(rednetSide)

local screen = peripheral.find("monitor")

if screen == nil then
  print("Monitor not found!")
  return 1
end

local width = 15
local height = 10
local protocol = "spawner"
local buttons = {}
local saveFilePath = config.workdir .. config.saveDirName .. "mobFarm.save"

-- save
local mobs = nil
function writeSave(obj)
  local saveFile = fs.open(saveFilePath, "w")
  saveFile.write(textutils.serialize(obj))
  saveFile.close()
end

if fs.exists(saveFilePath) then
  -- load save
  local saveFile = fs.open(saveFilePath, "r")
  mobs = textutils.unserialize(saveFile.readAll())
  saveFile.close()
else
  -- create default save file
  mobs = {{
    name = "sheep",
    active = false
  }, {
    name = "chicken",
    active = false
  }, {
    name = "stonelings",
    active = false
  }, {
    name = "skeleton",
    active = false
  }, {
    name = "cow",
    active = false
  }, {
    name = "ghast",
    active = false
  }, {
    name = "blaze",
    active = false
  }, {
    name = "frog",
    active = false
  }, {
    name = "pig",
    active = false
  }, {
    name = "witherSkeleton",
    active = false
  }, {
    name = "enderman",
    active = false
  }, {
    name = "witch",
    active = false
  }, {
    name = "evoker",
    active = false
  }, {
    name = "blizz",
    active = false
  }}
  writeSave(mobs)
end

-- Main
function activeSpawner(name, active)
  if active then
    rednet.broadcast(name .. "Off", protocol)
  else
    rednet.broadcast(name .. "On", protocol)
  end
end

local sWidth, sHeight = screen.getSize()
local nbCol = math.floor(sWidth / width)
local nbRow = math.floor(sHeight / height)
for y = 1, nbRow do
  for x = 1, nbCol do
    local index = x + (nbCol * (y - 1))
    if index <= #mobs then
      -- init button
      table.insert(buttons,
        sfun.IconToggleButton(screen, 1 + (width * (x - 1)), 1 + (height * (y - 1)), width, height,
          function(this, side, x, y)
            if this.getToggled() then
              mobs[index].active = true
            else
              mobs[index].active = false
            end
            activeSpawner(mobs[index].name, mobs[index].active)
          end, mobs[index].name))
      -- init spawner active
      activeSpawner(mobs[index].name, mobs[index].active)
    end
  end
end

-- monitor_touch listener
while true do
  local event, side, x, y = os.pullEvent("monitor_touch")
  for i, button in ipairs(buttons) do
    button:clickEvent(event, side, x, y)
  end
end
