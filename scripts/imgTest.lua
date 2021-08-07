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

cfun.printAt("test a long text !123456789abcdefghijklmnopqrstuvwxyz", 2, 2, colors.white, colors.black, screen)

local win1 = window.create(screen, 10, 5, 50, 25)
--win1.setTextScale(0.5)
sfun.drawCheckerPattern(win1, colors.yellow, colors.red)
sfun.printScreenSize(win1)
cfun.printAt("test a long text !123456789abcdefghijklmnopqrstuvwxyz", 2, 2, colors.white, colors.black, win1)

local win2 = window.create(win1, 10, 5, 30, 15) -- screen to over
--win2.setTextScale(1)
sfun.drawCheckerPattern(win2, colors.blue, colors.green)
sfun.printScreenSize(win2)
cfun.printAt("test a long text !123456789abcdefghijklmnopqrstuvwxyz", 2, 2, colors.white, colors.black, win2)

-- os.sleep(2)
-- win1.setVisible(false)
-- win2.setVisible(false)
-- win1.redraw()
-- os.sleep(2)
-- win1.setVisible(true)
-- os.sleep(2)
-- win2.setVisible(true)
-- win1.redraw()
-- os.sleep(2)
-- win2.setVisible(false)
-- win1.redraw()
-- os.sleep(2)
-- win2.setVisible(true)
-- win1.redraw()
-- os.sleep(2)

sfun.drawIcon(iconName, 1, 1, screen)
