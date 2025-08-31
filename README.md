# Late UI Library
### Credits to Late

## Service

```lua
local UserInputService = game:GetService("UserInputService");
```

## Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))()
```

## Window
```lua
local Window = Library:CreateWindow({
	Title = "My Library",
	Theme = "Void",
	Size = UDim2.fromOffset(570, 370),
	Transparency = 0.09,
	Blurring = true,
	MinimizeKeybind = Enum.KeyCode.LeftAlt,
})
```

## Notifications
```lua
Window:Notify({
    Title = "Hello World!",
    Description = "Press Left Alt to Minimize and Open the tab!",
    Duration = 5
})
```

## Themes
- **Dark**  (Dark background)
- **Light** (Void background)
- **Void**  (Light background)
  ```lua
  local Themes = {
	Light = {
		--// Frames:
		Primary = Color3.fromRGB(232, 232, 232),
		Secondary = Color3.fromRGB(255, 255, 255),
		Component = Color3.fromRGB(245, 245, 245),
		Interactables = Color3.fromRGB(235, 235, 235),

		--// Text:
		Tab = Color3.fromRGB(50, 50, 50),
		Title = Color3.fromRGB(0, 0, 0),
		Description = Color3.fromRGB(100, 100, 100),

		--// Outlines:
		Shadow = Color3.fromRGB(255, 255, 255),
		Outline = Color3.fromRGB(210, 210, 210),

		--// Image:
		Icon = Color3.fromRGB(100, 100, 100),
	},
	
	Dark = {
		--// Frames:
		Primary = Color3.fromRGB(30, 30, 30),
		Secondary = Color3.fromRGB(35, 35, 35),
		Component = Color3.fromRGB(40, 40, 40),
		Interactables = Color3.fromRGB(45, 45, 45),

		--// Text:
		Tab = Color3.fromRGB(200, 200, 200),
		Title = Color3.fromRGB(240,240,240),
		Description = Color3.fromRGB(200,200,200),

		--// Outlines:
		Shadow = Color3.fromRGB(0, 0, 0),
		Outline = Color3.fromRGB(40, 40, 40),

		--// Image:
		Icon = Color3.fromRGB(220, 220, 220),
	},
	
	Void = {
		--// Frames:
		Primary = Color3.fromRGB(15, 15, 15),
		Secondary = Color3.fromRGB(20, 20, 20),
		Component = Color3.fromRGB(25, 25, 25),
		Interactables = Color3.fromRGB(30, 30, 30),

		--// Text:
		Tab = Color3.fromRGB(200, 200, 200),
		Title = Color3.fromRGB(240,240,240),
		Description = Color3.fromRGB(200,200,200),

		--// Outlines:
		Shadow = Color3.fromRGB(0, 0, 0),
		Outline = Color3.fromRGB(40, 40, 40),

		--// Image:
		Icon = Color3.fromRGB(220, 220, 220),
	},

### Default Theme
```lua
Window:SetTheme(Themes.Dark)
```
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

## Settings Tab
```lua
local Keybind = nil
local Settings = Window:AddTab({
	Title = "Settings",
	Section = "Settings",
	Icon = "rbxassetid://11293977610",
})

Window:AddKeybind({
	Title = "Minimize Keybind",
	Description = "Set the keybind for Minimizing",
	Tab = Settings,
	Callback = function(Key) 
		Window:SetSetting("Keybind", Key)
	end,
}) 

Window:AddDropdown({
	Title = "Set Theme",
	Description = "Set the theme of the library!",
	Tab = Settings,
	Options = {
		["Light Mode"] = "Light",
		["Dark Mode"] = "Dark",
		["Extra Dark"] = "Void",
	},
	Callback = function(Theme) 
		Window:SetTheme(Themes[Theme])
	end,
}) 

Window:AddToggle({
	Title = "UI Blur",
	Description = "If enabled, must have your Roblox graphics set to 8+ for it to work",
	Default = true,
	Tab = Settings,
	Callback = function(Boolean) 
		Window:SetSetting("Blur", Boolean)
	end,
}) 


Window:AddSlider({
	Title = "UI Transparency",
	Description = "Set the transparency of the UI",
	Tab = Settings,
	AllowDecimals = true,
	MaxValue = 1,
	Callback = function(Amount) 
		Window:SetSetting("Transparency", Amount)
	end,
}) 

Window:Notify({
	Title = "Hello World!",
	Description = "Press Left Alt to Minimize and Open the tab!", 
	Duration = 10
})

--// Keybind Example
UserInputService.InputBegan:Connect(function(Key) 
	if Key == Keybind then
		warn("You have pressed the minimize keybind!");
	end
end)
```
## Paragraphs

```lua
Window:AddParagraph({
    Title = "Paragraph",
    Description = "Insert any important text here.",
    Tab = Main
})
```

## Keybinds
```lua
UserInputService.InputBegan:Connect(function(Key) 
	if Key == Keybind then
		warn("You have pressed the minimize keybind!");
	end
end)
```

## Dropdowns
```lua
Window:AddDropdown({
    Title = "Dropdown",
    Description = "Select an option",
    Tab = Main,
    Options = {
        ["Option 1"] = "Value1",
        ["Option 2"] = "Value2",
        ["Option 3"] = "Value3"
    },
    Callback = function(Value)
        print("Selected:", Value)
    end
})
```

## Inputs/TextBox
```lua
Window:AddInput({
    Title = "Input",
    Description = "Type something",
    Tab = Main,
    Callback = function(Text)
        print("Input text:", Text)
    end
})
```

## Toogles
```lua
Window:AddToggle({
    Title = "Toggle",
    Description = "Switch On/Off",
    Tab = Main,
    Callback = function(State)
        print("Toggle is:", State)
    end
})
```

## Sliders
```lua
Window:AddSlider({
    Title = "Slider",
    Description = "Slide to change value",
    Tab = Main,
    MaxValue = 100,
    Callback = function(Amount)
        print("Slider value:", Amount)
    end
})
```

## Buttons
```lua
Window:AddButton({
    Title = "Button",
    Description = "I wonder what this does",
    Tab = Main,
    Callback = function()
        Window:Notify({
            Title = "Hi!",
            Description = "You clicked the button",
            Duration = 5
        })
    end
})
```
