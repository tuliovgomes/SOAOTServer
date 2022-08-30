local mType = Game.createMonsterType("High Elf")
local monster = {}

monster.name = "High Elf"
monster.description = "a High Elf"
monster.experience = 7000
monster.outfit = {
	lookType = 203,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4200
monster.maxHealth = 4200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 4160
monster.speed = 340
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
	canPushCreatures = true,
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
	{text = "You desecrated this temple!", yell = false},
	{text = "Noone will stop my ascension!", yell = false},
	{text = "My powers are divine!", yell = false},
	{text = "Muahahaha!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 130, attack = 128},
	{name ="combat", interval = 1700, chance = 22, type = COMBAT_HOLYDAMAGE, minDamage = -200, maxDamage = -390, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA}
}

monster.defenses = {
	defense = 25,
	armor = 15,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 90, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 7, speed = {min = 300, max = 300}, duration = 10000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "aghanim legs", chance = 2100},
	{name = "gold coin", chance = 37000, maxCount = 47},
	{name = "yellow gem", chance = 50},
	{name = "aghanim robe", chance = 970},
	{name = "elven amulet", chance = 1999},
	{name = "blank rune", chance = 18000},
	{name = "arrow", chance = 6000, maxCount = 3},
	{name = "aghanim mask", chance = 950},
	{name = "green tunic", chance = 7000},
	{name = "bread", chance = 14000},
	{name = "aghanim boots", chance = 880},
	{name = "strong mana potion", chance = 3000},
	{name = "health potion", chance = 4000},
	{name = "elvish talisman", chance = 10000},
}

mType:register(monster)
