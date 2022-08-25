local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 7)
	local max = (level / 5) + (maglevel * 14)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(119)
spell:name("Rage of the elemental")
spell:words("exevo gran mas rage")
spell:level(200)
spell:manaPercent(25)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(1 * 1000, 3 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;", "master sorcerer;", "Archmage;", "Arcane Wizard;", "Divine Mage;")
spell:register()
