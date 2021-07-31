# CC

## Install

Download the installer

```bash
wget https://raw.githubusercontent.com/charles66820/mc/main/installer.lua
```

Install all scripts and libs

```bash
installer all
```

or customized your install

> for turtle

```bash
installer turtle
```

> for computer

```bash
installer computer
```

> for redstone receiver

```bash
installer redstoneReceiver
```

## update libs and scripts

```bash
installer update
```

## update installer

```bash
rm installer.lua
wget https://raw.githubusercontent.com/charles66820/mc/main/installer.lua
installer update
```

## Tests

```lua
-- local success, msg = turtle.forward()
-- print("Forward output: ", success)
-- print("Forward output msg nil: ", msg == nil)
-- print("Forward output msg fuel: ", msg == "Out of fuel")
-- print("Forward output msg move: ", msg == "Movement obstructed")
```
