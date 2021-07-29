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

function printProcess(msg)
  local x, y = term.getCursorPos()
  local saveColor = term.getTextColor()
  local saveBgColor = term.getBackgroundColor()
  term.setCursorPos(1, 1)
  term.clearLine()
  term.setTextColor(colors.black)
  term.setBackgroundColor(colors.white)
  term.write(msg)
  term.setCursorPos(x, y)
  term.setTextColor(saveColor)
  term.setBackgroundColor(saveBgColor)
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

return {
  hasValue = hasValue,
  printProcess = printProcess,
  loadFile = loadFile
}
