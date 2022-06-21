local Final = {}
local data = game:service"HttpService":JSONDecode(game:HttpGet("https://groups.roblox.com/v1/groups/14007434/roles/79833425/users?sortOrder=Asc&limit=100"))
if data then
    for i,v in pairs(data.data) do
        table.insert(Final,v)
    end
end
local Picked = Final[math.random(#Final)]
local string_ = Picked.username.."|"..tostring(Picked.userId).."|"..Picked.displayName
return string_
