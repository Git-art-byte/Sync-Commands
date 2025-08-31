local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepo/main/Source.lua"))()

local Window = Library:CreateWindow({
    Title = "Combat UI",
    Size = UDim2.fromOffset(600, 400),
    Transparency = 0.1,
    Blurring = true,
    Theme = "Void"
})

-- Add sections
Window:AddTabSection({Name = "Combat", Order = 1})
Window:AddTabSection({Name = "Movement", Order = 2})

-- Add tabs
local CombatTab = Window:AddTab({Title = "Aimbot", Section = "Combat"})
local MovementTab = Window:AddTab({Title = "Speed", Section = "Movement"})

-- Add components to Combat tab
Window:AddSection({Name = "Aimbot Settings", Tab = CombatTab})

Window:AddToggle({
    Title = "Enable Aimbot",
    Description = "Toggle the aimbot system",
    Default = false,
    Tab = CombatTab,
    Callback = function(Value)
        _G.AimbotEnabled = Value
    end
})

Window:AddSlider({
    Title = "Aimbot FOV",
    Description = "Field of view for target detection",
    MaxValue = 360,
    AllowDecimals = false,
    Tab = CombatTab,
    Callback = function(Value)
        _G.AimbotFOV = Value
    end
})

Window:AddKeybind({
    Title = "Aim Key",
    Description = "Key to hold for aiming",
    Tab = CombatTab,
    Callback = function(Key)
        _G.AimKey = Key
    end
})

-- Add components to Movement tab
Window:AddSection({Name = "Movement Settings", Tab = MovementTab})

Window:AddToggle({
    Title = "Speed Hack",
    Description = "Increase movement speed",
    Default = false,
    Tab = MovementTab,
    Callback = function(Value)
        _G.SpeedHack = Value
    end
})

Window:AddSlider({
    Title = "Speed Multiplier",
    Description = "How fast you want to go",
    MaxValue = 10,
    AllowDecimals = true,
    DecimalAmount = 1,
    Tab = MovementTab,
    Callback = function(Value)
        _G.SpeedMultiplier = Value
    end
})

-- Show welcome notification
Window:Notify({
    Title = "UI Loaded",
    Description = "Combat UI has been successfully loaded!",
    Duration = 3
})
