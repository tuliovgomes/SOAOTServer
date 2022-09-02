local positions = {
	["HUNTS"] = Position(987, 975, 7),
	["FIDELITAS"] = Position(1085, 1039, 7),
	["NPCS"] = Position(1084, 1039, 7),
}

local positionsVip = {
	["HUNTS FREE"] = Position(1085, 1025, 7),
	["FIDELITAS"] = Position(1087, 1025, 7),
	["NPCS"] = Position(1086, 1025, 7),
}

local teleportText = GlobalEvent("Teleport Texts")

function teleportText.onThink(interval, lastExecution)

    local player = Game.getPlayers()[1]
    if not player then
        return true
    end

    for text, position in pairs(positions) do
        player:say(text, TALKTYPE_MONSTER_SAY, false, nil, position)
        position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
        position:sendMagicEffect(CONST_ME_TUTORIALARROW)
    end


    for text, position in pairs(positionsVip) do
        player:say(text, TALKTYPE_MONSTER_SAY, false, nil, position)
        position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
        position:sendMagicEffect(CONST_ME_TUTORIALARROW)
    end

	return true
end

teleportText:interval(3200)
teleportText:register()
