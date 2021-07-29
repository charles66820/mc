-- Draconic evolution reactor secure program
local cfun = computerLib
-- Settings vars
local alertTemperature = 7950

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

function sendAlert()
  if protocol ~= nil and rednetSide ~= nil then
    if not rednet.isOpen(rednetSide) then
      rednet.open(rednetSide)
    end
    rednet.broadcast("solarReactorAlert", protocol)
  end
end

-- Security check
local reactor = nil
while reactor == nil do
  cfun.printProcess("Serching reactor...")
  reactor = peripheral.find("draconic_reactor")
end
cfun.printProcess("Reactor found!")

function start()
  while true do
    -- fix for "Too Long Without Yielding"
    os.queueEvent("randomEvent")
    os.pullEvent()
    --
    local info = reactor.getReactorInfo()
    if info.status == "beyond_hope" then
      redstone.setOutput(redstoneOutputSide, true)
    end
    local saturation = (info.energySaturation * 100) / info.maxEnergySaturation
    local field = (info.fieldStrength * 100) / info.maxFieldStrength
    print(info.status ~= "warming_up" and (info.temperature >= alertTemperature or saturation <= 20 or field <= 20))
    if info.status ~= "warming_up" and (info.temperature >= alertTemperature or saturation <= 20 or field <= 20) then
      reactor.stopReactor()
      sendAlert()
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
