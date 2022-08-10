local mType = Game.createMonsterType("istari follower")
local monster = {}

monster.name = "istari follower"
monster.description = "a istari follower"
monster.experience = 20500
monster.outfit = {
	lookType = 309,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15225
monster.maxHealth = 15225
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 18266
monster.speed = 370
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
	canPushCreatures = false,
	staticAttackChance = 90,
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
	interval = 5000,
	chance = 10,
	{text = "You have disturbed my thoughts!", yell = false},
	{text = "Let me turn you into something more useful!", yell = false},
	{text = "Let me taste your brain!", yell = false},
	{text = "You will be punished!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 9},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 90},
	{type = COMBAT_HOLYDAMAGE , percent = 90},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 60, attack = 55},
	{name ="combat", interval = 1000, chance = 22, type = COMBAT_FIREDAMAGE, minDamage = -400, maxDamage = -590, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_EXPLOSIONAREA},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -590, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -300, maxDamage = -640, range = 7, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -567, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name ="speed", interval = 1000, chance = 10, speed = {min = -600, max = -600}, duration = 20000, range = 7, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 26,
	armor = 13,
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 0, maxDamage = 1, effect = CONST_ME_ENERGYHIT}
}

monster.maxSummons = 1
monster.summons = {
	{name = "stone golem", chance = 10, interval = 1000}
}

monster.loot = {
	{name = "small ruby", chance = 50000, maxCount = 40},
	{name = "small diamond", chance = 50000, maxCount = 36},
	{id = 9019, chance = 200},
	{name = "magic plate armor", chance = 1001},
	{name = "valar mask", chance = 100},
	{name = "Valar kilt", chance = 302},
	{name = "valar plate", chance = 250},
	{name = "pharaoh sword", chance = 1800},
	{name = "amulet of loss", chance = 1900},
}

mType:register(monster)
