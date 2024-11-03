-- Lade die Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Keys = loadstring(game:HttpGet('https://raw.githubusercontent.com/zeyez-dev/keyforpaidsystemsyntx/main/keys.lua'))()

local userKey = ""

local KeyWindow = OrionLib:MakeWindow({Name = "Key System", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTestKey"})

-- Erstellt einen Tab für die Key-Eingabe
local KeyTab = KeyWindow:MakeTab({
    Name = "Key Verification",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = KeyTab:AddSection({
    Name = "Enter Key to Access Hub"
})

KeyTab:AddTextbox({
    Name = "Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        userKey = Value
    end
})


KeyTab:AddButton({
    Name = "Submit Key",
    Callback = function()
        if Keys[userKey] then
            KeyWindow:Destroy() 
            loadMainHub() 
            OrionLib:MakeNotification({
                Name = "Success",
                Content = "Key accepted! Welcome to the Hub.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Invalid key entered.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

function loadMainHub()
    local Window = OrionLib:MakeWindow({Name = "Tutorial Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

  
    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local Section = PlayerTab:AddSection({
        Name = "Movement"
    })

    PlayerTab:AddSlider({
        Name = "Walkspeed",
        Min = 16,
        Max = 500,
        Default = 16,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = "WS",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end    
    })

    PlayerTab:AddSlider({
        Name = "Jump Height",
        Min = 16,
        Max = 500,
        Default = 5,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = "Height",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end    
    })

    
    local OtherTab = Window:MakeTab({
        Name = "Other",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local Section = OtherTab:AddSection({
        Name = "Other"
    })

    OtherTab:AddButton({
        Name = "Delete Doors",
        Callback = function()
            game.Workspace.Doors:Destroy()
        end    
    })

    OrionLib:Init()
end

