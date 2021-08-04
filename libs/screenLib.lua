local cfun = computerLib

local workdir = "/bitacu/"
local iconDirName = "icon/"
local iconDir = workdir .. iconDirName

function getIconFileName(name)
  return name .. ".nfp"
end

function getIconPath(filename)
  return iconDir .. getIconFileName(filename)
end

function drawIcon(name, x, y, screen)
  if name == nil and name == "" then
    name = "error"
  end

  local iconPath = getIconPath(getIconFileName(name))

  print("test")
  print(iconPath)
  print(fs.exists(iconPath))
  if not fs.exists(iconPath) then
    print("test0")
    if not cfun.loadFile(iconDirName .. getIconFileName(name)) then
      iconPath = getIconPath(getIconFileName("error"))
    end
  end
  print("test1")
  if fs.exists(iconPath) then
    print("test2")
    local image = paintutils.loadImage(iconPath)
    print("test3")
    print(image)
    if image == nil then
      print("test4")
      image = paintutils.loadImage(getIconPath(getIconFileName("error")))
    end
    local saveTerm = term.current()
    term.redirect(screen)
    paintutils.drawImage(image, x, y)
    term.redirect(saveTerm)
  end
end

function drawTextCenter(txt, screen, color, bgcolor)
  local saveX, saveY = term.getCursorPos()
  local saveColor = term.getTextColor()
  local saveBgColor = term.getBackgroundColor()

  term.setTextColor(color)
  term.setBackgroundColor(bgcolor)
  local sWidth, sHeight = screen.getSize()
  screen.setCursorPos(math.ceil(sWidth / 2) - math.ceil(#txt / 2), math.ceil(sHeight / 2))
  screen.write(txt)

  term.setCursorPos(saveX, saveY)
  term.setTextColor(saveColor)
  term.setBackgroundColor(saveBgColor)
end

return {
  loadIcon = loadIcon
}
