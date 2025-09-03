--[[
	Example script to test all features of the UI Library in an exploit environment
	Educational Purpose Only
]]

-- Load the UI library using loadstring
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/yourrepo/main/Source.lua"))() -- Replace with actual URL to Source.lua

-- Create a window
local Window = Library:CreateWindow({
	Title = "UI Library Test",
	Size = UDim2.new(0, 600, 0, 400),
	Transparency = 0.2,
	MinimizeKeybind = Enum.KeyCode.LeftControl,
	Blurring = true,
	Theme = "Dark"
})

-- Add a tab section
Window:AddTabSection({
	Name = "MainSection",
	Order = 1
})

-- Add a tab
local MainTab = Window:AddTab({
	Title = "Main",
	Icon = "rbxassetid://6034835819", -- Example icon
	Section = "MainSection"
})

-- Add a font dropdown to test font switching
Window:AddDropdown({
	Title = "Font Selector",
	Description = "Choose a font for the UI",
	Options = {
		["Gotham Bold"] = Enum.Font.GothamBold,
		["Roboto"] = Enum.Font.Roboto,
		["Arial"] = Enum.Font.Arial,
		["SourceSansPro"] = Enum.Font.SourceSansPro
	},
	Tab = MainTab,
	Callback = function(Font)
		Window:SetFont(Font)
		Window:Notify({
			Title = "Font Changed",
			Description = "UI font set to " .. tostring(Font),
			Duration = 3
		})
	end
})

-- Add a section for components
Window:AddSection({
	Name = "Components",
	Tab = MainTab
})

-- Add a button
Window:AddButton({
	Title = "Test Button",
	Description = "Click to trigger a notification",
	Tab = MainTab,
	Callback = function()
		Window:Notify({
			Title = "Button Clicked",
			Description = "You clicked the test button!",
			Duration = 3
		})
	end
})

-- Add an input
Window:AddInput({
	Title = "Text Input",
	Description = "Enter some text",
	Tab = MainTab,
	Callback = function(Text)
		Window:Notify({
			Title = "Input Submitted",
			Description = "You entered: " .. Text,
			Duration = 3
		})
	end
})

-- Add a toggle
Window:AddToggle({
	Title = "Test Toggle",
	Description = "Toggle something on/off",
	Default = false,
	Tab = MainTab,
	Callback = function(Value)
		Window:Notify({
			Title = "Toggle Changed",
			Description = "Toggle is now " .. (Value and "ON" or "OFF"),
			Duration = 3
		})
	end
})

-- Add a keybind
Window:AddKeybind({
	Title = "Test Keybind",
	Description = "Set a keybind",
	Tab = MainTab,
	Callback = function(Key)
		local keyName = tostring(Key.KeyCode or Key.UserInputType):gsub("Enum.KeyCode.", ""):gsub("Enum.UserInputType.", "")
		Window:Notify({
			Title = "Keybind Set",
			Description = "Keybind set to: " .. keyName,
			Duration = 3
		})
	end
})

-- Add a dropdown (non-font, for testing other options)
Window:AddDropdown({
	Title = "Test Dropdown",
	Description = "Select an option",
	Options = {
		["Option 1"] = "Value1",
		["Option 2"] = "Value2",
		["Option 3"] = "Value3"
	},
	Tab = MainTab,
	Callback = function(Value)
		Window:Notify({
			Title = "Dropdown Selected",
			Description = "Selected: " .. Value,
			Duration = 3
		})
	end
})

-- Add a slider
Window:AddSlider({
	Title = "Test Slider",
	Description = "Adjust a value",
	MaxValue = 100,
	AllowDecimals = true,
	DecimalAmount = 2,
	Tab = MainTab,
	Callback = function(Value)
		Window:Notify({
			Title = "Slider Adjusted",
			Description = "Value set to: " .. Value,
			Duration = 3
		})
	end
})

-- Add a paragraph
Window:AddParagraph({
	Title = "About",
	Description = "This is a test UI to demonstrate all features of the UI library, including buttons, inputs, toggles, keybinds, dropdowns, sliders, and notifications. For educational purposes only.",
	Tab = MainTab
})

-- Initial notification to welcome the user
Window:Notify({
	Title = "Welcome",
	Description = "Explore the UI library features in this demo! For educational purposes only.",
	Duration = 5
})
