-- Detect machine
local cfun = require("computerLib")
-- Args and vars def
local side = nil
local args = {...}

if #args == 1 then
  side = args[1]
elseif #args > 1 then
  print("Usage: ", args[0], " <side>")
  os.exit()
end

while not cfun.hasValue({nil, "front", "back", "left", "right", "top", "bottom"}, side) do
  print("Side :")
  side = read()
end

-- Main
if not peripheral.isPresent(side) then
  cfun.printProcess("Device is not present")
  os.exit()
end

cfun.printProcess(peripheral.getType(side) .. " found!")

print(peripheral.getMethods(side))

while true do
  local event, srollDirection, x, y = os.pullEvent("mouse_scroll")
  print("mouse_scroll: " .. tostring(scrollDirection) .. ", " .. "X: " .. tostring(x) .. ", " .. "Y: " .. tostring(y))

  term.scroll(scrollDirection)
end
