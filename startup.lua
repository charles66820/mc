local libs = {"turtleLib.lua"}
local workdir = "/bitacu/"

for i, filename in ipairs(libs) do
  os.loadAPI(workdir .. filename)
end
print(shell.getPath())
shell.setPath(shell.getPath() .. ":" .. workdir)
