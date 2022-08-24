local mType = Game.createMonsterType("smaug")
local monster = {}

monster.name = "Smaug"
monster.description = "Smaug"
monster.experience = 740000
monster.outfit = {
	lookType = 204,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 94500
monster.maxHealth = 94500
monster.runHealth = 300
monster.race = "fire"
monster.corpse = 5984
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
	{text = "ZCHHHHH", yell = true},
	{text = "I WILL SET THE WORLD IN FIRE!", yell = true},
	{text = "I WILL PROTECT MY BROOD!", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 45},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 135, attack = 135},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -1250, maxDamage = -1950, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 6, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_FIREDAMAGE, minDamage = -1250, maxDamage = -1750, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
	armor = 35,
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_HEALING, minDamage = 300, maxDamage = 410, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", minCount = 1, maxCount = 200, chance = 100000},
	{name = "crystal coin", minCount = 1, maxCount = 5, chance = 50000},
	{name = "gold coin", chance = 100000, maxCount = 300},
	{name = "supreme health potion", minCount = 10, maxCount = 80, chance = 45000},
	{name = "ultimate mana potion", minCount = 10, maxCount = 60, chance = 42000},
	{name = "ultimate spirit potion", minCount = 0, maxCount = 88, chance = 42000},
	{name = "bullseye potion", minCount = 0, maxCount = 10, chance = 22000},
	{name = "berserk potion", minCount = 0, maxCount = 10, chance = 22000},
	{name = "yellow gem", chance = 18500},
	{name = "giant sapphire", chance = 16800},
	{name = "magma coat", chance = 15200},
	{name = "gold ingot", minCount = 0, maxCount = 1, chance = 18000},
	{name = "red tome", chance = 18200},
	{name = "boots of haste", chance = 14000},
	{name = "demon shield", chance = 15500},
	{name = "thunder hammer", chance = 3500},
	{name = "nightmare blade", chance = 9500},
	{name = "demonrage sword", chance = 7500},
	{name = "dreaded cleaver", chance = 2500},
	{name = "butcher's axe", chance = 1500},
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
