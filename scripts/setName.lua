local args = {...}

local name = nil

if #args == 1 then
  name = args[1]
elseif #args > 1 then
  print("Usage: ", args[0], " <name>")
  os.exit(128)
end

if name == nil then
  print("name :")
  name = read()
end

os.setComputerLabel(name)