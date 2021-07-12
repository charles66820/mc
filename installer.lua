local url = "https://raw.githubusercontent.com/charles66820/mc/main/"
local files = {"startup.lua", "turtleLib.lua", "computerLib.lua", "ctunnel.lua", "detectBlock.lua", "dropper.lua", "rect.lua", "room.lua", "vtunnel.lua", "setName.lua", "ash.lua", "screenLib.lua", "detectDevice.lua", "imgTest.lua"}

local workdir = "/bitacu/"

fs.makeDir(workdir)
for i, filename in ipairs(files) do
  local download = http.get(url .. filename)
  if download then
    print("Fetching " .. filename)
    fs.delete(workdir .. filename)
    local file = fs.open(workdir .. filename, "w")
    file.write(download.readAll())
    file.close()
    download.close()
  else
    print("Couldn't get " .. filename)
  end
end

local startupContent = [[
  shell.run("bitacu/startup")
]]

local startup = fs.open("startup", "w")
startup.write(startupContent)
startup.close()

shell.run("bitacu/startup")