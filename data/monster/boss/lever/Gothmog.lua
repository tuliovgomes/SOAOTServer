local mType = Game.createMonsterType("Gothmog")
local monster = {}

monster.name = "Gothmog"
monster.description = "Gothmog"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 38,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 70000
monster.maxHealth = 70000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 6068
monster.speed = 380
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
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
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
	{text = "Vou ti comer.", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 35},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 125, attack = 115},
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -1000, maxDamage = -2199, length = 7, spread = 0, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 55,
	armor = 60,
	{name ="combat", interval = 300, chance = 14, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 4, speed = {min = 500, max = 500}, duration = 7000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", minCount = 1, maxCount = 5, chance = 100000},
	{name = "crystal coin", minCount = 1, maxCount = 5, chance = 50000},
	{name = "supreme health potion", minCount = 10, maxCount = 80, chance = 45000},
	{name = "ultimate mana potion", minCount = 10, maxCount = 60, chance = 42000},
	{name = "ultimate spirit potion", minCount = 0, maxCount = 88, chance = 42000},
}

mType:register(monster)
