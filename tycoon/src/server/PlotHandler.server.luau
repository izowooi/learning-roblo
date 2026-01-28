local Plots = game.Workspace.Plots
local TemplatePlot = game.Workspace.TemplatePlot
-- Player joins a game
game.Players.PlayerAdded:Connect(function(player)
	-- Get a plot
	for _, plot in Plots:GetChildren() do
		if plot:GetAttribute("Taken") then
			continue
		end

		plot:SetAttribute("Taken", true)
		plot:SetAttribute("Owner", player.UserId)

		print("Plot has been given to " .. player.Name .. "!")

		local ItemsFolder = Instance.new("Folder")
		ItemsFolder.Name = "Items"
		ItemsFolder.Parent = plot

		-- Load buttons
		local TemplateButtons = TemplatePlot.Buttons:Clone()
		local TemplateItems = TemplatePlot.Items

		for _, Button in TemplateButtons:GetChildren() do
			-- Get the pos of the button relative to the template plot
			-- How far away is button from the centre of the template plot (20,30)
			local RelativeCFrame = TemplatePlot.CFrame:ToObjectSpace(Button.CFrame)
			Button.CFrame = plot.CFrame:ToWorldSpace(RelativeCFrame)

			Button.Touched:Connect(function(hit)
				local player = game.Players:GetPlayerFromCharacter(hit.Parent)
				if not player then
					return
				end
				if plot:GetAttribute("Owner") ~= player.UserId then
					return
				end

				-- TODO: remove currency / check enough currency
				local itemToUnlockId = Button:GetAttribute("IdOfItemToUnlock")
				if not itemToUnlockId then
					warn("You forgot to add an IdOfItemToUnlock attribute")
					return
				end

				local Price = Button:GetAttribute("Price")
				if Price then
					if player.leaderstats.Cash.Value < Price then
						warn("Not enough cash to unlock this item.")
						return
					end
					player.leaderstats.Cash.Value = player.leaderstats.Cash.Value - Price
				end

				for _, item in TemplateItems:GetChildren() do
					if item:GetAttribute("Id") ~= itemToUnlockId then
						continue
					end
					-- found correct item
					-- clone it out and re-position for our plot
					local itemClone = item:Clone()
					local itemCFrame

					if itemClone:IsA("Model") then
						itemCFrame = itemClone:GetPivot() -- model
					elseif itemClone:IsA("BasePart") then
						itemCFrame = itemClone.CFrame
					end

					local relativeItemCFrame = TemplatePlot.CFrame:ToObjectSpace(itemCFrame)
					local worldCFrameOfNewPlot = plot.CFrame:ToWorldSpace(relativeItemCFrame)

					if itemClone:IsA("Model") then
						itemClone:PivotTo(worldCFrameOfNewPlot)
					elseif itemClone:IsA("BasePart") then
						itemClone.CFrame = worldCFrameOfNewPlot
					end

					itemClone.Parent = TemplateButtons
					Button:Destroy()
				end
			end)

			Button.Parent = TemplateButtons
		end
		TemplateButtons.Parent = plot
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
