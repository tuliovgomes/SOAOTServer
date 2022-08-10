local mType = Game.createMonsterType("Lord of the Elements")
local monster = {}

monster.name = "Lord of the Elements"
monster.description = "Lord of the Elements"
monster.experience = 550000
monster.outfit = {
	lookType = 242,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 200000
monster.maxHealth = 200000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 8966
monster.speed = 350
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
	targetDistance = 3,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 70},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1200, maxDamage = -1580},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -3100, radius = 8, target = false, effect = CONST_ME_GIANTICE},
	{name ="combat", interval = 2500, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -2050, maxDamage = -3150, length = 8, spread = 3, effect = CONST_ME_FIREATTACK},
	{name ="combat", interval = 1500, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -3100, radius = 7, target = false, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 1200, chance = 40, type = COMBAT_ENERGYDAMAGE, minDamage = -2000, maxDamage = -3099, radius = 3, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -3000, maxDamage = -3599, radius = 3, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY},
	{name ="combat", interval = 1600, chance = 1000, type = COMBAT_ICEDAMAGE, minDamage = -1000, maxDamage = 3200, range = 7, effect = CONST_ME_ICETORNADO}
}

monster.defenses = {
	defense = 23,
	armor = 17,
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Azazel"},
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Achilles"},
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Baalrog"},
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Gaz'Haragoth"},
	{name ="invisible", interval = 10000, chance = 30, duration = 1000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{id = 11237, chance = 100000, description = "bp", child = {
			{id = 2123, chance = 3300, description = "rots"},
			{id = 2091, chance = 2000, description = "gkey"},
			{id = 2646, chance = 1200, description = "golden boots"},
			{id = 8889, chance = 1400, description = "Khel Thuzads Skin"},
			{id = 2523, chance = 900, description = "blessed shield"},
			{id = 11296, chance = 820, description = "zenit helmet"},
			{id = 11298, chance = 1803, description = "Zenit Legs"},
			{id = 11295, chance = 1802, description = "Zenit cuirass"},
			{id = 8907, chance = 1801, description = "permafrost shield"}
		}
	}
}

mType:register(monster)
