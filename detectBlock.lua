-- Detect block

local success, data = turtle.inspect()

print("Inspect output: ", success)
if success then
  print("Inspect output name: ", data.name)
  print("Inspect output metadata: ", data.metadata)
end