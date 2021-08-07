-- Detect machine
local cfun = computerLib
local sfun = screenLib
-- Vars
local images = {"to0aM", "to0aB", "to0aBg", "arnaud", "arnaudG", "arnaudS", "arnaudD"}

-- Main
local screen = peripheral.find("monitor")
if not screen then
  cfun.printProcess("Screen is not present")
  return 1
end

screen.setTextScale(0.5)

while true do
  for i, iconName in ipairs(images) do
    sfun.drawIcon(iconName, 1, 1, screen)
    os.sleep(10)
  end
end
