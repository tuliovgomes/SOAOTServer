local internalNpcName = "Older Pharaoh"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 8

npcConfig.outfit = {
	lookType = 1173
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Promotion
local promoteKeyword = keywordHandler:addKeyword({'promotion'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to be promoted in your vocation for 20000 gold?'})
	promoteKeyword:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, level = 20, cost = 20000})
	promoteKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'Ok, whatever.', reset = true})

npcHandler:setMessage(MESSAGE_GREET, 'I am the oldest in the world of anarchy, I master all arts, forge, fighting and magic and I can teach you are you ready? {promotion}')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye, |PLAYERNAME|!')

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
