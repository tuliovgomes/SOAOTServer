local setting = {
	centerRoom = {x = 786, y = 847, z = 14},
	storage = 57700,
	bossPosition = {x = 786, y = 845, z = 14},
	kickPosition = {x = 740, y = 845, z = 14},
	playerTeleport = {x = 776, y = 845, z = 14},
	playerLevel=600
}

local kingzelosLever = Action()

-- Start Script
function kingzelosLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2772 and item.actionid == 57700 then
	local clearkingzelosRoom = Game.getSpectators(Position(setting.centerRoom), false, false,  10, 10, 10, 10)
	for index, spectatorcheckface in ipairs(clearkingzelosRoom) do
			if spectatorcheckface:isPlayer() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
					return false
			end
	end
	for index, removekingzelos in ipairs(clearkingzelosRoom) do
			if (removekingzelos:isMonster()) then
					removekingzelos:remove()
			end
	end
			Game.createMonster("King Zelos", setting.bossPosition, false, true)
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
									local spectatorskingzelos = Game.getSpectators(Position(setting.centerRoom), false, false,  10, 10, 10, 10)
											for u = 1, #spectatorskingzelos, 1 do
													if spectatorskingzelos[U]:isPlayer() and (spectatorskingzelos[U]:getName() == player:getName()) then
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

kingzelosLever:aid(57700)
kingzelosLever:register()
