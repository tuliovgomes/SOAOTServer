local mType = Game.createMonsterType("shyvana")
local monster = {}

monster.name = "shyvana"
monster.description = "a shyvana"
monster.experience = 181600
monster.outfit = {
	lookType = 139,
	lookHead = 94,
	lookBody = 79,
	lookLegs = 77,
	lookFeet = 96,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 90000
monster.maxHealth = 90000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6081
monster.speed = 2370
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
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
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 100, attack = 115},
	{name ="combat", interval = 1500, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -2000, maxDamage = -3099, range = 7, radius = 7, target = false, length = 7, spread = 0, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -2899, radius = 2, target = true, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 30, maxDamage = 55, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 6529, chance = 900},
	{name = "great shield", chance = 1201},
	{name = "demon helmet", chance = 900},
	{name = "demon armor", chance = 702},
	{name = "demon legs", chance = 600},
	{name = "winged boots", chance = 1800},
	{name = "winged helmet", chance = 1800},
	{name = "amulet of loss", chance = 2100},
}

mType:register(monster)
