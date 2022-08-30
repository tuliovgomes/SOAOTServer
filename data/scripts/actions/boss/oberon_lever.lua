local setting = {
	centerRoom = {x = 849, y = 1164, z = 9},
	storage = 50050,
	Pillar1pos = {x = 33361, y = 31316, z = 9},
	bossPosition = {x = 849, y = 1164, z = 9},
	kickPosition = {x = 849, y = 1188, z = 9},
	playerTeleport = {x = 853, y = 1167, z = 9},
	playerLevel=400
}

local oberonLever = Action()

-- Start Script
function oberonLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2772 and item.actionid == 57605 then
		local clearOberonRoom = Game.getSpectators(Position(setting.centerRoom), false, false, 10, 10, 10, 10)
		for index, spectatorcheckface in ipairs(clearOberonRoom) do
			if spectatorcheckface:isPlayer() then
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
				return false
			end
		end
		for index, removeOberon in ipairs(clearOberonRoom) do
			if (removeOberon:isMonster()) then
				removeOberon:remove()
			end
		end
		Game.createMonster("Grand Master Oberon", setting.bossPosition, false, true)
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

oberonLever:aid(57605)
oberonLever:register()
