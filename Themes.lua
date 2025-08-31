-- Themes.lua
local Themes = {}

-- Color shortcuts
local White = Color3.fromRGB(255, 255, 255)
local Black = Color3.fromRGB(0, 0, 0)
local DarkGray = Color3.fromRGB(30, 30, 30)
local MediumGray = Color3.fromRGB(40, 40, 40)
local LightGray = Color3.fromRGB(232, 232, 232)
local Gray = Color3.fromRGB(200, 200, 200)

-- Dark Theme
Themes.Dark = {
    Primary = DarkGray,
    Secondary = MediumGray,
    Component = MediumGray,
    Interactables = MediumGray,

    Tab = Gray,
    Title = White,
    Description = Gray,

    Shadow = Black,
    Outline = MediumGray,

    Icon = White
}

-- Light Theme
Themes.Light = {
    Primary = LightGray,
    Secondary = White,
    Component = LightGray,
    Interactables = LightGray,

    Tab = Black,
    Title = Black,
    Description = Gray,

    Shadow = White,
    Outline = Gray,

    Icon = Gray
}

-- Void Theme
Themes.Void = {
    Primary = Black,
    Secondary = DarkGray,
    Component = MediumGray,
    Interactables = MediumGray,

    Tab = Gray,
    Title = White,
    Description = Gray,

    Shadow = Black,
    Outline = MediumGray,

    Icon = White
}

return Themes
