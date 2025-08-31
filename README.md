# Late UI Library

## Service

```lua
local UserInputService = game:GetService("UserInputService");
```

## Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/LateUI/main/Source.lua"))()
```

## Window
```lua
local Window = Library:CreateWindow({
	Title = "My Library",
	Theme = "Dark",
	Size = UDim2.fromOffset(570, 370),
	Transparency = 0.2,
	Blurring = true,
	MinimizeKeybind = Enum.KeyCode.LeftAlt,
})
```
### Themes
Dark,Light,Void

## Sections
```lua
Window:AddTabSection({
    Name = "Main",
    Order = 1
})
```

## Tabs
```lua
local Main = Window:AddTab({
	Title = "Components",
	Section = "Main",
	Icon = "rbxassetid://11963373994"
})
```

## Paragraphs
```lua
Window:AddParagraph({Title="Paragraph", Description="Text.", Tab = Main})
```
