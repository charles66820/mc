rednet.open("right")

local width = 12
local height = 4

local mobs = {
  {
    x = 1,
    y = 1,
    name = "sheep",
    text = "sheep",
    text2 = nil,
    active = false
  },
  {
    x = 13,
    y = 1,
    name = "chicken",
    text = "chicken",
    text2 = nil,
    active = false
  },
  {
    x = 25,
    y = 1,
    name = "stonelings",
    text = "stonelings",
    text2 = nil,
    active = false
  },
  {
    x = 37,
    y = 1,
    name = "skeleton",
    text = "skeleton",
    text2 = nil,
    active = false
  },
  {
    x = 49,
    y = 1,
    name = "cow",
    text = "cow",
    text2 = nil,
    active = false
  },
  {
    x = 1,
    y = 5,
    name = "frog",
    text = "frog",
    text2 = nil,
    active = false
  },
  {
    x = 13,
    y = 5,
    name = "pig",
    text = "pig",
    text2 = nil,
    active = false
  },
  {
    x = 25,
    y = 5,
    name = "witherSkeleton",
    text = "wither",
    text2 = "skeleton",
    active = false
  },
  {
    x = 37,
    y = 5,
    name = "enderman",
    text = "enderman",
    text2 = nil,
    active = false
  },
  {
    x = 49,
    y = 5,
    name = "witch",
    text = "witch",
    text2 = nil,
    active = false
  }
}

local screen = peripheral.wrap("left")

for i, v in ipairs(mobs) do
  local saveColor = term.getTextColor()
  local saveBgColor = term.getBackgroundColor()
  screen.setCursorPos(v.x, v.textY)
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.red)
  screen.write(v.text)
  if v.text2 ~= nill then
    screen.setCursorPos(v.x, v.textY + 1)
    screen.write(v.text2)
  end
  term.setTextColor(saveColor)
  term.setBackgroundColor(saveBgColor)
end

while true do
  local event, side, x, y = os.pullEvent("monitor_touch")
  for i, v in ipairs(mobs) do
    if x >= v.x and x < v.x + width and y >= v.y and y < v.y + height then
      mobs[i].active = not mobs[i].active
      local saveColor = term.getTextColor()
      local saveBgColor = term.getBackgroundColor()
      screen.setCursorPos(v.x, v.y + math.floor(height / 2) - 1)
      term.setTextColor(colors.white)
      if mobs[i].active then
        term.setBackgroundColor(colors.green)
      else
        term.setBackgroundColor(colors.red)
      end
      screen.write(v.text)
      if v.text2 ~= nill then
        screen.setCursorPos(v.x, v.y + math.floor(height / 2))
        screen.write(v.text2)
      end
      term.setTextColor(saveColor)
      term.setBackgroundColor(saveBgColor)
    end
    if mobs[i].active then
      rednet.broadcast(v.name .. "On","spawner")
    else
      rednet.broadcast(v.name .. "Off","spawner")
    end
  end
end
