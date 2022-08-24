local npcName = "Carmadin Helter"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1460,
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
	{ itemName = "aghanim mask", clientId = 828, sell = 20000},
	{ itemName = "amazon helmet", clientId = 3393, sell = 4000},
	{ itemName = "batwing hat", clientId = 9103, sell = 1800},
	{ itemName = "bonelord helmet", clientId = 3408, sell = 6000},
	{ itemName = "ceremonial mask", clientId = 3395, sell = 12000},
	{ itemName = "crown helmet", clientId = 3385, sell = 6000},
	{ itemName = "crusader helmet", clientId = 3391, sell = 10000},
	{ itemName = "demon helmet", clientId = 3387, sell = 75000},
	{ itemName = "dragon scale helmet", clientId = 3400, sell = 50000},
	{ itemName = "dwarven helmet", clientId = 3396, sell = 1000},
	{ itemName = "glacier mask", clientId = 829, sell = 1200},
	{ itemName = "golden helmet", clientId = 3365, sell = 200000},
	{ itemName = "helmet of the ancients", clientId = 3229, sell = 15000},
	{ itemName = "horned helmet", clientId = 3390, sell = 30000},
	{ itemName = "horseman helmet", clientId = 3405, sell = 900},
	{ itemName = "magic steel helmet", clientId = 9399, sell = 45000},
	{ itemName = "magician hat", clientId = 3573, sell = 2500},
	{ itemName = "royal helmet", clientId = 3392, sell = 20000},
	{ itemName = "rubber cap", clientId = 21165, sell = 10000},
	{ itemName = "skull helmet", clientId = 5741, sell = 18000},
	{ itemName = "strange helmet", clientId = 3373, sell = 1200},
	{ itemName = "terra hood", clientId = 830, sell = 900},
	{ itemName = "warrior helmet", clientId = 3369, sell = 8000 },
	{ itemName = "winged helmet", clientId = 3368, sell = 125000 },
	{ itemName = "Valar mask", clientId = 8864, sell = 520000 },
	{ itemName = "falcon coif", clientId = 28715, sell = 620000 },
	{ itemName = "falcon circlet", clientId = 28714, sell = 620000 },
	{ itemName = "galea mortis", clientId = 31582, sell = 820000 },
	{ itemName = "cobra hood", clientId = 30397, sell = 520000 },
	{ itemName = "zenit helmet", clientId = 10385, sell = 90000 },
	{ itemName = "aghanim mask", clientId = 828, buy = 90000},
	{ itemName = "amazon helmet", clientId = 3393, buy = 8000},
	{ itemName = "batwing hat", clientId = 9103, buy = 4800},
	{ itemName = "bonelord helmet", clientId = 3408, buy = 9000},
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
