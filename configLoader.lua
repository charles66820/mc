-- config loader
settings.set("list.show_hidden", true)

function getConfig()
  local configFile = fs.open("/config", "r")
  config = textutils.unserialize(configFile.readAll())
  configFile.close()
  return config
end

return {
  getConfig = getConfig
}
