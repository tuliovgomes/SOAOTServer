local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel *  4.3) + 50
	local max = (level / 5) + (maglevel * 7.4) + 66
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:group("attack")
rune:name("Fire Missile Rune")
rune:allowFarUse(true)
rune:level(101)
rune:runeId(3193)
rune:charges(3)
rune:magicLevel(101)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()

