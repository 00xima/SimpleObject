![Version: 1.0](https://img.shields.io/badge/Version-1.0-blue?style=for-the-badge)

# SimpleObject - Create Objects Easily

The SimpleObject module gives you the ability to easily create objects using [method chaining](https://en.wikipedia.org/wiki/Method_chaining).
<br>

- Get the SimpleObject module from [Roblox library](https://www.roblox.com/library/6834982845/SimpleObject-Create-Objects-Easily).

<br>

## Usage

```lua
local customPart = SimpleObject.new(Instance.new("Part"))
.parent(workspace)
.cframe(CFrame.new(0, 2, 0))
.shape(Enum.PartType.Ball)

--events
customObject._instance.Touched:Connect(function() end)
```
