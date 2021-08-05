local config = configLoader.getConfig()

local startup = false

if #args == 1 then
  if args[1] == "true" then
    startup = true
  else
    startup = false
  end
end

shell.run("wget", "run", config.filesServerUrl .. "installer.lua", "update", startup)