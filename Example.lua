local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))()

local Window = Library:CreateWindow({
    Title = "Player Utilities",
    Size = UDim2.fromOffset(600, 400),
    Transparency = 0.1,
    Blurring = true,
    Theme = "Dark"
})

-- Create sections
Window:AddTabSection({
    Name = "Player", 
    Order = 1
})

Window:AddTabSection({
    Name = "Visual", 
    Order = 2
})

Window:AddTabSection({
    Name = "Fun", 
    Order = 3
})

-- Create tabs with DIRECT Lucide icon URLs (to ensure they work)
local PlayerTab = Window:AddTab({
    Title = "Player", 
    Section = "Player",
    Icon = "https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/user.svg"
})

local VisualTab = Window:AddTab({
    Title = "Visual", 
    Section = "Visual",
    Icon = "https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/eye.svg"
})

local FunTab = Window:AddTab({
    Title = "Fun", 
    Section = "Fun",
    Icon = "https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/sparkles.svg"
})

-- Player Tab Components
Window:AddSection({
    Name = "Player Settings", 
    Tab = PlayerTab
})

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

Window:AddSlider({
    Title = "Jump Power",
    Description = "Change your jump height",
    MaxValue = 100,
    AllowDecimals = false,
    Tab = PlayerTab,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

-- Visual Tab Components
Window:AddSection({
    Name = "Visual Effects", 
    Tab = VisualTab
})

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

Window:AddToggle({
    Title = "Hide Names",
    Description = "Hides player names above heads",
    Default = false,
    Tab = VisualTab,
    Callback = function(Value)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.DisplayName = Value and "" or player.Name
                end
            end
        end
    end
})

-- Fun Tab Components
Window:AddSection({
    Name = "Fun Stuff", 
    Tab = FunTab
})

Window:AddButton({
    Title = "Dance",
    Description = "Make your character dance",
    Tab = FunTab,
    Callback = function()
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        local danceAnimation = Instance.new("Animation")
        danceAnimation.AnimationId = "rbxassetid://35654637"
        humanoid:LoadAnimation(danceAnimation):Play()
    end
})

Window:AddButton({
    Title = "Spin",
    Description = "Make your character spin",
    Tab = FunTab,
    Callback = function()
        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
        for i = 1, 36 do
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(10), 0)
            wait(0.05)
        end
    end
})

Window:AddInput({
    Title = "Chat Message",
    Description = "Type a message to send in chat",
    Tab = FunTab,
    Callback = function(Text)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Text, "All")
    end
})

-- Information section
Window:AddSection({
    Name = "Information", 
    Tab = PlayerTab
})

Window:AddParagraph({
    Title = "Welcome to Player Utilities",
    Description = "This UI provides various tools to enhance your gameplay experience. All features are safe to use and easy to understand.",
    Tab = PlayerTab
})

-- Show welcome notification
Window:Notify({
    Title = "UI Loaded Successfully",
    Description = "Player Utilities is now ready to use!",
    Duration = 3
})

-- Settings Tab (optional)
local SettingsTab = Window:AddTab({
    Title = "Settings",
    Icon = "https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/settings.svg"
})

Window:AddSection({
    Name = "UI Settings",
    Tab = SettingsTab
})

Window:AddDropdown({
    Title = "UI Theme",
    Description = "Change the appearance of the UI",
    Options = {"Dark", "Light", "Void"},
    Tab = SettingsTab,
    Callback = function(Value)
        Window:SetTheme(Value)
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

print("Player Utilities UI loaded successfully!")
