--[[ Make sure the operator joins the game first ]]--
--[[ I've decided to crack cosmo, due to a retarded owner ]]--

getgenv().OldHost = "" -- Put your host here

--[[ DON'T TOUCH ]]

if not game:IsLoaded() then
	game.Loaded:Wait()
end
repeat wait() until workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)
if game:service"Players".LocalPlayer.Name == OldHost then return end

local DataFrmApi = loadstring(game:HttpGet("https://raw.githubusercontent.com/omgfreesources/HusmanK/main/DynamicOptions.lua"))()

local FakeUsername = DataFrmApi:split("|")[1]
local FakeUserID = tonumber(DataFrmApi:split("|")[2])
local FakeDisplayname = DataFrmApi:split("|")[3]

repeat wait() until workspace.Players:FindFirstChild(OldHost)

local HostGay = game:service"Players"[OldHost]
HostGay.Name = FakeUsername
HostGay.UserId = FakeUserID
HostGay.Character.Name = FakeUsername
HostGay.Character.Humanoid.DisplayName = FakeDisplayname
HostGay.DisplayName = FakeDisplayname

local FakeChar = game.Players:GetCharacterAppearanceAsync(FakeUserID)
if FakeChar then
    for i,v in pairs(game.Players[FakeUsername].Character:GetChildren()) do
        if v:IsA('Accessory') then
            v:Destroy()
        end
    end
    for i,v in pairs(FakeChar:GetChildren()) do
        if v:IsA("Accessory") then
            local Acc = Instance.new("Accessory",game.Players[FakeUsername].Character)
            Acc.Name = v.Name
        end
    end
end

local OldHookMethod
OldHookMethod = hookmetamethod(game, "__namecall", function(self, ...)
    if getnamecallmethod() == "GetRankInGroup" then 
        return 10
    end
    
    return OldHookMethod(self, ...)
end)

-- [[ Settings ]] --

getgenv().prefix = '.' -- prefix which should run the commands
getgenv().controller = FakeUserID -- id of whitelisted user, requirements: whitelisted, in group as premium role, note the controller must join before alts
getgenv().host = FakeUsername
getgenv().Type = "Basic"

getgenv().gui = true -- recommneded to be on, to load UI on controller!
getgenv().lag_reducer = true -- recommended to be on, reduce lag a lot!

getgenv().sendadevery = 15 -- in second

getgenv().alts = { -- max 38 alts
    Alt1 = 12345, -- Alt3, etc make sure all have "," after each alt
    Alt2 = 12345,
}

-- [[ Launcher ]] --

loadstring(game:HttpGet("https://raw.githubusercontent.com/Husam-Dev/altcontroller/main/premiumsimple.lua", true))()
