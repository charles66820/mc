-- Detect machine
local cfun = computerLib
local sfun = screenLib
-- Args and vars def
local side = nil
local args = {...}

if #args == 1 then
  side = args[1]
elseif #args > 1 then
  print("Usage: ", args[0], " <side>")
  return 128
end

while side == nil or not cfun.hasValue({"front", "back", "left", "right", "top", "down"}, side) do
  print("Side :")
  side = read()
end

if side == "front" then
  side = ""
end

-- Main
if not peripheral.isPresent(side) then
  cfun.printProcess("Screen is not present")
  return 1
end

local screen = peripheral.wrap(side)

term.redirect(screen)
sfun.loadIcon("logo", 0, 0)
term.restore()
