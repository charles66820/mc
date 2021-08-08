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

function printScreenSize(screen)
  local sWidth, sHeight = screen.getSize()
  local txt = "(" .. sWidth .. ", " .. sHeight .. ")"
  cfun.printAt(txt, sWidth - (#txt - 1), sHeight, colors.white, colors.black, screen)
end

-- buttons
function IconToggleButton(screen, x, y, width, height, onClick, icon, initToggled)
  -- private member
  local toggled = false
  if initToggled then
    toggled = true
  end
  local iconTextureOn = window.create(screen, x, y, width, height, toggled)
  local iconTextureOff = window.create(screen, x, y, width, height, not toggled)

  -- constructor body
  drawIcon(icon .. "On", 1, 1, iconTextureOn)
  drawIcon(icon .. "Off", 1, 1, iconTextureOff)

  -- methods deffinition
  return {
    getX = function()
      return x
    end,
    getY = function()
      return y
    end,
    move = function(newX, newY)
      x = newX
      y = newY
      iconTextureOn.reposition(x, y)
      iconTextureOff.reposition(x, y)
      if toggled then
        iconTextureOn.redraw()
      else
        iconTextureOff.redraw()
      end
    end,
    getToggled = function()
      return toggled
    end,
    clickEvent = function(self, event, side, x, y) -- self
      if event == "monitor_touch" then
        if x >= self.getX() and x < self.getX() + width and y >= self.getY() and y < self.getY() + height then
          if toggled then
            iconTextureOff.setVisible(true)
            iconTextureOn.setVisible(false)
            iconTextureOff.redraw()
            toggled = false
          else
            iconTextureOn.setVisible(true)
            iconTextureOff.setVisible(false)
            iconTextureOn.redraw()
            toggled = true
          end
          onClick(self, side, x, y)
        end
      end
    end
  }
end

return {
  loadIcon = loadIcon,
  drawCheckerPattern = drawCheckerPattern,
  drawTextCenter = drawTextCenter,
  printScreenSize = printScreenSize,
  IconToggleButton = IconToggleButton
}
