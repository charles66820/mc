local screen = peripheral.wrap("left")
screen.setCursorPos(3, 2)
screen.write("123")
while true do
  local event, side, x, y = os.pullEvent("monitor_touch")
  if x >= 3 and x <= 7 and y == 2 then
    screen.setCursorPos(3, 4)
    screen.write("click")
  end
end
