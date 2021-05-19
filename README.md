![Version: 1.01](https://img.shields.io/badge/Version-1.01-blue?style=for-the-badge)

# SimpleObject - Create Objects Easily

The SimpleObject module gives you the ability to easily create objects using [method chaining](https://en.wikipedia.org/wiki/Method_chaining).
<br>

- Get the SimpleObject module from [Roblox library](https://www.roblox.com/library/6834982845/SimpleObject-Create-Objects-Easily).

<br>

## Usage

```lua

--instantiate
local part = SimpleObject.new(Instance.new("Part"))
.setShape(Enum.PartType.Ball)
.setCFrame(CFrame.new(0, 20, 0))
.setParent(workspace)

--property
print(part.Name)

--event
part.Touched:Connect(function() print("Touched!") end)

--function
print(part:IsA("BasePart"))

```
