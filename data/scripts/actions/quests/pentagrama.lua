local config = {
	duration = 5, -- time till reset, in minutes
	level_req = 1, -- minimum level to do quest
	min_players = 0, -- minimum players to join quest
	lever_id = 2772, -- id of lever before pulled
}

local player_positions = {
	[1] = {fromPos = Position(1012, 1161, 7), toPos = Position(1080, 1157, 7)},
	[2] = {fromPos = Position(1013, 1161, 7), toPos = Position(1080, 1157, 7)},
	[3] = {fromPos = Position(1014, 1161, 7), toPos = Position(1080, 1157, 7)},
	[4] = {fromPos = Position(1015, 1161, 7), toPos = Position(1080, 1157, 7)}
}

local monsters = {
	[1] = {pos = Position(1079, 1147, 7), name = "Gothmog"},
	[2] = {pos = Position(1079, 1153, 7), name = "Gothmog"},
}

function doResetAnnihilator(uid)
	local item = Item(uid)
	if not item then
			return
	end

	local monster_names = {}
	for key, value in pairs(monsters) do
			if not isInArray(monster_names, value.name) then
					monster_names[monster_names + 1] = value.name
			end
	end

	for i = 1, #monsters do
			local creatures = Tile(monsters[i].pos):getCreatures()
			for key, creature in pairs(creatures) do
					if isInArray(monster_names, creature:getName()) then
							creature:remove()
					end
			end
	end

	for i = 1, #player_positions do
			local creatures = Tile(player_positions[i].toPos):getCreatures()
			for key, creature in pairs(creatures) do
					if isInArray(monster_names, creature:getName()) then
							creature:remove()
					end
			end
	end

	item:transform(config.lever_id)
end

local annihilator = Action()


function annihilator.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= config.lever_id then
			return player:sendCancelMessage("The quest is currently in use. Cooldown is " .. config.duration .. " minutes.")
	end

	local participants, pull_player = {}, false
	for i = 1, #player_positions do
			local fromPos = player_positions[i].fromPos
			local tile = Tile(fromPos)
			if not tile then
					print(">> ERROR: Annihilator tile does not exist for Position(" .. fromPos.x .. ", " .. fromPos.y .. ", " .. fromPos.z .. ").")
					return player:sendCancelMessage("There is an issue with this quest. Please contact an administrator.")
			end

			local creature = tile:getBottomCreature()
			if creature then
					local participant = creature:getPlayer()
					if not participant then
							return player:sendCancelMessage(participant:getName() .. " is not a valid participant.")
					end

					if participant:getLevel() < config.level_req then
							return player:sendCancelMessage(participant:getName() .. " is not the required level.")
					end

					if participant.uid == player.uid then
							pull_player = true
					end

					participants[#participants + 1] = {participant = participant, toPos = player_positions[i].toPos}
			end
	end

	if #participants < config.min_players then
			return player:sendCancelMessage("You do not have the required amount of participants.")
	end

	if not pull_player then
			return player:sendCancelMessage("You are in the wrong position.")
	end

	for i = 1, #monsters do
			local toPos = monsters[i].pos
			if not Tile(toPos) then
					print(">> ERROR: Annihilator tile does not exist for Position(" .. toPos.x .. ", " .. toPos.y .. ", " .. toPos.z .. ").")
					return player:sendCancelMessage("There is an issue with this quest. Please contact an administrator.")
			end
			Game.createMonster(monsters[i].name, monsters[i].pos, false, true)
	end

	for i = 1, #participants do
			participants[i].participant:teleportTo(participants[i].toPos)
			participants[i].toPos:sendMagicEffect(CONST_ME_TELEPORT)
	end

	addEvent(doResetAnnihilator, config.duration * 60 * 1000, item.uid)
	return true
end

annihilator:aid(30016)
annihilator:register()
