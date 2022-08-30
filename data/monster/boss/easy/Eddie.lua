local mType = Game.createMonsterType("Eddie")
local monster = {}

monster.name = "Eddie"
monster.description = "a Eddie"
monster.experience = 19100
monster.outfit = {
	lookType = 84,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 40700
monster.maxHealth = 40700
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6025
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
	interval = 1000,
	chance = 10,
	{text = "Tu nao sabe o que bacanal?.", yell = false},
	{text = "Abrah Kadabrah!", yell = false},
	{text = "Danca cu duro e uma delicia.. e uma delicia.", yell = false},
	{text = "Da meia volta danca Cu duro .", yell = false},
	{text = "Chera meu ovo .|.", yell = false},
	{text = "Ai si eu ti pego ai ai, delicia, delicia ai si eu ti pego em...", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 70},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 125, attack = 120, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="sudden death rune", interval = 1000, chance = 10, minDamage = -1000, maxDamage = -1500, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -1500, range = 10, radius = 7, target = false, effect = CONST_ME_MORTAREA},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -850, max = -850}, duration = 60000, radius = 6, target = false, effect = CONST_ME_MAGIC_GREEN},
	{name ="drunk", interval = 1000, chance = 8, drunkenness = 25, duration = 10000, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA}
}

monster.defenses = {
	defense = 35,
	armor = 30,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 0
monster.summons = {
	{name = "demon", chance = 12, interval = 1000, max = 1}
}

monster.loot = {
	{name = "great shield", chance = 1201},
	{name = "demon helmet", chance = 2900},
	{name = "demon armor", chance = 3702},
	{name = "demon legs", chance = 2600},
	{name = "demon shield", chance = 4000},
	{name = "mastermind shield", chance = 1500},
	{name = "winged boots", chance = 1800},
	{name = "winged helmet", chance = 1800},
	{name = "amulet of loss", chance = 8100},
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
