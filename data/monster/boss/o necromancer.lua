local mType = Game.createMonsterType("o necromancer")
local monster = {}

monster.name = "The Necromancer"
monster.description = "O Necromancer"
monster.experience = 90000
monster.outfit = {
	lookType = 9,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 180000
monster.maxHealth = 180000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 3058
monster.speed = 300
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -600},
	{name ="combat", interval = 2550, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -1800, range = 1, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2230, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -900, maxDamage = -2000, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_YELLOW_RINGS},
	{name ="condition", interval = 6200, chance = 20, type = CONDITION_POISON, startDamage = 65, tick = 2000, range = 7, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 2860, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2530, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -1050, maxDamage = -2150, range = 8, radius = 7, target = true, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 120,
	armor = 60,
	{name ="combat", interval = 800, chance = 100, type = COMBAT_HEALING, minDamage = 120, maxDamage = 150},
	{name ="invisible", interval = 6000, chance = 30, duration = 5000, effect = CONST_ME_POFF}
}

monster.maxSummons = 0
monster.summons = {
	{name = "banshee", chance = 25, interval = 3000, max = 2},
	{name = "blightwalker", chance = 15, interval = 2500, max = 1},
	{name = "warlock", chance = 13, interval = 3800, max = 1}
}

monster.loot = {
	{id = 2663, chance = 45000},
	{id = 2138, chance = 1500},
	{id = 2495, chance = 1900},
	{id = 2493, chance = 1800},
	{id = 2494, chance = 1000},
	{id = 8865, chance = 1300},
	{id = 2640, chance = 1200},
	{id = 2514, chance = 1000},
	{id = 7407, chance = 1500},
	{id = 7451, chance = 3500},
	{id = 2365, chance = 100000, child = {
			{id = 2152, chance = 4200, maxCount = 25},
			{id = 2152, chance = 2200, maxCount = 25},
			{id = 2144, chance = 3500, maxCount = 15},
			{id = 5930, chance = 2000, maxCount = 10},
			{id = 4863, chance = 3000},
			{id = 2804, chance = 35000, maxCount = 3},
			{id = 5944, chance = 4500},
			{id = 6433, chance = 1500},
			{id = 2197, chance = 2000},
			{id = 2197, chance = 2000},
			{id = 5809, chance = 1400}
		}
	}
}

mType:register(monster)
