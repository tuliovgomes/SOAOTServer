local mType = Game.createMonsterType("soul reaper")
local monster = {}

monster.name = "Soul Reaper"
monster.description = "Soul Reaper"
monster.experience = 190500
monster.outfit = {
	lookType = 309,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 185225
monster.maxHealth = 185225
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 570
monster.summonCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 20
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
	{text = "You are dead", yell = false},
	{text = "Afoga o ganso", yell = false},
	{text = "divagar pra nao machucar", yell = false},
	{text = "vcs conhecem os meus amiguinhos soul burners?", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
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
	{name ="melee", interval = 2000, chance = 100, skill = 135, attack = 175},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -1560, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -1850, range = 7, effect = CONST_ME_STUN},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -1900, maxDamage = -1940, range = 7, effect = CONST_ME_HOLYDAMAGE},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -1000, maxDamage = -2199, length = 7, spread = 0, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -1150, maxDamage = -2250, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_GROUNDSHAKER},
	{name ="speed", interval = 1000, chance = 10, speed = {min = -900, max = -900}, duration = 20000, range = 7, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 26,
	armor = 13,
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 1000, effect = CONST_ME_ENERGYHIT}
}

monster.maxSummons = 3
monster.summons = {
	{name = "soul Burner", chance = 20, interval = 1000}
}

monster.loot = {
	{id = 2672, chance = 25000, maxCount = 100, description = "dragom ham"},
	{id = 2672, chance = 25000, maxCount = 100, description = "dragom ham"},
	{id = 1987, chance = 100000, description = "bag", child = {
			{id = 2472, chance = 6900, description = "magic plate armor"},
			{id = 11301, chance = 5802, description = "chaos blade"},
			{id = 11295, chance = 3803, description = "zenit cuirass"},
			{id = 2470, chance = 3300},
			{id = 11296, chance = 2520, description = "zenit helmet"},
			{id = 9777, chance = 2502, description = "Valar kilt"},
			{id = 9932, chance = 1901, description = "firewalker boots"},
			{id = 6433, chance = 1800, description = "necromancer shield"},
			{id = 2173, chance = 9000, description = "aol"}
		}
	}
}

mType:register(monster)
