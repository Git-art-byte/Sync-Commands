--// Load Visual Command UI Library
local Library = loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20Command%20UI%20Library/Source.lua',
        true
    )
)()

--// Create Main Window
local Window = Library:CreateWindow({
    Name = 'My Command UI',
    IntroText = 'Custom Commands Loaded',
    IntroIcon = 'rbxassetid://10618644218',
    IntroBlur = true,
    IntroBlurIntensity = 15,
    Theme = Library.Themes.dark, -- dark | light
    Position = 'bottom',         -- top | bottom
    Draggable = true,
    Prefix = ';'                 -- prefix for commands
})

--// ==============================
--// COMMANDS SECTION
--// ==============================

-- WalkSpeed Command
Window:AddCommand('speed', {'Number'}, 'Set your WalkSpeed.', function(Arguments)
    local value = tonumber(Arguments[1])
    if value then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        Window:CreateNotification('WalkSpeed Changed', 'WalkSpeed set to ' .. value, 5)
    else
        Window:CreateNotification('Error', 'Invalid number entered!', 5)
    end
end, {'WalkSpeed', 'ws'})

-- JumpPower Command
Window:AddCommand('jump', {'Number'}, 'Set your JumpPower.', function(Arguments)
    local value = tonumber(Arguments[1])
    if value then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        Window:CreateNotification('JumpPower Changed', 'JumpPower set to ' .. value, 5)
    else
        Window:CreateNotification('Error', 'Invalid number entered!', 5)
    end
end, {'JumpPower', 'jp'})

-- Reset Command (respawns the local player)
Window:AddCommand('reset', {}, 'Reset your character.', function()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        player.Character:BreakJoints()
        Window:CreateNotification('Character Reset', 'You have been reset.', 5)
    end
end, {'respawn'})

-- RemoteSpy Command
Window:AddCommand('remotespy', {}, 'Load RemoteSpy to monitor RemoteEvents.', function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/remote-spy/main/source.lua"))()
    Window:CreateNotification('RemoteSpy Loaded', 'RemoteSpy script has been executed.', 5)
end, {'rspy'})

-- Noclip / Unnoclip Commands
local noclip = false
local noclipConn
Window:AddCommand('noclip', {}, 'Enable noclip (walk through walls).', function()
    if noclip then return end
    noclip = true
    local char = game.Players.LocalPlayer.Character
    noclipConn = game:GetService("RunService").Stepped:Connect(function()
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end)
    Window:CreateNotification('Noclip Enabled', 'You can now walk through walls.', 5)
end)

Window:AddCommand('unnoclip', {}, 'Disable noclip.', function()
    if noclip and noclipConn then
        noclipConn:Disconnect()
        noclip = false
        Window:CreateNotification('Noclip Disabled', 'Collisions restored.', 5)
    end
end)

--// ==============================
--// HOW TO ADD NEW COMMANDS
--// ==============================
-- 1. Copy this block:
--[[
Window:AddCommand('mainName', {'Arguments'}, 'Description here.', function(Arguments)
    -- Your code here
end, {'alias1', 'alias2'})
]]
-- 2. Replace:
--   'mainName' → the main trigger word (ex: "fly")
--   {'Arguments'} → argument type (Number, String, Player, etc.)
--   'Description here.' → what the command does
--   function(...) → code that runs
--   {'alias1', 'alias2'} → extra names (optional)
-- 3. Done! Now type ;mainName in chat.
