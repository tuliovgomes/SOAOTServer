local mType = Game.createMonsterType("Michael Jackson")
local monster = {}

monster.name = "Michael Jackson"
monster.description = "a michael"
monster.experience = 256600
monster.outfit = {
	lookType = 289,
	lookHead = 114,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 145500
monster.maxHealth = 145500
monster.runHealth = 1000
monster.race = "blood"
monster.corpse = 3128
monster.speed = 550
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	staticAttackChance = 30,
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -700, maxDamage = -900},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -1500},
	{name ="combat", interval = 3000, chance = 95, type = COMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -2100},
	{name ="combat", interval = 5000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = -1200, maxDamage = -1600, range = 10, radius = 7, target = false, effect = CONST_ME_MORTAREA},
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="Ultimate Healing", interval = 4000, chance = 5, minDamage = 3000, maxDamage = 5500}
}

monster.loot = {
	{name = "golden boots", chance = 900},
	{name = "great shield", chance = 1001},
	{name = "zenit helmet", chance = 900},
	{name = "Valar kilt", chance = 702},
	{name = "necromancer shield", chance = 600},
	{name = "pharaoh sword", chance = 1800},
	{name = "amulet of loss", chance = 100},
}

mType:register(monster)
