local mType = Game.createMonsterType("smaug")
local monster = {}

monster.name = "Smaug"
monster.description = "Smaug"
monster.experience = 100000
monster.outfit = {
	lookType = 204,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 94500
monster.maxHealth = 94500
monster.runHealth = 300
monster.race = "fire"
monster.corpse = 5984
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
	{text = "ZCHHHHH", yell = true},
	{text = "I WILL SET THE WORLD IN FIRE!", yell = true},
	{text = "I WILL PROTECT MY BROOD!", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 45},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 135, attack = 135},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -1250, maxDamage = -1950, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 6, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_FIREDAMAGE, minDamage = -1250, maxDamage = -1750, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
	armor = 35,
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_HEALING, minDamage = 300, maxDamage = 410, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 36},
	{id = 2148, chance = 100000, maxCount = 87},
	{id = 2148, chance = 100000, maxCount = 17},
	{id = 2148, chance = 100000, maxCount = 69},
	{id = 2148, chance = 100000, maxCount = 25},
	{id = 2148, chance = 100000, maxCount = 59},
	{id = 2148, chance = 100000, maxCount = 54},
	{id = 2148, chance = 100000, maxCount = 94},
	{id = 1987, chance = 100000, description = "bag", child = {
			{id = 2469, chance = 1160},
			{id = 2492, chance = 1060},
			{id = 3968, chance = 1600},
			{id = 2522, chance = 800}
		}
	}
}

mType:register(monster)
