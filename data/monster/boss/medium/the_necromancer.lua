local mType = Game.createMonsterType("The Necromancer")
local monster = {}

monster.name = "The Necromancer"
monster.description = "The Necromancer"
monster.experience = 60000
monster.outfit = {
	lookType = 9,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 180000
monster.maxHealth = 180000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 3058
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 50
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
	targetDistance = 3,
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
	{text = "Nos vemos no Inferno!", yell = false},
	{text = "Se renda ao poder de Sauron!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 70},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 65},
	{type = COMBAT_DEATHDAMAGE , percent = 90}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -600},
	{name ="combat", interval = 2550, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -1800, range = 1, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2230, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -900, maxDamage = -2000, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_YELLOW_RINGS},
	{name ="condition", interval = 6200, chance = 20, type = CONDITION_POISON, startDamage = 65, tick = 2000, range = 7, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 2860, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2530, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -1050, maxDamage = -2150, range = 8, radius = 7, target = true, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 120,
	armor = 60,
	{name ="combat", interval = 800, chance = 100, type = COMBAT_HEALING, minDamage = 120, maxDamage = 150},
	{name ="invisible", interval = 6000, chance = 30, duration = 5000, effect = CONST_ME_POFF}
}

monster.maxSummons = 0
monster.summons = {
	{name = "banshee", chance = 25, interval = 3000, max = 2},
	{name = "blightwalker", chance = 15, interval = 2500, max = 1},
	{name = "warlock", chance = 13, interval = 3800, max = 1}
}

monster.loot = {
	{name = "necromancer shield", chance = 801},
	{name = "demon helmet", chance = 1900},
	{name = "demon armor", chance = 1702},
	{name = "demon legs", chance = 1600},
	{name = "demon shield", chance = 2000},
	{name = "mastermind shield", chance = 1500},
	{name = "winged boots", chance = 1800},
	{name = "winged helmet", chance = 1800},
	{name = "amulet of loss", chance = 2100},
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
