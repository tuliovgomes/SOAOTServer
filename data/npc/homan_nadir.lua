local npcName = "Homan The Nadir"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1386,
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
	{ itemName = "crystal sword", clientId = 7449, sell = 2000},
	{ itemName = "magic longsword ", clientId = 3278, sell = 200000},
	{ itemName = "bright Sword ", clientId = 3295, sell = 6000},
	{ itemName = "demonrage Sword", clientId = 7382, sell = 50000},
	{ itemName = "djinn blade ", clientId = 3339, sell = 7000},
	{ itemName = "emerald sword", clientId = 8102, sell = 15000},
	{ itemName = "thaian sword", clientId = 7391, sell = 9000},
	{ itemName = "fire sword", clientId = 3280, sell = 5000},
	{ itemName = "giant sword", clientId = 3281, sell = 25000},
	{ itemName = "mercenary sword", clientId = 7386, sell = 15000},
	{ itemName = "glooth blade", clientId = 21179, sell = 15000},
	{ itemName = "haunted blade", clientId = 7407, sell = 18000},
	{ itemName = "magic sword", clientId = 3288, sell = 75000},
	{ itemName = "falcon longsword", clientId = 28723, sell = 800000},
	{ itemName = "cobra sword", clientId = 30398, sell = 600000},
	{ itemName = "narsil ", clientId = 6527, sell = 400000},
	{ itemName = "pharaoh sword", clientId = 3334, sell = 1300},
	{ itemName = "two handed sword ", clientId = 3265, sell = 1200},
	{ itemName = "warlord sword ", clientId = 3296, sell = 100000},
	{ itemName = "wyvern fang", clientId = 7408, sell = 1300},
	{ itemName = "wyvern fang", clientId = 7408, buy = 2300},
	{ itemName = "bright Sword", clientId = 3295, buy = 10000},
	{ itemName = "serpent sword", clientId = 3297, buy = 1500},
	{ itemName = "spike sword", clientId = 3271, buy = 700},
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
