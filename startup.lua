local files = {"turtleLib.lua", "ctunnel.lua", "detectBlock.lua", "dropper.lua", "rect.lua", "room.lua", "vtunnel.lua", "setName.lua"}
local workdir = "/bitacu/"

for i, filename in ipairs(files) do
  os.loadAPI(workdir .. filename)
end