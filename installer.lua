-- vars def
local filesServerUrl = "https://raw.githubusercontent.com/charles66820/mc/main/"
local libs = {"computerLib.lua"}
local scripts = {"setName.lua", "keepStart.lua", "detectDevice.lua"}
local turtleScripts = {"ctunnel.lua", "detectBlock.lua", "dropper.lua", "rect.lua", "room.lua", "vtunnel.lua",
                       "ash.lua", "reinforcedStone.lua", "rectplacer.lua"}
local computerScripts = {"imgTest.lua", "screen.lua", "mobFarmScreen.lua", "reactorSecure.lua", "dj.lua", "speakbot.lua"}
local workdir = "/bitacu/"
local libsDirName = "libs/"
local scriptsDirName = "scripts/"
local installType = ""
local autorun = true

-- Args
local args = {...}

if #args == 1 then
  installType = args[1]
elseif #args == 2 then
  installType = args[1]
  if args[2] == "true" then
    autorun = true
  else
    autorun = false
  end
else
  print("Usage: ", arg[0] or fs.getName(shell.getRunningProgram()), " <installType> <autorun>")
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

-- if update
if installType == "update" then
  if fs.exists("/.installType") then
    local installTypeFile = fs.open("/.installType", "r")
    installType = installTypeFile.readAll()
    installTypeFile.close()
  else
    print("Error \".installType\" not found")
    return 1
  end
end

-- init installer
if installType == "turtle" then
  table.insert(libs, "turtleLib.lua")
  for i, v in ipairs(turtleScripts) do
    table.insert(scripts, v)
  end
elseif installType == "computer" then
  table.insert(libs, "screenLib.lua")
  for i, v in ipairs(computerScripts) do
    table.insert(scripts, v)
  end
elseif installType == "redstoneReceiver" then
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

local installTypeFile = fs.open("/.installType", "w")
installTypeFile.write(installType)
installTypeFile.close()

-- Check computer name
if os.getComputerLabel() == nil then
  print("Give me a name please :")
  os.setComputerLabel(read())
end

-- Download scripts and libs
fs.delete(workdir)
fs.makeDir(workdir)
loadFiles("", {"configLoader.lua"})
loadFiles(libsDirName, libs)
loadFiles(scriptsDirName, scripts)

-- Configs file
local config = {
  dropBadItems = false,
  dropItemList = {"minecraft:cobblestone", "minecraft:stone", "minecraft:andesite", "minecraft:diorite",
                  "minecraft:granite", "minecraft:gravel", "minecraft:netherrack"},
  fuelList = {"minecraft:coal", "minecraft:charcoal"}
}

local configFile = fs.open("/config", "w")
configFile.write(textutils.serialize(config))
configFile.close()

-- Startup file
local startupContent = "local libs = " .. textutils.serialize(libs) .. "\n"
startupContent = startupContent .. "local workdir = \"" .. workdir .. "\"\n"
startupContent = startupContent .. "local libsDirName = \"" .. libsDirName .. "\"\n"
startupContent = startupContent .. "local scriptsDirName = \"" .. scriptsDirName .. "\"\n"
startupContent = startupContent .. [[
-- load config
os.loadAPI(workdir .. "configLoader.lua")

-- load libs
for i, filename in ipairs(libs) do
  os.loadAPI(workdir .. libsDirName .. filename)
end

-- defind path
shell.setPath(shell.path() .. ":" .. workdir .. scriptsDirName)

-- autorun
if fs.exists("/.run") then
  local file = fs.open("/.run", "r")
  shell.run(file.readAll())
  file.close()
end
]]

local startup = fs.open("startup", "w")
startup.write(startupContent)
startup.close()

if autorun then
  shell.run("startup")
end
