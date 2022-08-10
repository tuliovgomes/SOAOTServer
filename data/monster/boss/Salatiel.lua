local mType = Game.createMonsterType("Salatiel")
local monster = {}

monster.name = "Salatiel"
monster.description = "Salatiel"
monster.experience = 6000000
monster.outfit = {
	lookType = 268,
	lookHead = 42,
	lookBody = 114,
	lookLegs = 82,
	lookFeet = 94,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 155550
monster.maxHealth = 155550
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 3058
monster.speed = 870
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 70
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
	staticAttackChance = 78,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 85},
	{type = COMBAT_ENERGYDAMAGE, percent = 90},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 90},
	{type = COMBAT_DEATHDAMAGE , percent = 85}
}

monster.attacks = {
	{name ="melee", interval = 5000, chance = 100, minDamage = -1045, maxDamage = -3050},
	{name ="combat", interval = 2500, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -2200, maxDamage = -4800, range = 8, radius = 2, target = true, shootEffect = CONST_ANI_SPEAR},
	{name ="melee", interval = 4000, chance = 100, minDamage = -1280, maxDamage = -4955}
}

monster.defenses = {
	defense = 70,
	armor = 70,
	{name ="combat", interval = 9000, chance = 70, type = COMBAT_HEALING, minDamage = 3002, maxDamage = 9008, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 11296, chance = 1004, description = "Zenit helmet"},
	{id = 2425, chance = 605, description = "aiglos"},
	{id = 8906, chance = 906, description = "cerberus shield"},
	{id = 6528, chance = 507, description = "narsil"}
}

mType:register(monster)
