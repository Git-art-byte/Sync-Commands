-- Load the UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))() -- Replace with your actual URL

-- Create the main window
local Window = Library:CreateWindow({
    Title = "My Awesome GUI",
    Size = UDim2.new(0, 500, 0, 400),
    Transparency = 0.2,
    Theme = "Void", -- "Dark", "Light", or "Void"
    Blurring = true,
    MinimizeKeybind = Enum.KeyCode.RightControl
})

-- Add tab sections (optional - for organizing tabs)
Window:AddTabSection({
    Name = "Main Features",
    Order = 1
})

Window:AddTabSection({
    Name = "Settings",
    Order = 2
})

-- Create tabs
local MainTab = Window:AddTab({
    Title = "Main",
    Icon = "rbxassetid://4483345998", -- Optional icon
    Section = "Main Features"
})

local PlayerTab = Window:AddTab({
    Title = "Player",
    Icon = "rbxassetid://4483345875",
    Section = "Main Features"
})

local SettingsTab = Window:AddTab({
    Title = "Settings",
    Icon = "rbxassetid://4483345737",
    Section = "Settings"
})

-- Add components to Main tab
Window:AddSection({
    Name = "Basic Functions",
    Tab = MainTab
})

Window:AddButton({
    Title = "Click Me!",
    Description = "This button does something cool",
    Tab = MainTab,
    Callback = function()
        print("Button was clicked!")
        Window:Notify({
            Title = "Success!",
            Description = "Button executed successfully",
            Duration = 3
        })
    end
})

Window:AddToggle({
    Title = "Enable Feature",
    Description = "Toggle this awesome feature on/off",
    Default = false,
    Tab = MainTab,
    Callback = function(value)
        print("Toggle is now:", value)
    end
})

Window:AddSlider({
    Title = "Speed Multiplier",
    Description = "Adjust your speed",
    MaxValue = 100,
    AllowDecimals = true,
    DecimalAmount = 1,
    Tab = MainTab,
    Callback = function(value)
        print("Slider value:", value)
        -- Example: game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 + value
    end
})

Window:AddDropdown({
    Title = "Select Option",
    Description = "Choose from the available options",
    Options = {
        ["Option 1"] = "value1",
        ["Option 2"] = "value2",
        ["Option 3"] = "value3",
        ["Cool Feature"] = "cool_feature"
    },
    Tab = MainTab,
    Callback = function(value)
        print("Selected:", value)
    end
})

Window:AddInput({
    Title = "Enter Text",
    Description = "Type something here",
    Tab = MainTab,
    Callback = function(text)
        print("User entered:", text)
    end
})

Window:AddKeybind({
    Title = "Toggle Keybind",
    Description = "Set a key to toggle something",
    Tab = MainTab,
    Callback = function(key)
        print("Keybind set to:", key.KeyCode or key.UserInputType)
    end
})

-- Add components to Player tab
Window:AddSection({
    Name = "Player Modifications",
    Tab = PlayerTab
})

Window:AddButton({
    Title = "Reset Character",
    Description = "Respawn your character",
    Tab = PlayerTab,
    Callback = function()
        game.Players.LocalPlayer.Character:BreakJoints()
    end
})

Window:AddSlider({
    Title = "Walk Speed",
    Description = "Change your walking speed",
    MaxValue = 200,
    AllowDecimals = false,
    Tab = PlayerTab,
    Callback = function(value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

Window:AddSlider({
    Title = "Jump Power",
    Description = "Change your jump height",
    MaxValue = 200,
    AllowDecimals = false,
    Tab = PlayerTab,
    Callback = function(value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

Window:AddToggle({
    Title = "Infinite Jump",
    Description = "Jump as many times as you want",
    Default = false,
    Tab = PlayerTab,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local player = Players.LocalPlayer
        
        if enabled then
            -- Enable infinite jump
            UserInputService.JumpRequest:Connect(function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
        -- Note: Disabling infinite jump would require more complex logic
    end
})

-- Add components to Settings tab
Window:AddSection({
    Name = "UI Settings",
    Tab = SettingsTab
})

Window:AddDropdown({
    Title = "Theme",
    Description = "Change the UI theme",
    Options = {
        ["Dark Theme"] = "Dark",
        ["Light Theme"] = "Light", 
        ["Void Theme"] = "Void"
    },
    Tab = SettingsTab,
    Callback = function(theme)
        Window:SetSetting("Theme", theme)
        print("Theme changed to:", theme)
    end
})

Window:AddSlider({
    Title = "Transparency",
    Description = "Adjust UI transparency",
    MaxValue = 1,
    AllowDecimals = true,
    DecimalAmount = 2,
    Tab = SettingsTab,
    Callback = function(value)
        Window:SetSetting("Transparency", value)
    end
})

Window:AddToggle({
    Title = "Blur Effect",
    Description = "Enable/disable background blur",
    Default = true,
    Tab = SettingsTab,
    Callback = function(enabled)
        Window:SetSetting("Blur", enabled)
    end
})

Window:AddDropdown({
    Title = "Font Style",
    Description = "Change the UI font",
    Options = {
        ["Gotham Bold"] = Enum.Font.GothamBold,
        ["Gotham"] = Enum.Font.Gotham,
        ["Roboto"] = Enum.Font.Roboto,
        ["Source Sans"] = Enum.Font.SourceSans,
        ["Arial"] = Enum.Font.Arial
    },
    Tab = SettingsTab,
    Callback = function(font)
        Window:SetFont(font)
    end
})

-- Add some informational content
Window:AddSection({
    Name = "Information",
    Tab = SettingsTab
})

Window:AddParagraph({
    Title = "About This GUI",
    Description = "This is an example of the UI Library created by Late. It features a modern design with multiple themes, smooth animations, and various interactive components. The window controls (close, minimize, maximize) will always maintain their red, yellow, and green colors regardless of theme.",
    Tab = SettingsTab
})

Window:AddParagraph({
    Title = "Features",
    Description = "• Multiple themes (Dark, Light, Void)\n• Draggable and resizable windows\n• Blur effects\n• Smooth animations\n• Custom keybinds\n• Notifications system\n• Font customization",
    Tab = SettingsTab
})

-- Example of using notifications
Window:AddButton({
    Title = "Test Notification",
    Description = "Show a test notification",
    Tab = SettingsTab,
    Callback = function()
        Window:Notify({
            Title = "Test Notification",
            Description = "This is a test notification with custom duration!",
            Duration = 5
        })
    end
})

-- Set the first tab as active
Window:SetTab("Main")

print("UI Library loaded successfully!")
print("Press Right Control to toggle the GUI")
