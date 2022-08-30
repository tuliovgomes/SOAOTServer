local setting = {
	centerRoom = {x = 919, y = 1285, z = 10},
	storage = 50060,
	bossPosition = {x = 919, y = 1285, z = 10},
	kickPosition = {x = 917, y = 1273, z = 10},
	playerTeleport = {x = 915, y = 1282, z = 10},
	playerLevel = 450
}

local urmahlulluLever = Action()

-- Start Script
function urmahlulluLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2772 and item.actionid == 35001 then
		local clearurmahlulluRoom = Game.getSpectators(Position(setting.centerRoom), false, false, 10, 10, 10, 10)
		for index, spectatorcheckface in ipairs(clearurmahlulluRoom) do
			if spectatorcheckface:isPlayer() then
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
				return false
			end
		end
		for index, removeurmahlullu in ipairs(clearurmahlulluRoom) do
			if (removeurmahlullu:isMonster()) then
				removeurmahlullu:remove()
			end
		end
		Game.createMonster("Urmahlullu", setting.bossPosition, false, true)
		local players = {}
		for i = 0, 4 do
			local player1 = Tile({x = (Position(item:getPosition()).x - 2) + i, y = Position(item:getPosition()).y + 1, z = Position(item:getPosition()).z}):getTopCreature()
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
			addEvent(function(cid)
				local playerToRemove = Player(cid)
				if playerToRemove then
					local playerToRemovePosition = playerToRemove:getPosition()
					local leftTopCorner = Position(setting.centerRoom.x - 10, setting.centerRoom.y - 10, setting.centerRoom.z)
					local rightBottomCorner = Position(setting.centerRoom.x + 10, setting.centerRoom.y + 10, setting.centerRoom.z)
					if playerToRemovePosition:isInRange(leftTopCorner, rightBottomCorner) then
						playerToRemove:teleportTo(Position(setting.kickPosition))
						playerToRemove:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						playerToRemove:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Time is over.')
					end
				end
			end, 20 * 60 * 1000, player:getId())
		end
	end
	return true
end

urmahlulluLever:aid(35001)
urmahlulluLever:register()
