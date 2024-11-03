-- Lade die Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Lade die Keys von GitHub (ohne Token)
local Keys = loadstring(game:HttpGet('https://raw.githubusercontent.com/zeyez-dev/keyforpaidsystemsyntx/main/keys.lua'))()

-- Der Key, der benötigt wird, um das Script zu starten
local userKey = ""

-- Erstellt ein Fenster für die Key-Eingabe
local KeyWindow = OrionLib:MakeWindow({Name = "Key System", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTestKey"})

-- Erstellt einen Tab für die Key-Eingabe
local KeyTab = KeyWindow:MakeTab({
    Name = "Key Verification",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Sektion zur Eingabe des Keys
local Section = KeyTab:AddSection({
    Name = "Enter Key to Access Hub"
})

-- Textbox für die Key-Eingabe
KeyTab:AddTextbox({
    Name = "Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        userKey = Value
    end
})

-- Button zur Bestätigung des Keys
KeyTab:AddButton({
    Name = "Submit Key",
    Callback = function()
        if Keys[userKey] then
            KeyWindow:Destroy() -- Schließt das Key-Fenster
            loadMainHub() -- Lädt das Haupt-Hub
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

-- Funktion für das Haupt-Script-Hub
function loadMainHub()
    local Window = OrionLib:MakeWindow({Name = "Tutorial Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

    -- Player Tab
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

    -- Other Tab
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

