local setting = {
	centerRoom = {x = 905, y = 988, z = 6},
	storage = 57600,
	Pillar1pos = {x = 33361, y = 31316, z = 9},
	bossPosition = {x = 905, y = 988, z = 6},
	kickPosition = {x = 904, y = 1001, z = 6},
	playerTeleport = {x = 904, y = 994, z = 6},
	playerLevel = 350
}

local scarlettLever = Action()

-- Start Script
function scarlettLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 5057 and item.actionid == 57600 then
	local clearScarlettRoom = Game.getSpectators(Position(setting.centerRoom), false, false,  7, 7, 6, 6)
	for index, spectatorcheckface in ipairs(clearScarlettRoom) do
			if spectatorcheckface:isPlayer() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
					return false
			end
	end
	for index, removeScarlett in ipairs(clearScarlettRoom) do
			if (removeScarlett:isMonster()) then
					removeScarlett:remove()
			end
	end
			Game.createMonster("Scarlett Etzel", setting.bossPosition, false, true)
	local players = {}
	for i = 0, 4 do
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
									local spectatorsScarlett = Game.getSpectators(Position(setting.centerRoom), false, false, 7, 7, 6, 6)
											for u = 1, #spectatorsScarlett, 1 do
													if spectatorsScarlett[U]:isPlayer() and (spectatorsScarlett[U]:getName() == player:getName()) then
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

scarlettLever:aid(57600)
scarlettLever:register()
