local filesServerUrl = "https://raw.githubusercontent.com/charles66820/mc/main/"
local workdir = "/bitacu/"

function hasValue(arr, val)
  for i, v in ipairs(arr) do
    if v == val then
      return true
    end
  end
  return false
end

function printProcessAt(msg, x, y)
  local saveX, saveY = term.getCursorPos()
  local saveColor = term.getTextColor()
  local saveBgColor = term.getBackgroundColor()
  term.setCursorPos(x, y)
  term.clearLine()
  term.setTextColor(colors.black)
  term.setBackgroundColor(colors.white)
  term.write(msg)
  term.setCursorPos(saveX, saveY)
  term.setTextColor(saveColor)
  term.setBackgroundColor(saveBgColor)
end

function printProcess(msg)
  printProcessAt(msg, 1, 1)
end

function loadFile(name)
  local download = http.get(filesServerUrl .. name)
  if download then
    print("Fetching " .. name)
    local file = fs.open(workdir .. name, "w")
    file.write(download.readAll())
    file.close()
    download.close()
  else
    print("Couldn't get " .. name)
  end
end

function sideSearch(type)
  for i, side in ipairs(peripheral.getNames()) do
    if peripheral.getType(side) == type then
      return side
    end
  end
  return nil
end

return {
  hasValue = hasValue,
  printProcessAt = printProcessAt,
  printProcess = printProcess,
  loadFile = loadFile,
  sideSearch = sideSearch
}
