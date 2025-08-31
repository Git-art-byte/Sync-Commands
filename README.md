# Late UI Library
### Credits to Late

## Installation
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))()
```

## Window
```lua
local Window = Library:CreateWindow({
    Title = "My Awesome GUI",
    Size = UDim2.fromOffset(570, 370),
    Transparency = 0.09,
    Blurring = true,
    MinimizeKeybind = Enum.KeyCode.RightControl,
    Theme = "Dark" -- Can be "Dark", "Light", or "Void"
})
```

## Notifications
```lua
Window:Notify({
    Title = "UI Loaded",
    Description = "Your interface has been successfully initialized!",
    Duration = 5
})
```

## Theme
```lua
Window:SetTheme(Themes.Void)
```
### Themes Available("More Themes Later")
- **Dark**  (Dark background)
- **Light** (Void background)
- **Void**  (Ligher Dark background)

## Sections
```lua
Window:AddSection({
    Name = "Main", 
    Tab = Main
})
})
```

## Tabs Section
```lua
Window:AddTabSection({
    Name = "Test",
    Order = 1
```
## Tabs
```lua
local CombatTab = Window:AddTab({
    Title = "Main",
    Section = "Test",
    Icon = "home"
})
```

## Toogle
```lua
Window:AddToggle({
    Title = "Enable Feature",
    Description = "Toggle this feature on/off",
    Default = false,
    Tab = Main,
    Callback = function(Value)
        print("Feature enabled:", Value)
    end
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
    Title = "Toggle Menu",
    Description = "Set key to open/close menu",
    Tab = Main,
    Callback = function(Key)
        print("Keybind set to:", Key)
    end
})
```

## Dropdowns
```lua
Window:AddDropdown({
    Title = "Weapon Selection",
    Description = "Choose your weapon",
    Options = {
        "Sword",
        "Axe",
        "Bow",
        "Staff"
    },
    Tab = Main,
    Callback = function(Value)
        print("Selected weapon:", Value)
    end
})
```

## Inputs/TextBox
```lua
Window:AddInput({
    Title = "Player Name",
    Description = "Enter a player's name",
    Tab = Main,
    Callback = function(Text)
        print("Input text:", Text)
    end
})
```

## Buttons
```lua
Window:AddButton({
    Title = "Execute Action",
    Description = "Perform a specific action",
    Tab = Main,
    Callback = function()
        print("Button clicked!")
        Window:Notify({
            Title = "Action Complete",
            Description = "The action was executed successfully",
            Duration = 3
        })
    end
})
```

## Sliders
```lua
Window:AddSlider({
    Title = "Speed Multiplier",
    Description = "Adjust your movement speed",
    MaxValue = 100,
    AllowDecimals = false,
    Tab = Main,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})
```

## Settings Tab
```lua
local SettingsTab = Window:AddTab({
    Title = "Settings",
    Icon = "settings"
})

Window:AddSection({
    Name = "UI Settings",
    Tab = SettingsTab
})

Window:AddKeybind({
    Title = "Minimize Keybind",
    Description = "Set the keybind for minimizing the UI",
    Tab = SettingsTab,
    Callback = function(Key)
        Window:SetSetting("Keybind", Key)
    end
})

Window:AddDropdown({
    Title = "UI Theme",
    Description = "Change the appearance of the UI",
    Tab = SettingsTab,
    Options = {
        "Dark",
        "Light", 
        "Void"
    },
    Callback = function(Theme)
        Window:SetTheme(Theme)
    end
})

Window:AddToggle({
    Title = "UI Blur Effect",
    Description = "Enable/disable background blur effect",
    Default = true,
    Tab = SettingsTab,
    Callback = function(Value)
        Window:SetSetting("Blur", Value)
    end
})

Window:AddSlider({
    Title = "UI Transparency",
    Description = "Adjust how transparent the UI appears",
    MaxValue = 1,
    AllowDecimals = true,
    DecimalAmount = 2,
    Tab = SettingsTab,
    Callback = function(Value)
        Window:SetSetting("Transparency", Value)
    end
})
```
