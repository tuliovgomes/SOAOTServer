local mType = Game.createMonsterType("Scatha")
local monster = {}

monster.name = "Scatha"
monster.description = "scatha"
monster.experience = 40000
monster.outfit = {
	lookType = 248,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 40000
monster.maxHealth = 40000
monster.runHealth = 300
monster.race = "undead"
monster.corpse = 7091
monster.speed = 310
monster.summonCost = 390

monster.changeTarget = {
	interval = 2000,
	chance = 50
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 0,
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
	interval = 3000,
	chance = 200,
	{text = "CHHHRRRR", yell = false},
	{text = "HISSSS", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 90},
	{type = COMBAT_HOLYDAMAGE , percent = 70},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, skill = 105, attack = 105},
	{name ="combat", interval = 900, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -750, length = 7, spread = 3, effect = CONST_ME_POFF},
	{name ="speed", interval = 1000, chance = 11, speed = {min = -550, max = -550}, duration = 10000, length = 7, spread = 3, effect = CONST_ME_ICEATTACK},
	{name ="combat", interval = 900, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -680, radius = 4, target = true, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEAREA},
	{name ="combat", interval = 800, chance = 22, type = COMBAT_ICEDAMAGE, minDamage = -400, maxDamage = -560, radius = 3, target = false, effect = CONST_ME_ICETORNADO},
	{name ="speed", interval = 1000, chance = 11, speed = {min = -500, max = -500}, duration = 10000, radius = 3, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -1000, maxDamage = -1100, radius = 8, target = false, effect = CONST_ME_GIANTICE}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 150, maxDamage = 210, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2152, chance = 100000, maxCount = 100},
	{id = 2396, chance = 99444},
	{id = 7407, chance = 2000},
	{id = 2536, chance = 2400},
	{id = 1987, chance = 100000, child = {
			{id = 2152, chance = 100000},
			{id = 2150, chance = 5000, maxCount = 3},
			{id = 7898, chance = 2300},
			{id = 7895, chance = 3011},
			{id = 6132, chance = 1300}
		}
	}
}

mType:register(monster)
