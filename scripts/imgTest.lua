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

term.clear()

--screen.setTextScale(0.5)
local sWidth, sHeight = term.getSize()

local saveX, saveY = term.getCursorPos()
local saveColor = screen.getTextColor()

screen.setTextColor(colors.white)
local txt = "(" .. sWidth .. ", " .. sHeight .. ")"
screen.setCursorPos(math.floor(sWidth / 2) - math.floor(#txt / 2), math.floor(sHeight / 2))
screen.write(txt)

for y = 1, sHeight, 1 do
  for x = 1, sWidth, 1 do
    if (y % 2 == 0 and x % 2 == 1)
    or (y % 2 == 1 and x % 2 == 0) then
      paintutils.drawPixel(x, y, colors.gray)
    end
  end
end

for i = 1, sWidth, 5 do
  screen.setCursorPos(i, 1)
  screen.write(math.floor(i + 0.5))
end

for i = 1, sHeight, 5 do
  screen.setCursorPos(1, i)
  screen.write(math.floor(i + 0.5))
end

screen.setTextColor(saveColor)
term.setCursorPos(saveX, saveY)

-- draw img
term.redirect(screen)

screen.setTextScale(1)

if iconName ~= nil and iconName ~= "" and fs.exist(iconName) then
  local image = paintutils.loadImage(iconName)
  if image ~= nil then
    paintutils.drawImage(image, 1, 1)
  end
end
-- sfun.loadIcon("logo", 0, 0)
