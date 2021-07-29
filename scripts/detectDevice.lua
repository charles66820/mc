-- Detect machine
local cfun = computerLib
-- Args and vars def
local args = {...}

-- Main
local sides = peripheral.getNames()

if #sides == 0 then
  cfun.printProcess("Device is not present")
  return 1
end

for i, side in ipairs(sides) do
  print(peripheral.getType(side) .. " found at \"" .. side .. "\".")
	for j, v in ipairs(peripheral.getMethods(side)) do
		if j == 1 then
			term.write("Methods : " .. v)
		else
			term.write(", " .. v)
		end
	end
end

while true do
  local event, scrollDirection, x, y = os.pullEvent("mouse_scroll")
  term.scroll(scrollDirection)
end
