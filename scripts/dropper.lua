-- Drop items with an interval
local cfun = computerLib
-- Args and vars def
local time = 0
local nbDrop = 0
local args = {...}

if #args == 1 then
  time = tonumber(args[1])
elseif #args == 2 then
  time = tonumber(args[1])
  nbDrop = tonumber(args[2])
elseif #args > 2 then
  print("Usage: ", arg[0] or fs.getName(shell.getRunningProgram()), " <time> <nbDrop>")
  return 128
end

if time <= 0 then
  print("Temps en second :")
  time = tonumber(read())
end

if nbDrop <= 0 then
  print("Nombre de drops :")
  nbDrop = tonumber(read())
end

cfun.registredLoop(function()
  for n = 1, 16 do
    if turtle.getItemCount(n) > 0 then
      turtle.select(n)
      turtle.drop(nbDrop)
      break
    end
  end
  os.sleep(time)
end)
