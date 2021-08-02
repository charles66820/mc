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

  local saveTerm = term.current()
  term.redirect(screen)

  local iconPath = getIconPath(getIconFileName(name))

  if not fs.exists(iconPath) then
    cfun.loadFile(iconDirName .. getIconFileName(name))
  end

  if fs.exist(iconPath) then
    local image = paintutils.loadImage(iconPath)
    if image ~= nil then
      image = paintutils.loadImage(getIconPath(getIconFileName("error")))
    end
    paintutils.drawImage(image, x, y)
  end
  term.redirect(saveTerm)
end

return {
  loadIcon = loadIcon
}
