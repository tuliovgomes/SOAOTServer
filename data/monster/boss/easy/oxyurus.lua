local mType = Game.createMonsterType("Oxyurus")
local monster = {}

monster.description = "a Oxyurus"
monster.experience = 2775
monster.outfit = {
	lookType = 295,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5005
monster.maxHealth = 5005
monster.race = "blood"
monster.corpse = 8119
monster.speed = 126
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "gold coin", chance = 50000, maxCount = 190},
	{name = "small emerald", chance = 3770, maxCount = 20},
	{name = "platinum coin", chance = 74810, maxCount = 600},
	{name = "knight armor", chance = 1840},
	{name = "pharaoh sword", chance = 840},
	{name = "medusa shield", chance = 3040},
	{name = "great mana potion", chance = 10000, maxCount = 20},
	{name = "strong health potion", chance = 5790, maxCount = 200},
	{name = "strong mana potion", chance = 5980, maxCount = 200},
	{name = "terra mantle", chance = 870},
	{name = "terra legs", chance = 420},
	{name = "terra amulet", chance = 4060},
	{name = "hunting horn", chance = 4060},
	{name = "ultimate health potion", chance = 9290, maxCount = 20},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -50, maxDamage = -120},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
