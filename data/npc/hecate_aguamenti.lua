local npcName = "Hecate Aguamenti"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1415,
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
	{ itemName = "aghanim's Scepter", clientId = 7424, sell = 120000},
	{ itemName = "hailstorm rod", clientId = 3067, sell = 3000, buy = 4000},
	{ itemName = "mekansm", clientId = 7410, sell = 150000},
	{ itemName = "glacial rod", clientId = 16118, sell = 16000, buy = 56000},
	{ itemName = "muck rod", clientId = 16117, sell = 16000, buy = 56000},
	{ itemName = "wand of everblazing", clientId = 16115, sell = 16000, buy = 56000},
	{ itemName = "shadow sceptre", clientId = 7451, sell = 26000},
	{ itemName = "blessed sceptre", clientId = 7429, sell = 36000},
	{ itemName = "falcon wand", clientId = 28717, sell = 800000},
	{ itemName = "cobra wand", clientId = 30399, sell = 600000},
	{ itemName = "cobra rod", clientId = 30400, sell = 600000},
	{ itemName = "lion wand", clientId = 34152, sell = 100000},
	{ itemName = "lion rod", clientId = 34151, sell = 100000},
	{ itemName = "saurons breath", clientId = 8082, sell = 500},
	{ itemName = "terra rod", clientId = 3065, sell = 1000},
	{ itemName = "wand of cosmic energy", clientId = 3073, sell = 1000},
	{ itemName = "wand of decay", clientId = 3072, sell = 533},
	{ itemName = "wand of inferno", clientId = 3071, sell = 2000, buy = 4000},
	{ itemName = "wand of vortex", clientId = 3074, sell = 16},
	{ itemName = "wand of dragonbreath", clientId = 3075, buy = 266},
	{ itemName = "moonlight rod", clientId = 3070, buy = 266},
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
