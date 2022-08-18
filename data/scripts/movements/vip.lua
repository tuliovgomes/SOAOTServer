local config = {
	teleportActionId = 5878
}

local vipTitle = MoveEvent('vipTitle')
function vipTitle.onStepIn(player, item, position, fromPosition)
	if player:getPremiumDays() == 0 then
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_ROOTS)
			player:getPosition():sendMagicEffect(CONST_ME_BIG_SCRATCH)

			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Voce nao tem VIP.")
			return true
	end
	player:getPosition():sendMagicEffect(CONST_ME_GHOST_SMOKE)
	return true
end
vipTitle:aid(config.teleportActionId)
vipTitle:register()
