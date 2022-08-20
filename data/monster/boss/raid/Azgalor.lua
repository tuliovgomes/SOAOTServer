local mType = Game.createMonsterType("Azgalor")
local monster = {}

monster.name = "Azgalor"
monster.description = "Azgalor"
monster.experience = 800000
monster.outfit = {
	lookType = 244,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 230700
monster.maxHealth = 230700
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6336
monster.speed = 390
monster.summonCost = 0

monster.changeTarget = {
	interval = 10000,
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
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 150, attack = 150},
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1080, maxDamage = -3260, range = 7, shootEffect = CONST_ANI_LARGEROCK},
	{name ="combat", interval = 5000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -1150, maxDamage = -2250, range = 7, radius = 5, target = true, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_GROUNDSHAKER},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -1400, maxDamage = -1500, range = 3, effect = CONST_ME_STUN}
}

monster.defenses = {
	defense = 60,
	armor = 60,
	{name ="speed", interval = 1000, chance = 12, speed = {min = 440, max = 440}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 0
monster.summons = {
	{name = "juggernaut", chance = 30, interval = 10500}
}

monster.loot = {
	{id = 2148, chance = 1, maxCount = 100},
	{id = 2152, chance = 70000, maxCount = 90},
	{id = 2666, chance = 4, maxCount = 8},
	{id = 2393, chance = 1700},
	{id = 6500, chance = 9},
	{id = 11297, chance = 1000, child = {
			{id = 2148, chance = 1, maxCount = 100},
			{id = 11296, chance = 900},
			{id = 9777, chance = 800},
			{id = 5944, chance = 1}
		}
	}
}

mType:register(monster)
