shell.run("mkdir src")
shell.run("cd src")
shell.run("wget https://files.magicorp.fr/mc/turtleLib.lua")
shell.run("wget https://files.magicorp.fr/mc/room.lua")
shell.run("wget https://files.magicorp.fr/mc/ctunnel.lua")
shell.run("wget https://files.magicorp.fr/mc/rect.lua")
shell.run("wget https://files.magicorp.fr/mc/dropper.lua")
shell.run("wget https://files.magicorp.fr/mc/detectBlock.lua")
shell.run("wget https://files.magicorp.fr/mc/rect.lua")
shell.run("cd ..")
shell.run("rm load.lua")
shell.run("cd src")