local i = 0
function line()
  turtle.digDown()
  turtle.placeDown()
  turtle.forward(1)
  i = i + 1
end
function start()
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft(1)
  turtle.forward(1)
  turtle.turnLeft(1)
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnRight(1)
  turtle.forward(1)
  turtle.turnRight(1)
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft(1)
  turtle.forward(1)
  turtle.turnLeft(1)
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnRight(1)
  turtle.forward(1)
  turtle.turnRight(1)
  i = 0
  while i < 4 do
    line()
  end
  turtle.forward(1)
  i = 0
  while i < 3 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft(1)
  turtle.forward(1)
  turtle.turnLeft(1)
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnRight(1)
  turtle.forward(1)
  turtle.turnRight(1)
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft(1)
  turtle.forward(1)
  turtle.turnLeft(1)
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnRight(1)
  turtle.forward(1)
  turtle.turnRight(1)
  i = 0
  while i < 8 do
    line()
  end
  turtle.digDown()
  turtle.placeDown()
  turtle.turnRight(1)
  turtle.turnRight(1)
  sleep(300)
  start()
end
start()
