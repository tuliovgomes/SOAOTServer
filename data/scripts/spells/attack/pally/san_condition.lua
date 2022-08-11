local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_YALAHARIGHOST)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 1) + (maglevel * 46)
	local max = (level / 1) + (maglevel * 52)
	return -min, -max
end


combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(245)
spell:name("san condition")
spell:words("exevo san condition")
spell:level(1000)
spell:mana(2000)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(4 * 1000, 4 * 1000)
spell:needLearn(false)
spell:vocation("paladin;", "royal paladin;", "Medieval Crossbowman;", "Spartan Spearman;", "Divine Shooter;")
spell:register()