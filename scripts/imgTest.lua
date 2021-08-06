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

sfun.drawCheckerPattern(screen, colors.gray, colors.pink)

cfun.printAt("test a long text !123456789abcdefghijklmnopqrstuvwxyz", 2, 2, colors.white, " ", screen)

local win1 = window.create(screen, 10, 10, 50, 50)
win1.setTextScale(0.5)
sfun.drawCheckerPattern(win1, colors.yellow, colors.red)
sfun.printScreenSize(win1)
cfun.printAt("test a long text !123456789abcdefghijklmnopqrstuvwxyz", 2, 2, colors.white, colors.black, win1)

local win2 = window.create(win1, 10, 10, 30, 30) -- screen to over
win2.setTextScale(1)
sfun.drawCheckerPattern(win2, colors.blue, colors.green)
sfun.printScreenSize(win2)
cfun.printAt("test a long text !123456789abcdefghijklmnopqrstuvwxyz", 2, 2, colors.white, colors.black, win2)

--sfun.drawIcon(iconName, 1, 1, screen)
