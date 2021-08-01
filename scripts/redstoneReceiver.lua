-- Redstone reciver
local cfun = computerLib
-- Args and vars def
local redstoneSide = nil
local protocol = nil
local keywordOn = nil
local keywordOff = nil

local args = {...}
if #args == 4 then
  redstoneSide = args[1]
  protocol = args[2]
  keywordOn = args[3]
  keywordOff = args[4]
else
  print("Usage: ", arg[0] or fs.getName(shell.getRunningProgram()), " <redstoneSide> <protocol> <keywordOn> <keywordOff>")
  return 128
end

while redstoneSide == nil or not cfun.hasValue(redstone.getSides(), redstoneSide) do
  print("Redstone output side :")
  redstoneSide = read()
end

-- save current run program in .run
local file = fs.open("/.run", "w")
file.write("redstoneReceiver " .. redstoneSide .. " " .. protocol .. " " ..  keywordOn .. " " .. keywordOff)
file.close()

local rednetSide = cfun.sideSearch("modem")

if rednetSide == nil then
  print("Can't connet to rednet!")
  print("Modem not found")
  return 1
end

-- main
rednet.open(rednetSide)

while true do
  local senderID, message, protocol = rednet.receive(protocol)
  if message == keywordOn then
    redstone.setOutput(redstoneSide, true)
  elseif message == keywordOff then
    redstone.setOutput(redstoneSide, false)
  else
  end
end
