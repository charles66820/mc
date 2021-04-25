function plante()
  i = 0
  while i < 4 do
    turtle.digDown()
    turtle.placeDown()
    u = 0
    while u < 5 do
      turtle.forward(1)
      u = u + 1
    end
    i = i + 1
  end
end

function voiyaged()
  turtle.digDown()
  turtle.placeDown()
  turtle.turnRight(1)
  y = 0
  while y < 5 do
    turtle.forward(1)
    y = y + 1
  end
  turtle.turnRight(1)
end

function voiyageg()
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft(1)
  y = 0
  while y < 5 do
    turtle.forward(1)
    y = y + 1
  end
  turtle.turnLeft(1)
end

function par()
  turtle.forward(1)
  turtle.forward(1)
  turtle.turnRight(1)
  turtle.forward(1)
  turtle.forward(1)
  turtle.forward(1)
  turtle.turnLeft(1)
  plante()
  voiyaged()
  plante()
  voiyageg()
  plante()
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft(1)
  z = 0
  while z < 13 do
    turtle.forward(1)
    z = z + 1
  end
  turtle.turnLeft(1)
  l = 0
  while l < 22 do
    turtle.forward(1)
    l = l + 1
  end
  turtle.turnRight(1)
  turtle.turnRight(1)
end
par()
