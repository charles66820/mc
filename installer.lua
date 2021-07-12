local filesServerUrl = "https://raw.githubusercontent.com/charles66820/mc/main/"
local libs = {"computerLib.lua", "turtleLib.lua", "screenLib.lua"}
local scripts = {"ctunnel.lua", "detectBlock.lua", "dropper.lua", "rect.lua", "room.lua", "vtunnel.lua", "setName.lua",
                 "ash.lua", "detectDevice.lua", "imgTest.lua"}
local workdir = "/bitacu/"
local libsDirName = "libs/"
local scriptsDirName = "scripts/"

-- Functions
function loadFiles(prefix, files)
  for i, filename in ipairs(files) do
    local download = http.get(filesServerUrl .. prefix .. filename)
    if download then
      print("Fetching " .. filename)
      local file = fs.open(workdir .. prefix .. filename, "w")
      file.write(download.readAll())
      file.close()
      download.close()
    else
      print("Couldn't get " .. filename)
    end
  end
end

-- Main
fs.delete(workdir)
fs.makeDir(workdir)
loadFiles(libsDirName, libs)
loadFiles(scriptsDirName, scripts)

local startupContent = "local libs = " .. textutils.serialize(libs) .. "\n"
startupContent = startupContent .. "local workdir = \"" .. workdir .. "\"\n"
startupContent = startupContent .. "local libsDirName = \"" .. libsDirName .. "\"\n"
startupContent = startupContent .. "local scriptsDirName = \"" .. scriptsDirName .. "\"\n"
startupContent = startupContent .. [[
for i, filename in ipairs(libs) do
  os.loadAPI(workdir .. libsDirName .. filename)
end
shell.setPath(shell.path() .. ":" .. workdir .. scriptsDirName)
]]

local startup = fs.open("startup", "w")
startup.write(startupContent)
startup.close()

shell.run("startup")
