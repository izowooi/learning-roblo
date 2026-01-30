local ProfileService = require(script:WaitForChild("ProfileService"))

local ProfileTemplate = {
	Cash = 0,
	Items = {},
}

local ProfileStore = ProfileService.GetProfileStore("PlayerData", ProfileTemplate)

local Profiles = {}

local function playerAdded(player)
	local profile = ProfileStore:LoadProfileAsync("Player_" .. player.UserId)

	if profile then
		profile:AddUserId(player.UserId)
		profile:Reconcile()

		profile:ListenToRelease(function()
			Profiles[player] = nil
			player:Kick()
		end)

		if player:IsDescendantOf(game.Players) == true then
			Profiles[player] = profile
		else
			profile:Release()
		end
	else
		player:Kick()
	end
end

-- When a player joins the game
game.Players.PlayerAdded:Connect(function(player)
	playerAdded(player)

	local profile = Profiles[player]
	if not profile then
		warn("No profile")
		return
	end

	local folder = Instance.new("Folder")
	folder.Name = "leaderstats"
	folder.Parent = player

	local cash = Instance.new("IntValue")
	cash.Name = "Cash"
	cash.Value = 0
	cash.Parent = folder

	cash:GetAttributeChangedSignal("Value"):Connect(function()
		profile.Data.Cash = cash.Value
		profile:SaveAsync()
	end)
	cash.Value = profile.Data.Cash
end)

game.Players.PlayerRemoving:Connect(function(player)
	local profile = Profiles[player]

	if profile then
		profile:Release()
	end
end)
