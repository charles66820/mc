-- Dig a room
local cfun = computerLib
local tfun = turtleLib

-- Args and vars def
local width = 0
local args = {...}

if #args == 1 then
  width = tonumber(args[1])
elseif #args > 1 then
  print("Usage: ", arg[0] or fs.getName(shell.getRunningProgram()), " <width>")
  return 128
end

if width <= 0 then
  print("Longeur :")
  width = tonumber(read())
end

-- functions
function start()
  tfun.digDownAndDown(2)
  turtle.turnLeft()
  shell.run("rect", 1, width, 2, "false", "false")

  tfun.digDownAndDown(2)
  turtle.turnLeft()
  tfun.turnAround()
  shell.run("rect", 1, width, 2, "false", "false")

  tfun.digDownAndDown(2)
  turtle.turnLeft()
  shell.run("rect", 1, width, 2, "false", "false")

  tfun.digDownAndDown(2)
  turtle.turnLeft()
  tfun.turnAround()
  shell.run("rect", 3, width, 1, "false", "false")

end

start()
