local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))()

local Window = Library:CreateWindow({
    Title = "Player Utilities",
    Size = UDim2.fromOffset(600, 400),
    Transparency = 0.09,
    Blurring = true,
    Theme = "Void"
})

-- Create sections
Window:AddTabSection({Name = "Player", Order = 1})
Window:AddTabSection({Name = "Visual", Order = 2})
Window:AddTabSection({Name = "Fun", Order = 3})

-- Create tabs with Lucide icons
local PlayerTab = Window:AddTab({Title = "Player", Section = "Player", Icon = "user"})
local VisualTab = Window:AddTab({Title = "Visual", Section = "Visual", Icon = "eye"})
local FunTab = Window:AddTab({Title = "Fun", Section = "Fun", Icon = "sparkles"})

-- Player tab components
Window:AddSection({Name = "Player Settings", Tab = PlayerTab})

Window:AddToggle({
    Title = "God Mode",
    Description = "Become invincible to damage",
    Default = false,
    Tab = PlayerTab,
    Callback = function(Value)
        if Value then
            game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
        else
            game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
            game.Players.LocalPlayer.Character.Humanoid.Health = 100
        end
    end
})

Window:AddSlider({
    Title = "Walk Speed",
    Description = "Adjust your movement speed",
    MaxValue = 100,
    AllowDecimals = false,
    Tab = PlayerTab,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

-- Visual tab components
Window:AddSection({Name = "Visual Effects", Tab = VisualTab})

Window:AddToggle({
    Title = "Fullbright",
    Description = "Make the entire game brighter",
    Default = false,
    Tab = VisualTab,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
            game.Lighting.Brightness = 2
        else
            game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
            game.Lighting.Brightness = 1
        end
    end
})

-- Fun tab components
Window:AddSection({Name = "Fun Stuff", Tab = FunTab})

Window:AddButton({
    Title = "Dance",
    Description = "Make your character dance",
    Tab = FunTab,
    Callback = function()
        print("Dancing animation started!")
    end
})

-- Welcome notification
Window:Notify({
    Title = "UI Loaded",
    Description = "Player Utilities UI is ready to use!",
    Duration = 3
})
