local npcName = "Chun Lee"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1211,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 2,
}



npcConfig.flags = {
	floorchange = false
}

-- Npc shop
npcConfig.shop = {
	{ itemName = "exercise axe", clientId = 28553, buy = 100000, count = 2000 },
	{ itemName = "exercise bow", clientId = 28555, buy = 100000, count = 2000 },
	{ itemName = "exercise club", clientId = 28554, buy = 100000, count = 2000 },
	{ itemName = "exercise sword", clientId = 28552, buy = 100000, count = 2000 },
	{ itemName = "exercise rod", clientId = 28556, buy = 100000, count = 2000 },
	{ itemName = "exercise wand", clientId = 28557, buy = 100000, count = 2000 },

	{ itemName = "durable exercise axe", clientId = 35280, buy = 800000, count = 5800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 800000, count = 5800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 800000, count = 5800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 800000, count = 5800 },
	{ itemName = "durable exercise rod", clientId = 35283, buy = 800000, count = 5800 },
	{ itemName = "durable exercise wand", clientId = 35284, buy = 800000, count = 5800 },

	{ itemName = "lasting exercise axe", clientId = 35286, buy = 8000000, count = 34400 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 8000000, count = 34400 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 800000, count = 34400 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 8000000, count = 34400 },
	{ itemName = "lasting exercise rod", clientId = 35289, buy = 8000000, count = 34400 },
	{ itemName = "lasting exercise wand", clientId = 35290, buy = 8000000, count = 34400 },
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Bought %ix %s for %i %s.", amount, name, totalCost, ItemType(npc:getCurrency()):getPluralName():lower()))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, subtype, amount, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

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

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
