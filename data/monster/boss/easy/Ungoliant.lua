local mType = Game.createMonsterType("Ungoliant")
local monster = {}

monster.name = "Ungoliant"
monster.description = "Ungoliant"
monster.experience = 20000
monster.outfit = {
	lookType = 38,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 78000
monster.maxHealth = 78000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5977
monster.speed = 300
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
	staticAttackChance = 90,
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
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1030, maxDamage = -1300, condition = {type = CONDITION_POISON, startDamage = 100, interval = 4000}},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -515, maxDamage = -835, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -599, length = 7, spread = 0, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="speed", interval = 1000, chance = 6, speed = {min = 290, max = 290}, duration = 20000}
}

monster.maxSummons = 4
monster.summons = {
	{name = "laracna", chance = 20, interval = 1000, max = 4}
}

monster.loot = {
	{name = "terra boots", chance = 1350},
	{name = "terra hood", chance = 1600},
	{name = "diamond sceptre", chance = 1600},
	{name = "terra mantle", chance = 1250},
	{name = "terra legs", chance = 1250},
	{name = "terra amulet", chance = 1500},
	{name = "knight armor", chance = 1840},
	{name = "medusa shield", chance = 3040},
	{name = "ultimate health potion", chance = 9290, maxCount = 80},
	{name = "gold coin", chance = 100000, maxCount = 200},
	{name = "platinum coin", chance = 999900, maxCount = 60},
	{name = "mushroom pie", chance = 17130, maxCount = 30},
	{name = "great mana potion", chance = 4960, maxCount = 80},
	{name = "great health potion", chance = 4950, maxCount = 90},
	{name = "strong mana potion", chance = 4930, maxCount = 70},
	{name = "angelic axe", chance = 1420},
	{name = "muck rod", chance = 1640},
	{name = "mushroom backpack", chance = 3020},
	{name = "mycological bow", chance = 840}
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
