-- Draconic evolution reactor secure program
local cfun = computerLib
-- Settings vars
local alertTemperature = 8000
local alertSaturation = 5
local alertField = 20

-- Args and vars def
local redstoneOutputSide = nil
local protocol = nil
local cmd = nil

local args = {...}
if #args == 1 then
  redstoneOutputSide = args[1]
elseif #args == 2 then
  redstoneOutputSide = args[1]
  protocol = args[2]
else
  print("Usage: ", args[0], " <redstoneOutputSide> <protocol>")
  return 128
end

while redstoneOutputSide == nil or not cfun.hasValue(redstone.getSides(), redstoneOutputSide) do
  print("Redstone output side :")
  redstoneOutputSide = read()
end

cmd = "reactorSecure " .. redstoneOutputSide

-- save current run program in .run
if protocol ~= nil then
  cmd = cmd .. " " .. protocol
end

local file = fs.open("/.run", "w")
file.write(cmd)
file.close()

local rednetSide = cfun.sideSearch("modem")

if rednetSide ~= nil then
  rednet.open(rednetSide)
end

-- functions
function sendAlert(msg)
  if protocol ~= nil and rednetSide ~= nil then
    if not rednet.isOpen(rednetSide) then
      rednet.open(rednetSide)
    end
    rednet.broadcast("solarReactorAlert(".. msg ..")", protocol)
  end
end

function findReactor()
  local reactor = nil
  while reactor == nil do
    -- fix for "Too Long Without Yielding"
    os.queueEvent("randomEvent")
    os.pullEvent()
    --
    cfun.printProcess("Serching reactor...")
    reactor = peripheral.find("draconic_reactor")
  end
  cfun.printProcess("Reactor found!")
  return reactor
end

-- Security check
local reactor = nil

function start()
  while true do
    -- fix for "Too Long Without Yielding"
    os.queueEvent("randomEvent")
    os.pullEvent()
    --
    if reactor == nil then
      reactor = findReactor()
    end
    local info = reactor.getReactorInfo()
    if info ~= nil then
      if info.status == "beyond_hope" then
        redstone.setOutput(redstoneOutputSide, true)
        sendAlert("numerized")
      else
        redstone.setOutput(redstoneOutputSide, false)
      end
      local saturation = (info.energySaturation * 100) / info.maxEnergySaturation
      local field = (info.fieldStrength * 100) / info.maxFieldStrength
      cfun.printProcessAt("is warming_up : " .. tostring(info.status ~= "warming_up"), 1, 2)
      cfun.printProcessAt("is tmp alert : " .. tostring(info.temperature >= alertTemperature), 1, 3)
      cfun.printProcessAt("is saturation : " .. tostring(saturation <= 20), 1, 4)
      cfun.printProcessAt("is field : " .. tostring(field <= 20), 1, 5)
      if info.status ~= "warming_up" and info.status ~= "offline" and (info.temperature >= alertTemperature or saturation <= alertSaturation or field <= alertField) then
        if reactor ~= nil then
          reactor.stopReactor()
        end
        sendAlert("stop")
      end
    end
  end
end

function peripheralListener()
  while true do
    local event, side = os.pullEvent("peripheral")
    if peripheral.getType(side) == "modem" then
      rednetSide = side
    end
  end
end

function peripheralDetachListener()
  while true do
    local event, side = os.pullEvent("peripheral_detach")
    if side == rednetSide then
      rednetSide = nil
    end
  end
end

parallel.waitForAny(peripheralListener, peripheralDetachListener, start)
