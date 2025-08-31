--// Load Visual Command UI Library
local Library = loadstring(
    game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20Command%20UI%20Library/Source.lua', true)
)()

--// Create Main Window
local Window = Library:CreateWindow({
    Name = 'Sync Commands',
    IntroText = 'Sync Commands Loaded!',
    IntroIcon = 'rbxassetid://10618644218',
    IntroBlur = true,
    IntroBlurIntensity = 15,
    Theme = Library.Themes.dark,
    Position = 'top',
    Draggable = true,
    Prefix = ';'
})

--// Make GUI draggable on mobile & PC
local UIS = game:GetService("UserInputService")
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
        end
    end)
end
makeDraggable(Window.MainFrame)

--// Helper to get character safely
local function getCharacter()
    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")
    return char, hum, root
end

--// WalkSpeed
Window:AddCommand('speed', {'Number'}, 'Set your WalkSpeed.', function(args)
    local _, hum = getCharacter()
    local value = tonumber(args[1])
    if value then
        hum.WalkSpeed = value
        Window:CreateNotification('WalkSpeed Changed', 'WalkSpeed set to ' .. value, 5)
    else
        Window:CreateNotification('Error', 'Invalid number!', 5)
    end
end, {'ws', 'WalkSpeed'})

--// JumpPower
Window:AddCommand('jump', {'Number'}, 'Set your JumpPower.', function(args)
    local _, hum = getCharacter()
    local value = tonumber(args[1])
    if value then
        hum.JumpPower = value
        Window:CreateNotification('JumpPower Changed', 'JumpPower set to ' .. value, 5)
    else
        Window:CreateNotification('Error', 'Invalid number!', 5)
    end
end, {'jp', 'JumpPower'})

--// Reset Character
Window:AddCommand('reset', {}, 'Reset your character.', function()
    local char = game.Players.LocalPlayer.Character
    if char then
        char:BreakJoints()
        Window:CreateNotification('Character Reset', 'You have been reset.', 5)
    end
end, {'respawn'})

--// RemoteSpy
Window:AddCommand('remotespy', {}, 'Load RemoteSpy.', function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/SimpleSpy/refs/heads/main/Mobile.lua"))()
    Window:CreateNotification('RemoteSpy Loaded', 'RemoteSpy executed.', 5)
end, {'rspy'})

--// Noclip / Unnoclip
local noclip = false
local noclipConn
Window:AddCommand('noclip', {}, 'Enable noclip.', function()
    if noclip then return end
    noclip = true
    local char, _, _ = getCharacter()
    noclipConn = game:GetService("RunService").Stepped:Connect(function()
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end)
    Window:CreateNotification('Noclip Enabled', 'You can walk through walls.', 5)
end)

Window:AddCommand('unnoclip', {}, 'Disable noclip.', function()
    if noclip and noclipConn then
        noclipConn:Disconnect()
        noclip = false
        Window:CreateNotification('Noclip Disabled', 'Collisions restored.', 5)
    end
end)

--// Fly / Unfly
local flying = false
local flyConn
Window:AddCommand('fly', {}, 'Enable fly.', function()
    if flying then return end
    flying = true
    local _, hum, root = getCharacter()
    hum.PlatformStand = true
    flyConn = game:GetService("RunService").Heartbeat:Connect(function()
        if not flying then return end
        local move = hum.MoveDirection
        root.Velocity = (move * 50) + Vector3.new(0, hum.Jump and 50 or 0, 0)
    end)
    Window:CreateNotification('Fly Enabled', 'Fly mode active.', 5)
end)

Window:AddCommand('unfly', {}, 'Disable fly.', function()
    if flying and flyConn then
        flyConn:Disconnect()
        flying = false
        local _, hum = getCharacter()
        hum.PlatformStand = false
        Window:CreateNotification('Fly Disabled', 'Fly mode off.', 5)
    end
end)

--// Dynamic Help Command
Window:AddCommand('help', {}, 'Show all available commands.', function()
    local lines = {}
    for _, cmd in ipairs(Window.Commands) do
        local aliases = cmd.Aliases or {}
        local nameList = {cmd.Name}
        for _, a in ipairs(aliases) do
            table.insert(nameList, a)
        end
        table.insert(lines, table.concat(nameList, " / "))
    end
    local text = "Available Commands:\n" .. table.concat(lines, "\n")
    Window:CreateNotification('Command List', text, 10)
end)
