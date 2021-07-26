-- save cmd in .run

-- Security check
local reactor = nil
while reactor == nil do
  reactor = peripheral.wrap("back")
  while true do
    local info = reactor.getReactorInfo()
    if info.status == "beyond_hope" then
      redstone.setOutput("left", true)
    end
  end
end