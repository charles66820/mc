-- Detect machine
local cfun = computerLib
-- Args and vars def
local side = nil
local args = {...}

if #args == 1 then
  side = args[1]
elseif #args > 1 then
  print("Usage: ", args[0], " <side>")
  return 128
end

while side == nil or not cfun.hasValue({"front", "back", "left", "right", "top", "bottom"}, side) do
  print("Side :")
  side = read()
end

-- Main
if not peripheral.isPresent(side) then
  cfun.printProcess("Device is not present")
  return 1
end

cfun.printProcess(peripheral.getType(side) .. " found!")

for i, v in ipairs(peripheral.getMethods(side)) do
  print(i .. ". " .. v)
end

while true do
  local event, scrollDirection, x, y = os.pullEvent("mouse_scroll")
  term.scroll(scrollDirection)
end
