-- Draconic evolution reactor secure program
local cfun = computerLib
-- Settings vars
local alertTemperature = 8000 -- 2000?

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

-- Security check
local reactor = nil
while reactor == nil do
  reactor = peripheral.find("flux_gate")
  while true do
    local info = reactor.getReactorInfo()
    if info.status == "beyond_hope" then
      redstone.setOutput(redstoneOutputSide, true)
    end
    local saturation = (info.energySaturation * 100) / info.maxEnergySaturation
    local field = (info.fieldStrength * 100) / info.maxFieldStrength
    -- add "warming_up" ?
    if info.status ~= "running" and (info.temperature >= alertTemperature or saturation <= 5 or field <= 5) then
      reactor.stopReactor()
    end
  end
end