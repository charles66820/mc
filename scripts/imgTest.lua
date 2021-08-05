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

screen.setBackgroundColor(colors.black)
screen.clear()
screen.setTextScale(1)
--screen.setTextScale(0.5)

-- draw checker pattern
sfun.drawCheckerPattern(screen, colors.yellow, colors.red)

-- print screen size
local sWidth, sHeight = screen.getSize()
local txt = "(" .. sWidth .. ", " .. sHeight .. ")"
cfun.printAt(txt, sWidth - #txt, sHeight, colors.white, colors.black, screen)

-- draw icon
sfun.drawIcon(iconName, 1, 1, screen)
