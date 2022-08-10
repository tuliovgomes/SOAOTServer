local mType = Game.createMonsterType("Aleister Crowler")
local monster = {}

monster.name = "Aleister Crowler"
monster.description = "a Aleister Crowler"
monster.experience = 216600
monster.outfit = {
	lookType = 23,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 135500
monster.maxHealth = 135500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5981
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
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
	interval = 2000,
	chance = 5,
	{text = "Avada Kedravra!!!!!!!!!", yell = true},
	{text = "Expeliarmus!!!!!!!!!!", yell = true},
	{text = "Sectun Sempra!!!!!!!!!", yell = true},
	{text = "Cruciatus!!!!", yell = true},
	{text = "Imperia!!!!!", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1500, maxDamage = -2600},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -2600, range = 7, radius = 7, target = false, effect = CONST_ME_HITBYFIRE},
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -1000, maxDamage = -1500, range = 7, radius = 7, target = false, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 4000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -1500, maxDamage = -3000, range = 7, radius = 6, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 5000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -3500, range = 7, radius = 6, target = false, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="speed", interval = 4000, chance = 80, speed = {min = 200, max = 200}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 5
monster.summons = {
	{name = "Minotaur Mage", chance = 10, interval = 2000}
}

monster.loot = {
	{chance = 6900, name = "magic plate armor"},
	{chance = 5802, name = "pharaoh sword"},
	{chance = 804, name = "golden legs"},
	{chance = 703, name = "golden helmet"},
	{chance = 902, name = "golden boots"}
}

mType:register(monster)
