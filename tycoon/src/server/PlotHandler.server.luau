local Plots = game.Workspace.Plots

-- Player joins a game
game.Players.PlayerAdded:Connect(function(player)
	-- Get a plot
	for _, plot in Plots:GetChildren() do
		if plot:GetAttribute("Taken") then
			continue
		end
		-- plot is not taken, so we want to take it
		plot:SetAttribute("Taken", true)
		plot:SetAttribute("Owner", player.UserId)

		print("Plot has been given to " .. player.Name .. "!")
		break
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	for _, plot in Plots:GetChildren() do
		if not plot:GetAttribute("Owner") then
			continue
		end
		-- the plot is owned by a player
		if plot:GetAttribute("Owner") ~= player.UserId then
			continue
		end
		-- we have found the correct plot
		plot:SetAttribute("Taken", nil)
		plot:SetAttribute("Owner", nil)

		print("Plot has been removed from " .. player.Name .. "!")
		break
	end
end)
