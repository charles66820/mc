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

local windows = {}
local sWidth, sHeight = screen.getSize()

-- load image in window
for i, iconName in ipairs(images) do
  sfun.drawIcon(iconName, 1, 1, screen)
  local win = window.create(screen, x, y, sWidth, sHeight, false)
  sfun.drawIcon(iconName, 1, 1, win)
  table.insert(windows, win)
  os.sleep(10)
end

while true do
  local lastWin = nil
  for i, win in ipairs(windows) do
    if lastWin ~= nil then
      lastWin.setVisible(false)
    end
    win.setVisible(true)
    win.redraw()
    lastWin = win
  end
end
