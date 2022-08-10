local mType = Game.createMonsterType("Ancalagon")
local monster = {}

monster.name = "Ancalagon"
monster.description = "ancalagon"
monster.experience = 60000
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150000
monster.maxHealth = 150000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6306
monster.speed = 200
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
	illusionable = true,
	boss = false,
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
	{text = "FEEEED MY ETERNAL HUNGER!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 45},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 125, attack = 125},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -1495, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -1300, range = 7, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -520, maxDamage = -1090, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -750, maxDamage = -1080, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 4000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -700, maxDamage = -1100, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 23, type = COMBAT_EARTHDAMAGE, minDamage = -600, maxDamage = -1685, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -1600, length = 8, spread = 3, effect = CONST_ME_MAGIC_GREEN}
}

monster.defenses = {
	defense = 30,
	armor = 35
}

monster.maxSummons = 4
monster.summons = {
	{name = "dragon", chance = 20, interval = 1000, max = 2},
	{name = "dragon lord", chance = 17, interval = 1000, max = 1},
	{name = "dragon lord", chance = 15, interval = 1000, max = 1}
}

monster.loot = {
	{id = 2152, chance = 100000, maxCount = 100},
	{id = 2152, chance = 100000, maxCount = 100},
	{id = 2152, chance = 100000, maxCount = 100},
	{id = 2493, chance = 300},
	{id = 5741, chance = 1367},
	{id = 2646, chance = 800},
	{id = 1987, chance = 100000, child = {
			{id = 2152, chance = 100000},
			{id = 2150, chance = 5000, maxCount = 3},
			{id = 7894, chance = 1838},
			{id = 2520, chance = 900},
			{id = 7898, chance = 800},
			{id = 2408, chance = 1444}
		}
	}
}

mType:register(monster)
