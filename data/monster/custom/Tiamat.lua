local mType = Game.createMonsterType("Tiamat")
local monster = {}

monster.name = "Tiamat"
monster.description = "a Tiamat"
monster.experience = 281600
monster.outfit = {
	lookType = 351,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 230000
monster.maxHealth = 230000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 10445
monster.speed = 300
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
	interval = 1000,
	chance = 50,
	{text = "Tiamat.", yell = true},
	{text = "Tiamat.", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 25}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -2000, maxDamage = -5500},
	{name ="combat", interval = 1000, chance = 95, type = COMBAT_FIREDAMAGE, minDamage = -2500, maxDamage = -6500, range = 7, radius = 7, target = false, effect = CONST_ME_HITBYFIRE}
}

monster.defenses = {
	defense = 60,
	armor = 60,
	{name ="speed", interval = 4000, chance = 80, speed = {min = 100, max = 100}, duration = 20, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 1
monster.summons = {
	{name = "Son of Ancalagon", chance = 50, interval = 1000}
}

monster.loot = {
	{id = 6529, chance = 900},
	{name = "great shield", chance = 1201},
	{name = "khel thuzad skin", chance = 900},
	{id = 32635, chance = 202},
	{name = "zenit cuirass", chance = 1600},
	{name = "zenit helmet", chance = 1800},
	{name = "zenit legs", chance = 1800},
	{name = "zenit shoes", chance = 2100},
}

mType:register(monster)
