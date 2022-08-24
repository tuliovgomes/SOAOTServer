local npcName = "Mercury Hermes"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1251,
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
	{ itemName = "aghanim boots", clientId = 820, sell = 25000},
	{ itemName = "boots of haste", clientId = 3079, sell = 15000},
	{ itemName = "crocodile boots", clientId = 3556, sell = 5000},
	{ itemName = "dragon scale boots", clientId = 10201, sell = 50000},
	{ itemName = "firewalker boots", clientId = 9018, sell = 300000},
	{ itemName = "fur boots", clientId = 7457, sell = 4000},
	{ itemName = "glacier shoes", clientId = 819, sell = 14000},
	{ itemName = "golden boots", clientId = 3555, sell = 500000},
	{ itemName = "magma boots", clientId = 818, sell = 18000},
	{ itemName = "pirate boots", clientId = 5461, sell = 3000},
	{ itemName = "soft boots", clientId = 6529, sell = 50000},
	{ itemName = "cobra boots", clientId = 30394, sell = 500000},
	{ itemName = "depth calcei", clientId = 13997, sell = 400000},
	{ itemName = "steel boots", clientId = 3554, sell = 20000},
	{ itemName = "terra boots", clientId = 813, sell = 6000},
	{ itemName = "zenit shoes", clientId = 10386, sell = 50000},
	{ itemName = "aghanim boots", clientId = 820, buy = 70000},
	{ itemName = "boots of haste", clientId = 3079, buy = 45000},
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
