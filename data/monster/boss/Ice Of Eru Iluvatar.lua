local mType = Game.createMonsterType("Ice Of Eru Iluvatar")
local monster = {}

monster.name = "Ice Of Eru Iluvatar"
monster.description = "Ice Of Eru Iluvatar"
monster.experience = 1000000
monster.outfit = {
	lookType = 11,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 115000
monster.maxHealth = 115000
monster.runHealth = 4900
monster.race = "undead"
monster.corpse = 8307
monster.speed = 980
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 65
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 50,
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
	interval = 4000,
	chance = 10,
	{text = "You shall face the wrath of the ocean!", yell = false},
	{text = "No sane human would dare to face me!", yell = false},
	{text = "Your lifeless bodies shall feed my spawns!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 70},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
}

monster.attacks = {
	{name ="melee", interval = 2900, chance = 100, minDamage = -1200, maxDamage = -1800},
	{name ="speed", interval = 2400, chance = 35, speed = {min = -450, max = -450}, duration = 10000, range = 7, effect = CONST_ME_GIANTICE},
	{name ="combat", interval = 2750, chance = 60, type = COMBAT_MANADRAIN, minDamage = -580, maxDamage = -1900, range = 7},
	{name ="combat", interval = 2100, chance = 85, type = COMBAT_ICEDAMAGE, minDamage = -3100, maxDamage = -4500, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA},
	{name ="combat", interval = 1500, chance = 75, type = COMBAT_ICEDAMAGE, minDamage = -1520, maxDamage = -2850, range = 7, radius = 5, target = true, shootEffect = CONST_ANI_ICE, effect = CONST_ME_GIANTICE},
	{name ="combat", interval = 3800, chance = 65, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -4000, length = 8, spread = 3, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 50,
	armor = 0,
	{name ="combat", interval = 4220, chance = 35, type = COMBAT_HEALING, minDamage = 2990, maxDamage = 4050}
}

monster.loot = {
	{id = 2145, chance = 500},
	{id = 7902, chance = 2900},
	{id = 8887, chance = 800},
	{id = 8878, chance = 3500},
	{id = 7730, chance = 1500},
	{id = 7892, chance = 2600},
	{id = 7893, chance = 1500},
	{id = 2396, chance = 4000},
	{id = 2445, chance = 2200},
	{id = 2542, chance = 2500},
	{id = 1987, chance = 100000, child = {
			{id = 2148, chance = 45000, maxCount = 98},
			{id = 2148, chance = 45000, maxCount = 98},
			{id = 2146, chance = 500}
		}
	}
}

mType:register(monster)
