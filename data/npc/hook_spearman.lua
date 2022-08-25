local npcName = "Hook Spearman"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1204,
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
	{ itemName = "bow", clientId = 3350, buy = 400, sell = 130 },
	{ itemName = "crossbow", clientId = 3349, buy = 500, sell = 160 },
	{ itemName = "royal spear", clientId = 7378, sell = 30000 },
	{ itemName = "enchanted spear", clientId = 7367, sell = 40000 },
	{ itemName = "throwing star of Sula", clientId = 22870, sell = 4000000 },
	{ itemName = "spear", clientId = 3277, buy = 10 },
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "crystalline arrow", clientId = 15793, buy = 300 },
	{ itemName = "prismatic bolt", clientId = 16141, buy = 300 },
	{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "earth arrow", clientId = 774, buy = 5 },
	{ itemName = "flaming arrow", clientId = 763, buy = 5 },
	{ itemName = "flash arrow", clientId = 761, buy = 5 },
	{ itemName = "power bolt", clientId = 3450, buy = 7 },
	{ itemName = "assassin star", clientId = 7368, buy = 100 },
	{ itemName = "quiver", clientId = 35562, buy = 100 },
	{ itemName = "jungle quiver", clientId = 35524, buy = 2000000,  sell = 100000 },
	{ itemName = "eldritch quiver", clientId = 36666, buy = 4000000, sell = 200000 },
	{ itemName = "aiglos", clientId = 3313, sell = 100000 },
	{ itemName = "arbalest", clientId = 5803, sell = 80000 },
	{ itemName = "leaf star", clientId = 25735, sell = 400000 },
	{ itemName = "royal star", clientId = 25759, sell = 800000 },
	{ itemName = "falcon bow", clientId = 28718, sell = 800000 },
	{ itemName = "lion longbow", clientId = 34150, sell = 100000 },
	{ itemName = "cobra crossbow", clientId = 30393, sell = 600000 },
	{ itemName = "bow of cataclysm", clientId = 31581, sell = 1000000 },
	{ itemName = "throwing star of Sula", clientId = 22870, sell = 5000000 },
	{ itemName = "mycological bow", clientId = 16164, sell = 50000 },
	{ itemName = "hunting spear", clientId = 3347, sell = 10000 },
	{ itemName = "enchanted spear", clientId = 7367, sell = 40000 },
	{ itemName = "diamond arrow", clientId = 25757, sell = 60000 },
	{ itemName = "spectral bolt", clientId = 25758, sell = 60000 },
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
