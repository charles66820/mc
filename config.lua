-- config loader
local configFile = fs.open("/config", "r")
local config = textutils.unserialize(configFile.readAll())
configFile.close()

settings.set("list.show_hidden", true)

return {
  config = config
}