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

		if player:IsDescendantOf(game.Players) then
			Profiles[player] = profile

			-- cash.Changed:Connect(function()
			-- 	profile.Data.Cash = cash.Value
			-- end)

			print("Profile loaded for " .. player.Name)
		else
			profile:Release()
		end
	else
		player:Kick()
	end
end

game.Players.PlayerAdded:Connect(function(player)
	playerAdded(player)

	local profile = Profiles[player]
	if not profile then
		return
	end

	-- leaderstats 생성 (프로필 로드 후)
	local folder = Instance.new("Folder")
	folder.Name = "leaderstats"
	folder.Parent = player

	local cash = Instance.new("IntValue")
	cash.Name = "Cash"
	cash.Value = profile.Data.Cash or 0
	cash.Parent = folder

	cash:GetPropertyChangedSignal("Value"):Connect(function()
		profile.Data.Cash = cash.Value
	end)
end)

game.Players.PlayerRemoving:Connect(function(player)
	local profile = Profiles[player]
	if profile then
		profile:Release()
	end
end)

for _, player in game.Players:GetPlayers() do
	task.spawn(playerAdded, player)
end
