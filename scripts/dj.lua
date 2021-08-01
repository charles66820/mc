local speaker = peripheral.find("speaker")
while true do
  speaker.playSound("minecraft:ambient.cave")
  os.sleep(6)
  speaker.playSound("minecraft:entity.wither.spawn")
  os.sleep(6)
end

-- on click on screen
--speaker.playSound("minecraft:ui.button.click")