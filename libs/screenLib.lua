local cfun = computerLib
local config = configLoader.getConfig()

local iconDir = config.workdir .. config.iconDirName

function getIconFileName(name)
  return name .. ".nfp"
end

function getIconPath(name)
  return iconDir .. getIconFileName(name)
end

function drawIcon(name, x, y, screen)
  if name == nil and name == "" then
    name = "error"
  end

  local iconPath = getIconPath(name)

  if not fs.exists(iconPath) then
    if not cfun.loadFile(config.iconDirName .. getIconFileName(name)) then
      iconPath = getIconPath("error")
    end
  end

  if fs.exists(iconPath) then
    local image = paintutils.loadImage(iconPath)
    if image == nil then
      image = paintutils.loadImage(getIconPath("error"))
    end
    local saveTerm = term.current()
    term.redirect(screen)
    paintutils.drawImage(image, x, y)
    term.redirect(saveTerm)
  end
end

function drawCheckerPattern(screen, color1, color2)
  local saveX, saveY = screen.getCursorPos()
  local saveColor = screen.getTextColor()
  local saveBgColor = screen.getBackgroundColor()

  local sWidth, sHeight = screen.getSize()
  screen.setBackgroundColor(color1)
  screen.clear()
  local saveTerm = term.current()
  term.redirect(screen)
  for y = 1, sHeight, 1 do
    for x = 1, sWidth, 1 do
      if (y % 2 == 0 and x % 2 == 1) or (y % 2 == 1 and x % 2 == 0) then
        paintutils.drawPixel(x, y, color2)
      end
    end
  end
  term.redirect(saveTerm)
  screen.setCursorPos(saveX, saveY)
  screen.setTextColor(saveColor)
  screen.setBackgroundColor(saveBgColor)
end

function drawTextCenter(txt, screen, color, bgcolor)
  local sWidth, sHeight = screen.getSize()
  cfun.printAt(txt, math.ceil(sWidth / 2) - math.ceil(#txt / 2), math.ceil(sHeight / 2), color, bgcolor, screen)
end

return {
  loadIcon = loadIcon,
  drawCheckerPattern = drawCheckerPattern,
  drawTextCenter = drawTextCenter
}
