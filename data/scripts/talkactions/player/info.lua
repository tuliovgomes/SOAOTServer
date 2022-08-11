local info = TalkAction("!info", "/info")

function info.onSay(player, words, param)
	local str = ""

	str = "Name: " .. player:getName() .. "\n"
		.."Level: " .. player:getLevel() .. "\n"
		.."Vocation: " .. player:getVocation():getName() .. "\n"
		.."Premium Days: " .. player:getPremiumDays() .. "\n"
		.."Tibia Coins: " .. player:getTibiaCoins() .. "\n"
		.."Guild: " .. player:getGuildNick() .. "\n"
		.."Balance: " .. player:getBankBalance() .. "\n"
		.."Sex: " .. (player:getSex() and "M" or "F") .. "\n"
		.."Magic Level: " .. player:getMagicLevel() .. "\n"
		.."Speed: " .. player:getSpeed() .. "\n\n"

	player:popupFYI(str)

	return false
end

info:separator(" ")
info:register()