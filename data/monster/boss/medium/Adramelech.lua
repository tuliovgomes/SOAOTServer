local mType = Game.createMonsterType("Adramelech")
local monster = {}

monster.name = "Adramelech"
monster.description = "Adramelech"
monster.experience = 30000
monster.outfit = {
	lookType = 12,
	lookHead = 19,
	lookBody = 104,
	lookLegs = 96,
	lookFeet = 96,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 90000
monster.maxHealth = 90000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 6068
monster.speed = 380
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	rewardBoss = true,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
	targetDistance = 1,
	healthHidden = false,
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
	{text = "Vou ti comer.", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 55},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 35},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 155, attack = 215},
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -2000, maxDamage = -3199, range = 7, radius = 7, target = false, length = 7, spread = 0, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 55,
	armor = 60,
	{name ="combat", interval = 300, chance = 14, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 4, speed = {min = 500, max = 500}, duration = 7000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "great shield", chance = 1001},
	{name = "golden armor", chance = 1001},
	{name = "small diamond", chance = 25000, maxCount = 5},
	{name = "small sapphire", chance = 25000, maxCount = 10},
	{name = "small emerald", chance = 25000, maxCount = 10},
	{name = "small amethyst", chance = 25000, maxCount = 17},
	{name = "magic plate armor", chance = 1200},
	{name = "demon shield", chance = 2000},
	{name = "steel boots", chance = 3000},
	{name = "mastermind shield", chance = 1500},
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
