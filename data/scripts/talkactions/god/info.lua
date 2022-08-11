local info = TalkAction("/infoPlayer")

function info.onSay(player, words, param)
	local target = Player(param)
	if not target then
		player:sendCancelMessage("This player is offline or doesn't exist.")
		return false
	end

	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local str = ""
	local targetIp = target:getIp()
	str = "Name: " .. target:getName() .. "\n"
		.. "Access: " .. (target:getGroup():getAccess() and "1" or "0") .. "\n"
		.."Level: " .. target:getLevel() .. "\n"
		.."Vocation: " .. target:getVocation():getName() .. "\n"
		.."Premium Days: " .. target:getPremiumDays() .. "\n"
		.."Tibia Coins: " .. target:getTibiaCoins() .. "\n"
		.."Guild: " .. target:getGuildNick() .. "\n"
		.."Balance: " .. target:getBankBalance() .. "\n"
		.."Sex: " .. (target:getSex() and "M" or "F") .. "\n"
		.."Magic Level: " .. target:getMagicLevel() .. "\n"
		.."Speed: " .. target:getSpeed() .. "\n\n"

	local players = {}
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		if targetPlayer:getIp() == targetIp and targetPlayer ~= target then
			players[#players + 1] = targetPlayer:getName() .. " [" .. targetPlayer:getLevel() .. "]"
		end
	end

	local slotName = {
		"Helmet:",
		"Amulet:",
		"Backpack:",
		"Armor:",
		"Hand R:",
		"Hand L:",
		"Legs:",
		"Boots:",
		"Ring:",
		"Arrow:"
	}

	local str = str .. "List of items that are in use: \n"
	local armor = 0
	local fire = 0
	for i=1, 10 do
		str = str.."\n"
		local item = target:getSlotItem(i)
		if item and item.itemid > 0 then
			local count = ""
			if item.type > 0 then
				count = "("..item.type.."x)"
			else
				count = ""
			end
			str = str..slotName[i].." "..ItemType(item.itemid):getName().." "..count
			if ItemType(item.itemid):getArmor() >= 0 then
				armor = armor + ItemType(item.itemid):getArmor()
			end
		else
			str = str..slotName[i].." Empty"
		end
	end

	str = str ..  "\n\nAttributes of items in use:\n"
	str = str .. "Protection Armor: " .. armor

	str = str .. "\n\nPosition: " .. string.format("(%0.5d / %0.5d / %0.3d)", target:getPosition().x, target:getPosition().y, target:getPosition().z) .. "\n"
		.."IP: " .. Game.convertIpToString(targetIp) .. "\n"

	if #players > 0 then
		str = str .. "Other players on same IP: " .. table.concat(players, ", ") .. "\n"
	end

	player:showTextDialog(27845,str)
	return false
end

info:separator(" ")
info:register()
