local tibiaCoin = Action()

function tibiaCoin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local points = item:getCount()
    db.query("UPDATE `accounts` SET `coins` = `coins` + '" .. points .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..points.." coins")
    item:remove(points)
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		player:getPosition():sendMagicEffect(CONST_ME_CONFETTI_HORIZONTAL)
		player:getPosition():sendMagicEffect(CONST_ME_CONFETTI_VERTICAL)
		player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
    return true
end

tibiaCoin:id(22118)
tibiaCoin:register()
