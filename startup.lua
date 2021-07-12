local libs = {"turtleLib.lua", "turtleLib.lua", "computerLib.lua"}
local workdir = "/bitacu/"

for i, filename in ipairs(libs) do
  os.loadAPI(workdir .. filename)
end
shell.setPath(shell.path() .. ":" .. workdir)
