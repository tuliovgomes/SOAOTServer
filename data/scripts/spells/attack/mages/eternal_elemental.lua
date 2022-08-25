local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 4) + (maglevel * 8)
	local max = (level / 4) + (maglevel * 15)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(118)
spell:name("Eternal elemental")
spell:words("exevo gran eternal")
spell:level(200)
spell:manaPercent(25)
spell:isPremium(true)
spell:range(5)
spell:isSelfTarget(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(1 * 1000, 3 * 1000)
spell:needLearn(false)
spell:vocation("druid;", "elder druid;", "Celtic Druid;", "Spirit Healer;", "Divine Mage;")
spell:register()
