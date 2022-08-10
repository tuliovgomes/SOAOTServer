local mType = Game.createMonsterType("Gadrel")
local monster = {}

monster.name = "Gadrel"
monster.description = "Gadrel"
monster.experience = 150000
monster.outfit = {
	lookType = 278,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 114,
	lookFeet = 64,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 180000
monster.maxHealth = 180000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 3058
monster.speed = 650
monster.summonCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 50
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
	targetDistance = 3,
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
	{text = "Nos vemos no Inferno!", yell = false},
	{text = "Se renda ao poder de Sauron!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 70},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 65},
	{type = COMBAT_DEATHDAMAGE , percent = 90}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -800, maxDamage = -2500},
	{name ="sudden death rune", interval = 4500, chance = 10, minDamage = -3000, maxDamage = -4500, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -2000, maxDamage = -3500, range = 10, radius = 7, target = false, effect = CONST_ME_MORTAREA},
	{name ="speed", interval = 6000, chance = 12, speed = {min = -1850, max = -1850}, duration = 60000, radius = 6, target = false, effect = CONST_ME_MAGIC_GREEN},
	{name ="drunk", interval = 10000, chance = 8, drunkenness = 25, duration = 10000, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 120,
	armor = 60,
	{name ="combat", interval = 4800, chance = 100, type = COMBAT_HEALING, minDamage = 1201, maxDamage = 1500},
	{name ="invisible", interval = 6000, chance = 30, duration = 5000, effect = CONST_ME_POFF}
}

monster.maxSummons = 0
monster.summons = {
	{name = "banshee", chance = 25, interval = 3000, max = 2},
	{name = "blightwalker", chance = 15, interval = 2500, max = 1},
	{name = "warlock", chance = 13, interval = 3800, max = 1}
}

monster.loot = {
	{id = 2495, chance = 1900},
	{id = 2493, chance = 900},
	{id = 2494, chance = 800},
	{id = 8865, chance = 700},
	{id = 2640, chance = 1200},
	{id = 2514, chance = 1000},
	{id = 7407, chance = 900},
	{id = 7451, chance = 800},
	{id = 2365, chance = 100000, child = {
			{id = 2152, chance = 4200, maxCount = 25},
			{id = 2152, chance = 2200, maxCount = 25},
			{id = 6433, chance = 700},
			{id = 2197, chance = 900},
			{id = 2197, chance = 800}
		}
	}
}

mType:register(monster)
