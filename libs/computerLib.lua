local config = configLoader.getConfig()

function hasValue(arr, val)
  for i, v in ipairs(arr) do
    if v == val then
      return true
    end
  end
  return false
end

function printAt(txt, x, y, color, bgcolor, screen, clearLine)
  if screen == nil then
    screen = term
  end
  if clearLine == nil then
    clearLine = false
  end
  local saveX, saveY = screen.getCursorPos()
  local saveColor = screen.getTextColor()
  local saveBgColor = screen.getBackgroundColor()

  screen.setTextColor(color)
  screen.setBackgroundColor(bgcolor)
  screen.setCursorPos(x, y)
  if clearLine then
    screen.clearLine()
  end
  screen.write(txt)

  screen.setCursorPos(saveX, saveY)
  screen.setTextColor(saveColor)
  screen.setBackgroundColor(saveBgColor)
end

function printProcessAt(msg, x, y)
  printAt(msg, x, y, colors.black, colors.white, term, true)
end

function printProcess(msg)
  printProcessAt(msg, 1, 1)
end

function loadFile(name)
  local download = http.get(config.filesServerUrl .. name)
  if download then
    print("Fetching " .. name)
    local file = fs.open(config.workdir .. name, "w")
    file.write(download.readAll())
    file.close()
    download.close()
    return true
  else
    print("Couldn't get " .. name)
    return false
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

function registredLoop(cb)
  -- todo: registred process
  -- todo: pause process
  cb()
end

return {
  hasValue = hasValue,
  printAt = printAt,
  printProcessAt = printProcessAt,
  printProcess = printProcess,
  loadFile = loadFile,
  sideSearch = sideSearch,
  registredLoop = registredLoop
}
