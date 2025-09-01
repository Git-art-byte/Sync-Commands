--[[
    UI Library Example Script
    This example demonstrates how to use all the features of the UI Library
]]

-- Load the UI Library (adjust the path as needed)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Git-art-byte/Sync-Commands/main/Source.lua"))()

-- Create the main window
local Window = Library:CreateWindow({
    Title = "My Awesome Script",
    Size = UDim2.fromOffset(500, 400),
    Transparency = 0.2,
    MinimizeKeybind = Enum.KeyCode.LeftControl,
    Blurring = true,
    Theme = "Void" -- Options: "Dark", "Light", "Void", or custom table
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

-- Create tabs with different icons (using Roblox image IDs)
local MainTab = Window:AddTab({
    Title = "Home",
    Icon = 3926305904, -- Home icon ID
    Section = "Main Features"
})

local CombatTab = Window:AddTab({
    Title = "Combat",
    Icon = 3926307971, -- Sword icon ID
    Section = "Main Features"
})

local MovementTab = Window:AddTab({
    Title = "Movement",
    Icon = 3926311105, -- Speed icon ID
    Section = "Main Features"
})

local SettingsTab = Window:AddTab({
    Title = "Settings",
    Icon = 3926305904, -- Settings icon ID
    Section = "Settings"
})

local InfoTab = Window:AddTab({
    Title = "Info" -- No icon
})

-- Variables to store states
local AutoFarmEnabled = false
local WalkSpeed = 16
local JumpPower = 50

--// MAIN TAB COMPONENTS

-- Add a section header
Window:AddSection({
    Name = "🏠 Welcome Section",
    Tab = MainTab
})

-- Add a paragraph for information
Window:AddParagraph({
    Title = "Welcome!",
    Description = "This is an example of the UI Library. Explore all the features available in different tabs!",
    Tab = MainTab
})

-- Add a simple button
Window:AddButton({
    Title = "Test Button",
    Description = "Click me to test the button functionality",
    Tab = MainTab,
    Callback = function()
        print("Button clicked!")
        Window:Notify({
            Title = "Success!",
            Description = "Button was clicked successfully",
            Duration = 3
        })
    end
})

-- Add an input box
Window:AddInput({
    Title = "Player Name",
    Description = "Enter a player name to target",
    Tab = MainTab,
    Callback = function(text)
        print("Player name entered: " .. text)
        Window:Notify({
            Title = "Player Set",
            Description = "Target player: " .. text,
            Duration = 2
        })
    end
})

--// COMBAT TAB COMPONENTS

Window:AddSection({
    Name = "⚔️ Combat Features",
    Tab = CombatTab
})

-- Toggle for auto farm
Window:AddToggle({
    Title = "Auto Farm",
    Description = "Automatically farm for you",
    Default = false,
    Tab = CombatTab,
    Callback = function(state)
        AutoFarmEnabled = state
        print("Auto Farm:", state and "Enabled" or "Disabled")
        
        if state then
            Window:Notify({
                Title = "Auto Farm",
                Description = "Auto Farm has been enabled!",
                Duration = 2
            })
        else
            Window:Notify({
                Title = "Auto Farm",
                Description = "Auto Farm has been disabled!",
                Duration = 2
            })
        end
    end
})

-- Dropdown for weapon selection
Window:AddDropdown({
    Title = "Weapon Selection",
    Description = "Choose your preferred weapon",
    Options = {
        ["Sword"] = "Sword",
        ["Bow"] = "Bow", 
        ["Staff"] = "Staff",
        ["Dagger"] = "Dagger"
    },
    Tab = CombatTab,
    Callback = function(option)
        print("Selected weapon:", option)
        Window:Notify({
            Title = "Weapon Selected",
            Description = "Now using: " .. option,
            Duration = 2
        })
    end
})

-- Keybind for combat toggle
Window:AddKeybind({
    Title = "Combat Toggle",
    Description = "Press a key to toggle combat mode",
    Tab = CombatTab,
    Callback = function(key)
        print("Combat keybind set to:", tostring(key))
        Window:Notify({
            Title = "Keybind Set",
            Description = "Combat toggle key updated!",
            Duration = 2
        })
    end
})

--// MOVEMENT TAB COMPONENTS

Window:AddSection({
    Name = "🏃 Movement Features",
    Tab = MovementTab
})

-- Slider for walk speed
Window:AddSlider({
    Title = "Walk Speed",
    Description = "Adjust your character's walking speed",
    MaxValue = 100,
    AllowDecimals = false,
    Tab = MovementTab,
    Callback = function(value)
        WalkSpeed = value
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
        print("Walk Speed set to:", value)
    end
})

-- Slider for jump power with decimals
Window:AddSlider({
    Title = "Jump Power",
    Description = "Adjust your character's jump power",
    MaxValue = 200,
    AllowDecimals = true,
    DecimalAmount = 1,
    Tab = MovementTab,
    Callback = function(value)
        JumpPower = value
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
        print("Jump Power set to:", value)
    end
})

-- Toggle for infinite jump
Window:AddToggle({
    Title = "Infinite Jump",
    Description = "Jump as many times as you want",
    Default = false,
    Tab = MovementTab,
    Callback = function(state)
        print("Infinite Jump:", state and "Enabled" or "Disabled")
        -- Add your infinite jump code here
    end
})

-- Button for teleport to spawn
Window:AddButton({
    Title = "Teleport to Spawn",
    Description = "Instantly teleport back to spawn",
    Tab = MovementTab,
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) -- Adjust spawn position
            Window:Notify({
                Title = "Teleported!",
                Description = "You have been teleported to spawn",
                Duration = 2
            })
        end
    end
})

--// SETTINGS TAB COMPONENTS

Window:AddSection({
    Name = "⚙️ UI Settings",
    Tab = SettingsTab
})

-- Theme selection dropdown
Window:AddDropdown({
    Title = "Theme Selection",
    Description = "Change the UI theme",
    Options = {
        ["Dark"] = "Dark",
        ["Light"] = "Light",
        ["Void"] = "Void"
    },
    Tab = SettingsTab,
    Callback = function(theme)
        Window:SetSetting("Theme", theme)
        Window:Notify({
            Title = "Theme Changed",
            Description = "Theme changed to: " .. theme,
            Duration = 2
        })
    end
})

-- UI transparency slider
Window:AddSlider({
    Title = "UI Transparency",
    Description = "Adjust the transparency of the UI",
    MaxValue = 1,
    AllowDecimals = true,
    DecimalAmount = 2,
    Tab = SettingsTab,
    Callback = function(value)
        Window:SetSetting("Transparency", value)
    end
})

-- Blur toggle
Window:AddToggle({
    Title = "Background Blur",
    Description = "Enable or disable background blur effect",
    Default = true,
    Tab = SettingsTab,
    Callback = function(state)
        Window:SetSetting("Blur", state)
        Window:Notify({
            Title = "Blur " .. (state and "Enabled" or "Disabled"),
            Description = "Background blur has been " .. (state and "enabled" or "disabled"),
            Duration = 2
        })
    end
})

-- Font selection dropdown
Window:AddDropdown({
    Title = "Font Selection",
    Description = "Change the UI font",
    Options = {
        ["Gotham Bold"] = Enum.Font.GothamBold,
        ["Gotham"] = Enum.Font.Gotham,
        ["Roboto"] = Enum.Font.Roboto,
        ["Arial"] = Enum.Font.Arial,
        ["Ubuntu"] = Enum.Font.Ubuntu
    },
    Tab = SettingsTab,
    Callback = function(font)
        Window:SetSetting("Font", font)
        Window:Notify({
            Title = "Font Changed",
            Description = "Font has been updated!",
            Duration = 2
        })
    end
})

--// INFO TAB COMPONENTS

Window:AddSection({
    Name = "ℹ️ Information",
    Tab = InfoTab
})

Window:AddParagraph({
    Title = "Script Information",
    Description = "This script was created using the custom UI Library. Version 1.0",
    Tab = InfoTab
})

Window:AddParagraph({
    Title = "Features",
    Description = "• Modern UI Design\n• Multiple Themes\n• Customizable Components\n• Smooth Animations\n• Easy to Use",
    Tab = InfoTab
})

-- Credits button
Window:AddButton({
    Title = "Credits",
    Description = "View script credits and information",
    Tab = InfoTab,
    Callback = function()
        Window:Notify({
            Title = "Credits",
            Description = "UI Library by Late | Example by Assistant",
            Duration = 4
        })
    end
})

-- Input for feedback
Window:AddInput({
    Title = "Feedback",
    Description = "Share your feedback about this script",
    Tab = InfoTab,
    Callback = function(feedback)
        print("User feedback:", feedback)
        Window:Notify({
            Title = "Thank you!",
            Description = "Your feedback has been recorded",
            Duration = 3
        })
    end
})

-- Final setup notification
wait(1) -- Wait for UI to fully load
Window:Notify({
    Title = "Script Loaded!",
    Description = "All features are now available. Enjoy!",
    Duration = 4
})

print("UI Library Example Script loaded successfully!")
print("Press Right Ctrl to toggle the UI")
