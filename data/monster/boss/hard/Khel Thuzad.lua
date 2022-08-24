local mType = Game.createMonsterType("Khel Thuzad")
local monster = {}

monster.name = "Khel Thuzad"
monster.description = "Khel Thuzad"
monster.experience = 80000
monster.outfit = {
	lookType = 287,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150600
monster.maxHealth = 150600
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 8937
monster.speed = 270
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	rewardBoss = true,
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
	{text = "I challenge you!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 55},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -800, maxDamage = -1000},
	{name ="combat", interval = 3500, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -1300, maxDamage = -2400, range = 10, radius = 2, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1500, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -900, maxDamage = -2100, radius = 6, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -750, maxDamage = -2850, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_GROUNDSHAKER},
	{name ="combat", interval = 1500, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -1600, maxDamage = -3299, length = 7, spread = 0, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 2000, chance = 35, speed = {min = -400, max = -400}, duration = 20000, range = 7, radius = 3, target = false, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -1899, radius = 2, target = true, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 35,
	armor = 38,
	{name ="combat", interval = 3000, chance = 12, type = COMBAT_HEALING, minDamage = 300, maxDamage = 535, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 6000, chance = 25, duration = 2000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "great shield", chance = 1201},
	{name = "khel thuzad skin", chance = 900},
	{name = "zenit cuirass", chance = 1600},
	{name = "Valar kilt", chance = 802},
	{name = "aiglos", chance = 605},
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end


mType:register(monster)
