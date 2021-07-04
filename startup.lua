local libs = {"turtleLib.lua"}
local workdir = "/bitacu/"

for i, filename in ipairs(libs) do
  os.loadAPI(workdir .. filename)
end
print(shell.path())
shell.setPath(shell.path() .. ":" .. workdir)
