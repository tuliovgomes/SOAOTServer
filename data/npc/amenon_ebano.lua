local npcName = "Amenon at Ebano"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 128,
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
	{ itemName = "master archer's armor", clientId = 8060, sell = 30000},
	{ itemName = "windborn colossus armor", clientId = 8055, sell = 60000},
	{ itemName = "oceanborn leviathan armor", clientId = 8056, sell = 60000},
	{ itemName = "earthborn titan armor", clientId = 8054, sell = 60000},
	{ itemName = "zenit cuirass", clientId = 10384, sell = 90000},
	{ itemName = "fireborn giant armor", clientId = 8053, sell = 60000},
	{ itemName = "aghanim robe", clientId = 825, sell = 40000},
	{ itemName = "amazon armor", clientId = 3394, sell = 14000},
	{ itemName = "blue robe", clientId = 3567, sell = 7000},
	{ itemName = "demon armor ", clientId = 3388, sell = 30000},
	{ itemName = "crown armor", clientId = 3381, sell = 23000},
	{ itemName = "dark lords cape", clientId = 8037, sell = 24000},
	{ itemName = "divine plate", clientId = 8057, sell = 160000},
	{ itemName = "falcon plate", clientId = 28719, sell = 800000},
	{ itemName = "ornate chestplate", clientId = 13993, sell = 500000},
	{ itemName = "depth lorica", clientId = 13994, sell = 700000},
	{ itemName = "toga mortis", clientId = 31583, sell = 100000},
	{ itemName = "dwarven armor", clientId = 3397, sell = 8000},
	{ itemName = "frozen plate", clientId = 8059, sell = 15000},
	{ itemName = "knight armor", clientId = 3370, sell = 18000},
	{ itemName = "magma coat ", clientId = 826, sell = 18000},
	{ itemName = "noble armor", clientId = 3380, sell = 9000},
	{ itemName = "plate armor", clientId = 3357, sell = 1650},
	{ itemName = "red robe", clientId = 3566, sell = 25000},
	{ itemName = "terra mantle", clientId = 811, sell = 20000 },
	{ itemName = "golden armor", clientId = 3360, sell = 60000 },
	{ itemName = "crystalline armor", clientId = 8050, sell = 41000 },
	{ itemName = "valar plate", clientId = 8862, sell = 400000 },
	{ itemName = "dragon scale mail", clientId = 3386, sell = 40000 },
	{ itemName = "magic plate armor", clientId = 3366, sell = 200000 },
	{ itemName = "legolas plate", clientId = 8063, sell = 330000 },
	{ itemName = "voltage armor", clientId = 8051, sell = 45000 },
	{ itemName = "divine robe", clientId = 10439, sell = 30000 },
	{ itemName = "master archer's armor", clientId = 8060, buy = 90000},
	{ itemName = "aghanim robe", clientId = 825, buy = 90000},
	{ itemName = "knight armor", clientId = 3370, buy = 28000},
	{ itemName = "plate armor", clientId = 3357, buy = 3650},
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
