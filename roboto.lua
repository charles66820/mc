function mine1()
  i = 0
  while i < 24 do
    turtle.dig()
    turtle.digUp()
    turtle.forward(1)
    i = i + 1
  end
end

function passe1()
  mine1()
  turtle.turnRight(1)
  turtle.dig()
  turtle.digUp()
  turtle.forward(1)
  turtle.turnRight(1)
end

function passe2()
  mine1()
  turtle.turnLeft(1)
  turtle.dig()
  turtle.digUp()
  turtle.forward(1)
  turtle.turnLeft(1)
end

function stage1()
  f = 0
  while f < 7 do
    passe1()
    passe2()
    f = f + 1
  end
end

function backup1()
  turtle.turnRight(1)
  d = 0
  while d < 15 do
    turtle.dig()
    turtle.forward(1)
    d = d + 1
  end
  turtle.turnRight(1)
  turtle.digUp()
  turtle.up(1)
  turtle.digUp()
  turtle.up(1)
end
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
function end1()
  d = 0
  while d < 10 do
    turtle.down()
    d = d + 1
  end
  par()
end

function start()
  g = 0
  while g < 5 do
    stage1()
    passe1()
    mine1()
    backup1()
    g = g + 1
  end
end
start()
end1()
