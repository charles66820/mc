-- Redstone reciver
local cfun = computerLib
-- Args and vars def
local rednetSide = nil
local redstoneSide = nil
local protocol = nil
local keywordOn = nil
local keywordOff = nil

local args = {...}
if #args == 5 then
  rednetSide = args[1] -- TODO: auto ?
  redstoneSide = args[2]
  protocol = args[3]
  keywordOn = args[4]
  keywordOff = args[5]
else
  print("Usage: ", args[0], " <rednetSide> <redstoneSide> <protocol> <keywordOn> <keywordOff>")
  return 128
end

while redstoneSide == nil or not cfun.hasValue(redstone.getSides(), redstoneSide) do
  print("Redstone output side :")
  redstoneSide = read()
end

-- save current run program in .run
local file = fs.open("/.run", "w")
file.write("redstoneReceiver " .. rednetSide .. " " .. redstoneSide .. " " .. protocol .. " " ..  keywordOn .. " " .. keywordOff)
file.close()

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
