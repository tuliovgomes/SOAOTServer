local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level * 12 + magicLevel * 18) + 50
	local max = (level * 18 + magicLevel * 20) + 60
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Cure Curse")
spell:words("exana mort")
spell:group("healing")
spell:vocation("knight;", "elite knight;", "Templar Knight;", "Chaos Knight;")
spell:id(147)
spell:cooldown(1500)
spell:groupCooldown(1000)
spell:level(80)
spell:manaPercent(5)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
