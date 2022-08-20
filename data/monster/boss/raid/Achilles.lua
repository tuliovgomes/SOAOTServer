local mType = Game.createMonsterType("Achilles")
local monster = {}

monster.name = "Achilles"
monster.description = "Achilles"
monster.experience = 3000000
monster.outfit = {
	lookType = 134,
	lookHead = 38,
	lookBody = 132,
	lookLegs = 114,
	lookFeet = 132,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 185550
monster.maxHealth = 185550
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 6068
monster.speed = 870
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 70
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	rewardBoss = true,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 78,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 85},
	{type = COMBAT_ENERGYDAMAGE, percent = 90},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 75},
	{type = COMBAT_HOLYDAMAGE , percent = 90},
	{type = COMBAT_DEATHDAMAGE , percent = 85}
}

monster.attacks = {
	{name ="melee", interval = 5000, chance = 100, minDamage = -1045, maxDamage = -3050},
	{name ="combat", interval = 2500, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -2200, maxDamage = -4200, range = 8, radius = 5, target = true, shootEffect = CONST_ANI_SPEAR},
	{name ="melee", interval = 4000, chance = 100, minDamage = -1280, maxDamage = -3955}
}

monster.defenses = {
	defense = 70,
	armor = 70,
	{name ="combat", interval = 9000, chance = 70, type = COMBAT_HEALING, minDamage = 3002, maxDamage = 9008, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 0
monster.summons = {
	{name = "Myrmidon", chance = 15, interval = 2500, max = 1},
	{name = "Myrmidon", chance = 13, interval = 3800, max = 1}
}

monster.loot = {
	{name = "Zenit helmet", chance = 1004},
	{name = "Valar plate", chance = 903},
	{name = "Valar kilt", chance = 802},
	{id = 9019, chance = 901},
	{name = "aiglos", chance = 605},
	{name = "cerberus shield", chance = 906},
	{name = "narsil", chance = 507}
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
