local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, TRUE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal = skill * attack
	local levelTotal = player:getLevel()
	return -(((skillTotal * 0.30) + 15) + (levelTotal)) * 1.30, -(((skillTotal * 0.20) + 36) + (levelTotal)) * 1.30 -- TODO : Use New Real Formula instead of an %
end


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 990000000)
	setConditionFormula(condition, -5.3, 3, -8.2, 4)
	combat:addCondition(condition)
	combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(107)
spell:name("Bash Gran Throw")
spell:words("exori mega bash")
spell:level(1000)
spell:manaPercent(25)
spell:isPremium(true)
spell:range(5)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;", "elite knight;", "Templar Knight;", "Chaos Knight;", "Miner;", "Blacksmith;", "Weaponsmith;", "Artisan Weaponsmith;", "Divine Warrior;")
spell:register()
