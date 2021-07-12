function hasValue(arr, val)
  for i, v in ipairs(arr) do
    print("Debug v:" .. v .. " val: " .. val)
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

return {
  hasValue = hasValue,
  printProcess = printProcess
}
