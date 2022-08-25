local mType = Game.createMonsterType("licantropo")
local monster = {}

monster.name = "licantropo"
monster.description = "a licantropo"
monster.experience = 291600
monster.outfit = {
	lookType = 308,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 180000
monster.maxHealth = 180000
monster.runHealth = 5000
monster.race = "undead"
monster.corpse = 6080
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 100,
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
	chance = 8,
	{text = "kkkkkkkkkkkkkkkkk", yell = true},
	{text = "ja era seus fracotes!!!", yell = true},
	{text = "ai se eu te pego costela de porco", yell = true},
	{text = "delicia", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1500, maxDamage = -2000},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -3200, maxDamage = -5500, range = 7, radius = 7, target = false, effect = CONST_ME_HITBYFIRE},
	{name ="combat", interval = 3500, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -2500, maxDamage = -6000, range = 7, radius = 7, target = false, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="speed", interval = 4000, chance = 80, speed = {min = 100, max = 100}, duration = 2000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 1
monster.summons = {
	{name = "Wolf", chance = 10, interval = 2000}
}

monster.loot = {
	{name = "golden armor", chance = 1600},
	{name = "great shield", chance = 301},
	{name = "gandalf ring", chance = 1200},
	{name = "magic steel helmet", chance = 1702},
	{name = "winged boots", chance = 1200},
	{name = "pharaoh sword", chance = 1800},
	{id = 6529, chance = 1900},
}

mType:register(monster)
