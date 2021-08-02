-- Detect machine
local cfun = computerLib
local sfun = screenLib
-- Args and vars def
local iconName = nil
local args = {...}

if #args == 1 then
  iconName = args[1]
elseif #args > 1 then
  print("Usage: ", arg[0] or fs.getName(shell.getRunningProgram()), " <iconName>")
  return 128
end

while iconName == nil do
  print("file icon name :")
  iconName = read()
end

-- Main
local screen = peripheral.find("monitor")
if not screen then
  cfun.printProcess("Screen is not present")
  return 1
end

--screen.setTextScale(0.5)
local sWidth, sHeight = term.getSize()

local saveX, saveY = term.getCursorPos()
local saveColor = screen.getTextColor()
screen.setCursorPos(sWidth - 8, sHeight - 1)
screen.setTextColor(colors.white)
screen.write("(" .. sWidth .. ", " .. sHeight .. ")")
screen.setTextColor(saveColor)
term.setCursorPos(saveX, saveY)

-- draw img
term.redirect(screen)

screen.setTextScale(0.5)

local image = paintutils.loadImage(iconName)
paintutils.drawImage(image, 1, 1)

-- sfun.loadIcon("logo", 0, 0)
