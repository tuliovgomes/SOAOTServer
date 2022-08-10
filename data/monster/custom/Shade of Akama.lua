local mType = Game.createMonsterType("Shade of Akama")
local monster = {}

monster.name = "Shade of Akama"
monster.description = "a Shade of Akama"
monster.experience = 30500
monster.outfit = {
	lookType = 145,
	lookHead = 60,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 20035
monster.maxHealth = 20035
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 390
monster.summonCost = 490

monster.changeTarget = {
	interval = 6000,
	chance = 10
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 5,
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
	interval = 10000,
	chance = 5,
	{text = "help", yell = false},
	{text = "to kil me?.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 35},
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 135, attack = 135},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -700, maxDamage = -860, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -600, maxDamage = -990, range = 10, radius = 7, target = false, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 6, type = COMBAT_MANADRAIN, minDamage = -406, maxDamage = -532, range = 10, radius = 9, target = false, effect = CONST_ME_MAGIC_GREEN}
}

monster.defenses = {
	defense = 25,
	armor = 24
}

monster.maxSummons = 5
monster.summons = {
	{name = "Spectre", chance = 50, interval = 1000}
}

monster.loot = {
	{name = "small emerald", chance = 50000, maxCount = 40},
	{name = "small sapphire", chance = 50000, maxCount = 36},
	{name = "divine plate", chance = 900},
	{name = "golden legs", chance = 702},
	{name = "winged helmet", chance = 1800},
	{name = "ring of the sky", chance = 2100},
}

mType:register(monster)
