local mType = Game.createMonsterType("Bloodboil")
local monster = {}

monster.name = "Bloodboil"
monster.description = "a Bloodboil"
monster.experience = 19500
monster.outfit = {
	lookType = 130,
	lookHead = 58,
	lookBody = 59,
	lookLegs = 109,
	lookFeet = 79,
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
	{name ="melee", interval = 1000, chance = 100, skill = 125, attack = 100},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -745, range = 7, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_HOLYAREA},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -790, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA},
	{name ="combat", interval = 3000, chance = 6, type = COMBAT_MANADRAIN, minDamage = -456, maxDamage = -792, range = 10, radius = 9, target = false, effect = CONST_ME_MAGIC_GREEN}
}

monster.defenses = {
	defense = 25,
	armor = 24
}

monster.loot = {
	{name = "small ruby", chance = 50000, maxCount = 40},
	{name = "small diamond", chance = 50000, maxCount = 36},
	{name = "molten plate", chance = 900},
	{name = "magma legs", chance = 702},
	{name = "winged helmet", chance = 1800},
	{name = "ring of the sky", chance = 2100},
}

mType:register(monster)
