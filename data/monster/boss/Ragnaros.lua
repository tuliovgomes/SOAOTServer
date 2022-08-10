local mType = Game.createMonsterType("Ragnaros")
local monster = {}

monster.name = "Ragnaros"
monster.description = "Ragnaros"
monster.experience = 280000
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 184000
monster.maxHealth = 184000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 8964
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
	{type = COMBAT_ENERGYDAMAGE, percent = 65},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = 75}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 120, attack = 100, condition = {type = CONDITION_FIRE, startDamage = 0, interval = 9000}},
	{name ="firefield", interval = 2000, chance = 15, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1000, length = 10, spread = 3, effect = CONST_ME_FIREATTACK},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -2450, radius = 4, target = false, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 19, type = COMBAT_FIREDAMAGE, minDamage = -910, maxDamage = -2015, range = 7, radius = 5, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.maxSummons = 4
monster.summons = {
	{name = "spirit of fire", chance = 20, interval = 1000, max = 2},
	{name = "spirit of fire", chance = 17, interval = 1000, max = 1},
	{name = "spirit of fire", chance = 15, interval = 1000, max = 1}
}

monster.loot = {
	{id = 2160, chance = 100000, maxCount = 10},
	{id = 2152, chance = 8888, maxCount = 4},
	{id = 9932, chance = 1500},
	{id = 2432, chance = 1900},
	{id = 2392, chance = 1900},
	{id = 2187, chance = 1900},
	{id = 8886, chance = 1500},
	{id = 8867, chance = 1810},
	{id = 2421, chance = 1810},
	{id = 2495, chance = 1810}
}

mType:register(monster)
