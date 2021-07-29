local configFile = fs.open("/config", "r")
local config = textutils.unserialize(configFile.readAll())
configFile.close()

return config