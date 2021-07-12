local cfun = computerLib

local workdir = "/bitacu/"
local iconDirName = "icon/"
local iconDir = workdir .. iconDirName

function loadIcon(name, x, y)
  local iconFilename = name .. ".bmp"
  local iconPath = iconDir .. iconFilename

  if not fs.exists(iconPath) then
    cfun.loadFile(iconDirName .. iconFilename)
  end

  local image = paintutils.loadImage(iconPath)
  paintutils.drawImage(image, x, y)
end

return {
  loadIcon = loadIcon
}
