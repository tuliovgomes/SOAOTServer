local mType = Game.createMonsterType("Son of Ancalagon")
local monster = {}

monster.name = "Son of Ancalagon"
monster.description = "Son of Ancalagon"
monster.experience = 30000
monster.outfit = {
	lookType = 239,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 6302
monster.speed = 315
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
	{text = "Shiiiiiek", yell = true}
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
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 100, attack = 80, condition = {type = CONDITION_POISON, startDamage = 220, interval = 4000}},
	{name ="condition", interval = 3000, chance = 18, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -700, maxDamage = -750, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="melee", interval = 2000, chance = 12, minDamage = -630, maxDamage = -720},
	{name ="drunk", interval = 4000, chance = 2, drunkenness = 25, duration = 10000, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SOUND_RED}
}

monster.defenses = {
	defense = 1,
	armor = 5,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 100, maxDamage = 560, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2148, chance = 1000, maxCount = 67},
	{id = 2173, chance = 2000, maxCount = 67},
	{id = 2672, chance = 2000, maxCount = 3},
	{id = 2547, chance = 1670, maxCount = 3},
	{id = 2647, chance = 2000},
	{id = 7408, chance = 2000},
	{id = 1987, chance = 100000, child = {
			{id = 2127, chance = 1808},
			{id = 2655, chance = 4000, maxCount = 67},
			{id = 2195, chance = 3000, maxCount = 67},
			{id = 2474, chance = 2000, maxCount = 67},
			{id = 2187, chance = 1110},
			{id = 2146, chance = 1000, maxCount = 10}
		}
	}
}

mType:register(monster)
