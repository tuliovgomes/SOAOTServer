local mType = Game.createMonsterType("Baalrog")
local monster = {}

monster.name = "Baalrog"
monster.description = "a Baalrog"
monster.experience = 65000
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 154000
monster.maxHealth = 154000
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
	{type = COMBAT_ICEDAMAGE, percent = 65},
	{type = COMBAT_HOLYDAMAGE , percent = 65},
	{type = COMBAT_DEATHDAMAGE , percent = 65}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 120, attack = 100, condition = {type = CONDITION_FIRE, startDamage = 0, interval = 9000}},
	{name ="firefield", interval = 2000, chance = 15, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -2500, maxDamage = -2900, length = 10, spread = 3, effect = CONST_ME_FIREATTACK},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -2600, maxDamage = -3950, radius = 4, target = false, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 19, type = COMBAT_FIREDAMAGE, minDamage = -2310, maxDamage = -2415, range = 7, radius = 5, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
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
