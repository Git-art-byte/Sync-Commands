-- Example script using your UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))() -- Replace with your actual URL

-- Create the main window
local Window = Library:CreateWindow({
    Title = "Demo UI",
    Size = UDim2.new(0, 500, 0, 400),
    Transparency = 0.15,
    Blurring = true,
    Theme = "Void",
    MinimizeKeybind = Enum.KeyCode.RightControl
})

-- Add tab sections
Window:AddTabSection({Name = "Main", Order = 1})
Window:AddTabSection({Name = "Combat", Order = 2})
Window:AddTabSection({Name = "Visuals", Order = 3})
Window:AddTabSection({Name = "Misc", Order = 4})

-- Main Tab with user icon
local MainTab = Window:AddTab({
    Title = "Player",
    Icon = "user",  -- Lucide icon name
    Section = "Main"
})

-- Combat Tab with sword icon
local CombatTab = Window:AddTab({
    Title = "Combat",
    Icon = "sword",  -- Lucide icon name
    Section = "Combat"
})

-- Visuals Tab with eye icon
local VisualsTab = Window:AddTab({
    Title = "Visuals",
    Icon = "eye",  -- Lucide icon name
    Section = "Visuals"
})

-- Misc Tab with settings icon
local MiscTab = Window:AddTab({
    Title = "Settings",
    Icon = "settings",  -- Lucide icon name
    Section = "Misc"
})

-- Add components to Main Tab
Window:AddSection({Name = "Player Options", Tab = MainTab})

Window:AddButton({
    Title = "God Mode",
    Description = "Become invincible",
    Tab = MainTab,
    Callback = function()
        print("God Mode activated!")
        Window:Notify({
            Title = "Success",
            Description = "God Mode enabled",
            Duration = 3
        })
    end
})

Window:AddToggle({
    Title = "Speed Hack",
    Description = "Increase movement speed",
    Default = false,
    Tab = MainTab,
    Callback = function(value)
        print("Speed Hack:", value)
    end
})

Window:AddSlider({
    Title = "Walk Speed",
    Description = "Adjust your movement speed",
    MaxValue = 100,
    AllowDecimals = false,
    Tab = MainTab,
    Callback = function(value)
        print("Walk Speed set to:", value)
    end
})

-- Add components to Combat Tab
Window:AddSection({Name = "Combat Features", Tab = CombatTab})

Window:AddToggle({
    Title = "Aimbot",
    Description = "Auto aim at enemies",
    Default = true,
    Tab = CombatTab,
    Callback = function(value)
        print("Aimbot:", value)
    end
})

Window:AddKeybind({
    Title = "Trigger Bot",
    Description = "Auto shoot when aiming",
    Tab = CombatTab,
    Callback = function(key)
        print("Trigger Bot keybind:", key.KeyCode.Name)
    end
})

Window:AddDropdown({
    Title = "Target Selection",
    Description = "Choose targeting method",
    Options = {"Closest", "Farthest", "Highest Health", "Lowest Health"},
    Tab = CombatTab,
    Callback = function(option)
        print("Target selection:", option)
    end
})

-- Add components to Visuals Tab
Window:AddSection({Name = "Visual Settings", Tab = VisualsTab})

Window:AddToggle({
    Title = "ESP",
    Description = "See players through walls",
    Default = false,
    Tab = VisualsTab,
    Callback = function(value)
        print("ESP:", value)
    end
})

Window:AddToggle({
    Title = "Wallhack",
    Description = "See through walls",
    Default = false,
    Tab = VisualsTab,
    Callback = function(value)
        print("Wallhack:", value)
    end
})

Window:AddInput({
    Title = "ESP Color",
    Description = "Enter hex color (#RRGGBB)",
    Tab = VisualsTab,
    Callback = function(text)
        print("ESP Color set to:", text)
    end
})

-- Add components to Misc Tab
Window:AddSection({Name = "Configuration", Tab = MiscTab})

Window:AddParagraph({
    Title = "UI Settings",
    Description = "Customize the interface appearance",
    Tab = MiscTab
})

Window:AddDropdown({
    Title = "Theme",
    Description = "Change UI theme",
    Options = {"Dark", "Light", "Void"},
    Tab = MiscTab,
    Callback = function(theme)
        Window:SetSetting("Theme", theme)
        print("Theme changed to:", theme)
    end
})

Window:AddButton({
    Title = "Reset Settings",
    Description = "Restore default configuration",
    Tab = MiscTab,
    Callback = function()
        print("Settings reset!")
        Window:Notify({
            Title = "Reset Complete",
            Description = "All settings restored to default",
            Duration = 2
        })
    end
})

-- Demo changing settings
task.wait(2)

-- Change UI size
Window:SetSetting("Size", UDim2.new(0, 550, 0, 450))

-- Change transparency
Window:SetSetting("Transparency", 0.05)

-- Show success notification
Window:Notify({
    Title = "UI Loaded",
    Description = "Demo interface ready!",
    Duration = 3
})

print("UI Library demo loaded successfully!")
