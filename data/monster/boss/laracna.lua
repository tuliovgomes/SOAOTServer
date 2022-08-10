local mType = Game.createMonsterType("laracna")
local monster = {}

monster.name = "laracna"
monster.description = "laracna"
monster.experience = 90000
monster.outfit = {
	lookType = 38,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 20000
monster.maxHealth = 20000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5977
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 120, attack = 120},
	{name ="poisonfield", interval = 1000, chance = 13, minDamage = -300, maxDamage = -400, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -300, range = 7, shootEffect = CONST_ANI_EARTH},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -400, range = 7, shootEffect = CONST_ANI_EARTH}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="speed", interval = 1000, chance = 6, speed = {min = 290, max = 290}, duration = 20000}
}

monster.maxSummons = 1
monster.summons = {
	{name = "giant spider", chance = 20, interval = 1000, max = 1}
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 60},
	{id = 2463, chance = 4000},
	{id = 2171, chance = 800},
	{id = 2459, chance = 20000},
	{id = 5879, chance = 5000},
	{id = 7901, chance = 1777},
	{id = 1987, chance = 100000, child = {
			{id = 2545, chance = 8000, maxCount = 13},
			{id = 2148, chance = 100000, maxCount = 50},
			{id = 2457, chance = 5000},
			{id = 2476, chance = 2500},
			{id = 2477, chance = 1500},
			{id = 2478, chance = 1000},
			{id = 2169, chance = 2900}
		}
	}
}

mType:register(monster)
