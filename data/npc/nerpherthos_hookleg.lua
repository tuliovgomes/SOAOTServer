local npcName = "Nerpherthos Hookleg"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 2,
}

npcConfig.voices = {
	interval = 15000,
	chance = 20,
	{ text = "Welcome to Fidelitas Server!" }
}

npcConfig.flags = {
	floorchange = false
}

-- Npc shop
npcConfig.shop = {
	{ itemName = "aghanim legs", clientId = 822, sell = 18000},
	{ itemName = "blue legs", clientId = 645, sell = 150000},
	{ itemName = "crown legs", clientId = 3382, sell = 18000},
	{ itemName = "demon legs", clientId = 3389, sell = 60000},
	{ itemName = "dragon scale legs", clientId = 3363, sell = 50000},
	{ itemName = "dwarven legs", clientId = 3398, sell = 7000},
	{ itemName = "elven legs", clientId = 3401, sell = 4000},
	{ itemName = "glacier kilt", clientId = 823, sell = 7000},
	{ itemName = "golden legs", clientId = 3364, sell = 300000},
	{ itemName = "knight legs", clientId = 3371, sell = 12000},
	{ itemName = "magma legs", clientId = 821, sell = 22000},
	{ itemName = "mammoth fur shorts", clientId = 7464, sell = 450},
	{ itemName = "plate legs", clientId = 3557, sell = 2000},
	{ itemName = "terra legs", clientId = 812, sell = 13000},
	{ itemName = "valar kilt", clientId = 8863, sell = 500000},
	{ itemName = "falcon greaves", clientId = 28720, sell = 800000},
	{ itemName = "ornate legs", clientId = 13999, sell = 700000},
	{ itemName = "zenit legs", clientId = 10387, sell = 45000},
	{ itemName = "aghanim legs", clientId = 822, buy = 86000},
	{ itemName = "dwarven legs", clientId = 3398, buy = 10000},
	{ itemName = "elven legs", clientId = 3401, buy = 8000},
	{ itemName = "glacier kilt", clientId = 823, buy = 14000},
	{ itemName = "knight legs", clientId = 3371, buy = 24000},
	{ itemName = "mammoth fur shorts", clientId = 7464, buy = 600},
	{ itemName = "plate legs", clientId = 3557, buy = 4000},
	{ itemName = "terra legs", clientId = 812, buy = 28000},
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
