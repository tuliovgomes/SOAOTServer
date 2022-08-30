local setting = {
	centerRoom = {x = 1075, y = 1379, z = 7},
	storage = 14332,
	bossPosition1 = {x = 1084, y = 1394, z = 7},
	bossPosition2 = {x = 1051, y = 1392, z = 7},
	bossPosition3 = {x = 1052, y = 1365, z = 7},
	bossPosition4 = {x = 1090, y = 1360, z = 7},
	kickPosition = {x = 1118, y = 1429, z = 7},
	playerTeleport = {x = 1095, y = 1394, z = 7},
	playerLevel=450
}

local worldDevourerLever = Action()

-- Start Script
function worldDevourerLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 8911 and item.actionid == 14332 then
	local clearworldDevourerRoom = Game.getSpectators(Position(setting.centerRoom), false, false,  25, 25, 25, 25)
	for index, spectatorcheckface in ipairs(clearworldDevourerRoom) do
			if spectatorcheckface:isPlayer() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
					return false
			end
	end
	for index, removeworldDevourer in ipairs(clearworldDevourerRoom) do
			if (removeworldDevourer:isMonster()) then
					removeworldDevourer:remove()
			end
	end
			Game.createMonster("Rupture", setting.bossPosition1, false, true)
			Game.createMonster("Aftershock", setting.bossPosition2, false, true)
			Game.createMonster("Eradicator", setting.bossPosition3, false, true)
			Game.createMonster("World Devourer", setting.bossPosition4, false, true)
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
									local spectatorsworldDevourer = Game.getSpectators(Position(setting.centerRoom), false, false,  25, 25, 25, 25)
											for u = 1, #spectatorsworldDevourer, 1 do
													if spectatorsworldDevourer[U]:isPlayer() and (spectatorsworldDevourer[U]:getName() == player:getName()) then
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

worldDevourerLever:aid(14332)
worldDevourerLever:register()
