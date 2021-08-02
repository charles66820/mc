local radar = peripheral.find("radar")
local speech = peripheral.find("speech_box")
local chat = peripheral.find("chat_box")
speech.setVolume(100) -- 127 max
chat.setName("magibot")
chat.setDistance(40) -- 40 max

local count = 0
while true do
  count = count + 1
  for i, v in ipairs(radar.getEntities()) do
    speech.say("Hello " .. v.name .. " i am " .. chat.getName() .. " and i see you! Your ar at " .. v.distance .. "blocks of me! (" .. count .. ")")
    chat.say("Hello " .. v.name .. " i am " .. chat.getName() .. " and i see you! Your ar at " .. v.distance .. "blocks of me! (" .. count .. ")")
  end
  os.sleep(10)
end
