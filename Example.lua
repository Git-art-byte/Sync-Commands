local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))()

local Window = Library:CreateWindow({
    Title = "Easy UI",
    Size = UDim2.fromOffset(600, 400),
    Transparency = 0.09,
    Blurring = true,
    Theme = "Void"
})

-- Add sections
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

-- Add tabs with Lucide icons
local PlayerTab = Window:AddTab({
    Title = "Player", 
    Section = "Player",
    Icon = "user"
})

local VisualTab = Window:AddTab({
    Title = "Visual", 
    Section = "Visual",
    Icon = "eye"
})

local FunTab = Window:AddTab({
    Title = "Fun", 
    Section = "Fun",
    Icon = "sparkles"
})

-- Player Tab Components
Window:AddSection({
    Name = "Player Settings", 
    Tab = PlayerTab
})

Window:AddToggle({
    Title = "God Mode",
    Description = "Makes you invincible",
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
    Description = "Change your movement speed",
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
    Description = "Makes the whole game bright",
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
    Description = "Makes your character dance",
    Tab = FunTab,
    Callback = function()
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        humanoid:LoadAnimation(Instance.new("Animation")):Play()
        print("Dancing! 💃")
    end
})

Window:AddButton({
    Title = "Spin",
    Description = "Makes your character spin",
    Tab = FunTab,
    Callback = function()
        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
        for i = 1, 360, 10 do
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(10), 0)
            wait(0.05)
        end
    end
})

Window:AddButton({
    Title = "Float",
    Description = "Makes your character float",
    Tab = FunTab,
    Callback = function()
        local bodyForce = Instance.new("BodyForce")
        bodyForce.Force = Vector3.new(0, 196.2, 0) -- Upward force
        bodyForce.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        wait(3)
        bodyForce:Destroy()
    end
})

-- Add a simple text box
Window:AddInput({
    Title = "Chat Message",
    Description = "Type a message to chat",
    Tab = FunTab,
    Callback = function(Text)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Text, "All")
    end
})

-- Show welcome notification
Window:Notify({
    Title = "UI Loaded",
    Description = "Example UI is ready!",
    Duration = 3
})

-- Add a final section with info
Window:AddSection({
    Name = "Information", 
    Tab = PlayerTab
})

Window:AddParagraph({
    Title = "Welcome!",
    Description = "This is a exmaple UI with easy-to-use features. Enjoy!",
    Tab = PlayerTab
})
