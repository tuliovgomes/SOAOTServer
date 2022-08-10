local npcName = "Demacio el Conteinador"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 132,
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
	{ itemName = "purple backpack", clientId = 2868, sell = 10},
	{ itemName = "green Backpack", clientId = 2865, sell = 10},
	{ itemName = "blue backpack", clientId = 2869, sell = 10},
	{ itemName = "golden backpack", clientId = 2871, sell = 10},
	{ itemName = "red backpack", clientId = 2867, sell = 10},
	{ itemName = "grey backpack", clientId = 2870, sell = 10},
	{ itemName = "beach backpack", clientId = 5949, sell = 20},
	{ itemName = "camouflage backpack", clientId = 2872, sell = 20},
	{ itemName = "pirate backpack", clientId = 5926, sell = 20},
	{ itemName = "fur backpack", clientId = 7342, sell = 20},
	{ itemName = "backpack of holding", clientId = 3253, sell = 30},
	{ itemName = "demon backpack", clientId = 9601, sell = 2500},
	{ itemName = "moon backpack", clientId = 9604, sell = 3000},
	{ itemName = "crown backpack", clientId = 9605, sell = 2800},
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