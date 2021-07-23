-- vars def
local filesServerUrl = "https://raw.githubusercontent.com/charles66820/mc/main/"
local libs = {"computerLib.lua"}
local scripts = {"setName.lua", "detectDevice.lua"}
local turtleScripts = {"ctunnel.lua", "detectBlock.lua", "dropper.lua", "rect.lua", "room.lua", "vtunnel.lua", "ash.lua", "reinforcedStone.lua", "rectplacer.lua"}
local computerScripts = {"imgTest.lua", "screen.lua", "mobFarmScreen.lua"}
local workdir = "/bitacu/"
local libsDirName = "libs/"
local scriptsDirName = "scripts/"
local deviceType = ""

-- Args
local args = {...}

if #args == 1 then
  deviceType = args[1]
else
  print("Usage: ", args[0], " <deviceType>")
  return 128
end

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
if deviceType == "turtle" then
  table.insert(libs, "turtleLib.lua")
  for i, v in ipairs(turtleScripts) do
    table.insert(scripts, v)
  end
elseif deviceType == "computer" then
  table.insert(libs, "screenLib.lua")
  for i, v in ipairs(computerScripts) do
    table.insert(scripts, v)
  end
elseif deviceType == "redstoneReceiver" then
  table.insert(scripts, "redstoneReceiver.lua")
else -- all
  table.insert(libs, "turtleLib.lua")
  table.insert(libs, "screenLib.lua")
  for i, v in ipairs(computerScripts) do
    table.insert(scripts, v)
  end
  for i, v in ipairs(turtleScripts) do
    table.insert(scripts, v)
  end
  table.insert(scripts, "redstoneReceiver.lua")
end

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

if fs.exists("/.run") then
  local file = fs.open("/.run", "r")
  startupContent = startupContent .. "shell.run(\"" .. file.readAll() .. "\")\n"
  file.close()
end

local startup = fs.open("startup", "w")
startup.write(startupContent)
startup.close()

shell.run("startup")
