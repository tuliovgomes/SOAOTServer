local setting = {
	centerRoom = {x = 1044, y = 976, z = 7},
	storage = 58836,
	bossPosition = {x = 1044, y = 978, z = 7},
	kickPosition = {x = 983, y = 991, z = 7},
	playerTeleport = {x = 1050, y = 978, z = 7},
	playerLevel = 200
}

local emelianenkoLever = Action()

-- Start Script
function emelianenkoLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 8836 and item.actionid == 58836 then
	local clearemelianenkoRoom = Game.getSpectators(Position(setting.centerRoom), false, false,  7, 7, 6, 6)
	for index, spectatorcheckface in ipairs(clearemelianenkoRoom) do
			if spectatorcheckface:isPlayer() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
					return false
			end
	end
	for index, removeemelianenko in ipairs(clearemelianenkoRoom) do
			if (removeemelianenko:isMonster()) then
					removeemelianenko:remove()
			end
	end
			Game.createMonster("Emelianenko", setting.bossPosition, false, true)
	local players = {}
	for i = 0, 3 do
			local player1 = Tile({x = (Position(item:getPosition()).x), y = Position(item:getPosition()).y + i, z = Position(item:getPosition()).z}):getTopCreature()
			players[#players+1] = player1
	end
			for i, player in ipairs(players) do
					if player:getLevel() < setting.playerLevel then
						player:sendCancelMessage("you don't have enough level, you need level ".. setting.playerLevel .." to fight with this boss", cid)
						return true
					end
					if player:getStorageValue(setting.storage) > os.time() then
						player:sendCancelMessage("you can only enter once a day.", cid)
						return true
					end

					player:getPosition():sendMagicEffect(CONST_ME_POFF)
					player:teleportTo(Position(setting.playerTeleport), false)
					doSendMagicEffect(player:getPosition(), CONST_ME_TELEPORT)
					setPlayerStorageValue(player,setting.storage, os.time() + 20 * 60 * 60)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have 20 minute(s) to defeat the boss.')
							addEvent(function()
									local spectatorsemelianenko = Game.getSpectators(Position(setting.centerRoom), false, false, 7, 7, 6, 6)
											for u = 1, #spectatorsemelianenko, 1 do
													if spectatorsemelianenko[U]:isPlayer() and (spectatorsemelianenko[U]:getName() == player:getName()) then
															player:teleportTo(Position(setting.kickPosition))
															player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
															player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Time is over.')
													end
											end
							end, 20 * 60 * 1000)
			end
	end
	return true
end

emelianenkoLever:aid(58836)
emelianenkoLever:register()
