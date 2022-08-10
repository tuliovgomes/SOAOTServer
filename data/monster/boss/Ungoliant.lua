local mType = Game.createMonsterType("Ungoliant")
local monster = {}

monster.name = "Ungoliant"
monster.description = "Ungoliant"
monster.experience = 80000
monster.outfit = {
	lookType = 38,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 78000
monster.maxHealth = 78000
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
	{type = COMBAT_ENERGYDAMAGE, percent = 55},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1030, maxDamage = -1300, condition = {type = CONDITION_POISON, startDamage = 100, interval = 4000}},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -515, maxDamage = -835, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -599, length = 7, spread = 0, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="speed", interval = 1000, chance = 6, speed = {min = 290, max = 290}, duration = 20000}
}

monster.maxSummons = 4
monster.summons = {
	{name = "laracna", chance = 20, interval = 1000, max = 4}
}

monster.loot = {
	{id = 2152, chance = 100000, maxCount = 70},
	{id = 2493, chance = 1},
	{id = 2348, chance = 1},
	{id = 2536, chance = 10400},
	{id = 1987, chance = 100000, child = {
			{id = 2152, chance = 100000, maxCount = 50},
			{id = 2152, chance = 5000, maxCount = 20},
			{id = 8880, chance = 3300},
			{id = 8882, chance = 6011},
			{id = 2195, chance = 6300}
		}
	}
}

mType:register(monster)
