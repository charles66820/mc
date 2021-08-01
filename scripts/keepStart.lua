-- Save start cmd line in .run for startup
local cmd = ""
local args = {...}

if #args >= 1 then
  for i, v in ipairs(args) do
    if i == 0 then
      cmd = cmd .. v
    else
      cmd = cmd .. " " .. v
    end
  end
else
  print("Usage: ", args[0], " <cmd> [<arg1> <arg2> ...]")
  return 128
end

-- save current run program in .run
local file = fs.open("/.run", "w")
file.write(cmd)
file.close()

-- start program
shell.run(cmd)