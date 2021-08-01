# CC

## Install

Install all scripts and libs

```bash
wget run https://raw.githubusercontent.com/charles66820/mc/main/installer.lua all
```

or customized your install

> for turtle

```bash
wget run https://raw.githubusercontent.com/charles66820/mc/main/installer.lua turtle
```

> for computer

```bash
wget run https://raw.githubusercontent.com/charles66820/mc/main/installer.lua computer
```

> for redstone receiver

```bash
wget run https://raw.githubusercontent.com/charles66820/mc/main/installer.lua redstoneReceiver
```

## update libs and scripts

```bash
wget run https://raw.githubusercontent.com/charles66820/mc/main/installer.lua update
```

> without startup run

```bash
wget run https://raw.githubusercontent.com/charles66820/mc/main/installer.lua update false
```

## Tests

```lua
-- local success, msg = turtle.forward()
-- print("Forward output: ", success)
-- print("Forward output msg nil: ", msg == nil)
-- print("Forward output msg fuel: ", msg == "Out of fuel")
-- print("Forward output msg move: ", msg == "Movement obstructed")
```
