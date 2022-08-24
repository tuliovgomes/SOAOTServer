local mType = Game.createMonsterType("cerberus")
local monster = {}

monster.name = "Cerberus"
monster.description = "Cerberus"
monster.experience = 720000
monster.outfit = {
	lookType = 240,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 204500
monster.maxHealth = 204500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6332
monster.speed = 310
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
	{text = "Wooof!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 60},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 108, attack = 110},
	{name ="combat", interval = 1500, chance = 300, type = COMBAT_ENERGYDAMAGE, minDamage = -900, maxDamage = -2100, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 5000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -1600, range = 10, radius = 7, target = false, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 150, type = COMBAT_EARTHDAMAGE, minDamage = -900, maxDamage = -2000, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -1005, maxDamage = -2135, range = 7, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -935, maxDamage = -1055, range = 7, radius = 6, target = false, effect = CONST_ME_LOSEENERGY}
}

monster.defenses = {
	defense = 35,
	armor = 25
}

monster.loot = {
	{name = "boots of haste", chance = 14000},
	{name = "fire axe", chance = 17000},
	{name = "giant sword", chance = 12500},
	{name = "giant ruby", chance = 31500},
	{name = "giant sapphire", chance = 31500},
	{name = "giant emerald", chance = 31500},
	{name = "ice rapier", chance = 27500},
	{name = "magic plate armor", chance = 13000},
	{name = "mastermind shield", chance = 17500},
	{name = "purple tome", chance = 12600},
	{name = "ring of the sky", chance = 13500},
	{name = "silver dagger", chance = 15500},
	{name = "skull staff", chance = 25000},
	{name = "talon", chance = 14000, maxCount = 27},
	{name = "teddy bear", chance = 10500},
	{name = "dragon robe", chance = 4500},
	{name = "molten plate", chance = 4500},
	{name = "cerberus shield", chance = 906},
	{name = "thunder hammer", chance = 3500}
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
