local mType = Game.createMonsterType("Chaos Draco")
local monster = {}

monster.name = "Chaos Draco"
monster.description = "a Chaos Draco"
monster.experience = 5500
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 9350
monster.maxHealth = 9350
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6306
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
	{text = "Link Park Forever!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 55}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 105, attack = 105},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -310, maxDamage = -370, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -350, length = 7, spread = 0, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 30,
	armor = 35
}

monster.loot = {
	{name = "golden mug", chance = 6002},
	{name = "black pearl", chance = 22780, maxCount = 2},
	{name = "small sapphire", chance = 28370, maxCount = 2},
	{name = "gold coin", chance = 35500, maxCount = 100},
	{name = "gold coin", chance = 55500, maxCount = 98},
	{name = "platinum coin", chance = 52000, maxCount = 5},
	{name = "life crystal", chance = 2500},
	{name = "war axe", chance = 1290},
	{name = "golden armor", chance = 860},
	{name = "knight armor", chance = 5500},
	{name = "royal helmet", chance = 1720},
	{name = "power bolt", chance = 15190, maxCount = 15},
	{name = "hardened bone", chance = 14180},
	{id = 6299, chance = 1150},
	{name = "demonic essence", chance = 12460},
	{name = "assassin star", chance = 26650, maxCount = 5},
	{name = "dragon slayer", chance = 860},
	{name = "dragonbone staff", chance = 4000},
	{name = "great mana potion", chance = 21490},
	{name = "great health potion", chance = 21200},
	{name = "divine plate", chance = 430},
	{name = "gold ingot", chance = 570},
	{name = "unholy bone", chance = 33380},
	{name = "spellweaver's robe", chance = 860}
}

mType:register(monster)
