local mType = Game.createMonsterType("Avari Leader")
local monster = {}

monster.name = "Avari Leader"
monster.description = "Avari Leader"
monster.experience = 60000
monster.outfit = {
	lookType = 63,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 180016
monster.maxHealth = 180016
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6011
monster.speed = 530
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{text = "Feel my wrath!", yell = false},
	{text = "For the Daughter of the Stars!", yell = false},
	{text = "I'll bring balance upon you!", yell = false},
	{text = "Tha'shi Cenath!", yell = false},
	{text = "Vihil Ealuel!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = 75}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 125, attack = 110},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -700, maxDamage = -1045, range = 7, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_STUN},
	{name ="combat", interval = 1000, chance = 22, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -1090, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_HOLYDAMAGE, minDamage = -900, maxDamage = -1000, length = 6, spread = 4, effect = CONST_ME_HOLYAREA},
	{name ="combat", interval = 1000, chance = 22, type = COMBAT_HOLYDAMAGE, minDamage = -800, maxDamage = -1090, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 42, maxDamage = 68, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2152, chance = 100000, maxCount = 100},
	{id = 2474, chance = 1444},
	{id = 2505, chance = 1800},
	{id = 1987, chance = 100000, child = {
			{id = 2152, chance = 100000, maxCount = 100},
			{id = 2152, chance = 100000, maxCount = 100},
			{id = 2470, chance = 800},
			{id = 2507, chance = 1900},
			{id = 7893, chance = 1300}
		}
	}
}

mType:register(monster)
