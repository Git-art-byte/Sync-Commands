# Late UI Library
### Credits to Late

## Service

```lua
local UserInputService = game:GetService("UserInputService");
```

## Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/refs/heads/main/Source.lua"))()
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

## Notifications
```lua
Window:Notify({
    Title = "Hello World!",
    Description = "Press Left Alt to Minimize and Open the tab!",
    Duration = 5
})
```

## Themes
- **Dark**  (Primary background)
- **Light** (Void background)
- **Void**  (Light background)

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
Window:AddParagraph({
    Title = "Paragraph",
    Description = "Insert any important text here.",
    Tab = Main
})
```

## Keybinds
```lua
Window:AddKeybind({
    Title = "Keybind",
    Description = "Press a key to bind",
    Tab = Main,
    Default = Enum.KeyCode.LeftAlt,
    Callback = function(Key)
        Window:SetSetting("Keybind", Key)
        print("Keybind set to:", Key)
    end
})
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
