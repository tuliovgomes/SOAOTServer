local mType = Game.createMonsterType("Son of Ancalagon")
local monster = {}

monster.name = "Son of Ancalagon"
monster.description = "Son of Ancalagon"
monster.experience = 10000
monster.outfit = {
	lookType = 239,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
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
	{name = "amulet of loss", chance = 3400},
	{name = "wand of everblazing", chance = 2900},
	{name = "terra rod", chance = 24000, maxCount = 3},
	{name = "winged helmet", chance = 1800},
	{name = "platinum coin", chance = 100000, maxCount = 90},
	{name = "small amethyst", chance = 33500, maxCount = 20},
	{name = "small ruby", chance = 33500, maxCount = 50},
	{name = "small sapphire", chance = 33500},
	{name = "small topaz", chance = 33500},
	{name = "small diamond", chance = 33500},
}

mType:register(monster)
