local setting = {
	centerRoom = {x = 1234, y = 1310, z = 9},
	storage = 34000,
	boss1Position = {x = 1235, y = 1300, z = 9},
	boss2Position = {x = 1243, y = 1308, z = 9},
	boss3Position = {x = 1227, y = 1312, z = 9},
	kickPosition = {x = 1147, y = 1401, z = 9},
	playerTeleport = {x = 1232, y = 1317, z = 9}
}

local ObujusLever = Action()

-- Start Script
function ObujusLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2772 and item.actionid == 34000 then
	local clearObujusRoom = Game.getSpectators(Position(setting.centerRoom), false, false,  7, 7, 6, 6)
	for index, spectatorcheckface in ipairs(clearObujusRoom) do
			if spectatorcheckface:isPlayer() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
					return false
			end
	end
	for index, removeObujus in ipairs(clearObujusRoom) do
			if (removeObujus:isMonster()) then
					removeObujus:remove()
			end
	end
			Game.createMonster("Obujos", setting.boss1Position, false, true)
			Game.createMonster("Jaul", setting.boss2Position, false, true)
			Game.createMonster("Tanjis", setting.boss3Position, false, true)
	local players = {}
	for i = 0, 4 do
		local player1 = Tile({x = (Position(item:getPosition()).x - 2) + i, y = Position(item:getPosition()).y + 1, z = Position(item:getPosition()).z}):getTopCreature()
			players[#players+1] = player1
	end
			for i, player in ipairs(players) do

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
									local spectatorsObujus = Game.getSpectators(Position(setting.centerRoom), false, false, 7, 7, 6, 6)
											for u = 1, #spectatorsObujus, 1 do
													if spectatorsObujus[U]:isPlayer() and (spectatorsObujus[U]:getName() == player:getName()) then
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

ObujusLever:aid(34000)
ObujusLever:register()
