local npcName = "Max The barbarian"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1056,
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
	{ itemName = "axe of Frerin", clientId = 7434, sell = 130000 },
	{ itemName = "beastslayer axe", clientId = 3344, sell = 26000 },
	{ itemName = "double axe", clientId = 3275, sell = 1300 },
	{ itemName = "dragon lance", clientId = 3302, sell = 22000 },
	{ itemName = "dramborleg", clientId = 7413, sell = 100000 },
	{ itemName = "dreaded cleaver", clientId = 7419, sell = 25000 },
	{ itemName = "reaper's axe", clientId = 7420, sell = 25000 },
	{ itemName = "hellforged axe", clientId = 8096, sell = 150000 },
	{ itemName = "dwarven axe", clientId = 3323, sell = 1400 },
	{ itemName = "fire axe", clientId = 3320, sell = 10000 },
	{ itemName = "angelic axe", clientId = 7436, sell = 15000 },
	{ itemName = "mythril axe", clientId = 7455, sell = 6000 },
	{ itemName = "great axe", clientId = 3303, sell = 50000 },
	{ itemName = "headchopper", clientId = 7380, sell = 15000 },
	{ itemName = "knight axe", clientId = 3318, sell = 3000 },
	{ itemName = "naginata", clientId = 3314, sell = 12000 },
	{ itemName = "ruthless axe", clientId = 6553, sell = 35000 },
	{ itemName = "butcher's axe", clientId = 7412, sell = 25000 },
	{ itemName = "falcon battleaxe", clientId = 28724, sell = 800000 },
	{ itemName = "cobra axe", clientId = 30396, sell = 600000 },
	{ itemName = "lion axe", clientId = 34253, sell = 100000 },
	{ itemName = "glooth axe", clientId = 21180, sell = 15000 },
	{ itemName = "drakinata", clientId = 10388, sell = 15000 },
	{ itemName = "stonecutter axe", clientId = 3319, sell = 60000 },
	{ itemName = "twin axe", clientId = 3335, sell = 19000 },
	{ itemName = "vile axe", clientId = 7388, sell = 38000 },
	{ itemName = "war axe", clientId = 3342, sell = 25000 },
	{ itemName = "knight axe", clientId = 3318, buy = 6000 },
	{ itemName = "headchopper", clientId = 7380, buy = 55000 },
	{ itemName = "noble axe", clientId = 7456, buy = 75000, sell = 10000 },
	{ itemName = "dreaded cleaver", clientId = 7419, buy = 95000 },
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
