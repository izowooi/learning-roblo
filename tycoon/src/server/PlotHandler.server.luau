local Plots = game.Workspace.Plots
local TemplatePlot = game.Workspace.TemplatePlot

local function getPlot(player)
	for _, plot in Plots:GetChildren() do
		local owner = plot:GetAttribute("Owner")
		if not owner then
			continue
		end
		if owner ~= player.UserId then
			continue
		end
		return plot
	end
	return nil
end

local function GetButtonByIdofItemToUnlock(player, itemId)
	local plot = getPlot(player)
	if not plot then
		return
	end

	for _, button in plot.Buttons:GetChildren() do
		local IdOfItemToUnlock = button:GetAttribute("IdOfItemToUnlock")
		if not IdOfItemToUnlock then
			continue
		end
		if IdOfItemToUnlock == itemId then
			return button
		end
	end

	return nil
end

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

			if Button:GetAttribute("Hidden") then
				Button.Transparency = 1
				Button.CanCollide = false
				Button.BillboardGui.Enabled = false
			end

			Button.Touched:Connect(function(hit)
				local player = game.Players:GetPlayerFromCharacter(hit.Parent)
				if not player then
					return
				end
				if plot:GetAttribute("Owner") ~= player.UserId then
					return
				end

				if Button:GetAttribute("Debounce") then
					return
				end
				Button:SetAttribute("Debounce", true)
				task.delay(1, function()
					Button:SetAttribute("Debounce", false)
				end)

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

				local ItemIdsToAppear = Button:GetAttribute("ItemIdsToAppear")
				print("[DEBUG] ItemIdsToAppear from Button:", ItemIdsToAppear)

				if ItemIdsToAppear then
					local ItemIds = string.split(ItemIdsToAppear, ",")
					print("[DEBUG] Split ItemIds:", table.concat(ItemIds, ", "))

					for _, ItemId in ItemIds do
						print("[DEBUG] Processing ItemId (string):", ItemId, "type:", type(ItemId))
						local ItemIdNumber = tonumber(ItemId)
						print("[DEBUG] ItemId after tonumber:", ItemIdNumber, "type:", type(ItemIdNumber))

						if not ItemIdNumber then
							warn("[DEBUG] Failed to convert ItemId to number:", ItemId)
							continue
						end

						local FoundButton = GetButtonByIdofItemToUnlock(player, ItemIdNumber)
						print("[DEBUG] GetButtonByIdofItemToUnlock result:", FoundButton)

						if not FoundButton then
							warn("[DEBUG] Button not found for ItemId:", ItemIdNumber)
							continue
						end

						print("[DEBUG] Showing button:", FoundButton.Name, "for ItemId:", ItemIdNumber)
						FoundButton:SetAttribute("Hidden", nil)
						FoundButton.BillboardGui.Enabled = true
						FoundButton.Transparency = 0
						FoundButton.CanCollide = true
					end
				else
					print("[DEBUG] No ItemIdsToAppear attribute on this Button")
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

					for _, descendant in itemClone:GetDescendants() do
						if descendant:IsA("BaseScript") then
							script.Enabled = true
						end
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
