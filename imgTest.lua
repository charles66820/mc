local screen = peripheral.wrap("right")
term.redirect(screen)

local imageUrl = "https://cdn.discordapp.com/avatars/166236649007611904/61a99da3f8076594370c69048878aa17.png"

local download = http.get(imageUrl)
if download then
  print("Fetching image")
  fs.delete("/img.png")
  local file = fs.open("/img.png", "w")
  file.write(download.readAll())
  file.close()
  download.close()

  local image = paintutils.loadImage("img.png")
  paintutils.drawImage(image, 0, 0)

else
  print("Couldn't get image")
end