local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2, -12, -2, -18)

local function executeCombat(cid, variant)
    local creature = Creature(cid)
    if creature then
        combat:execute(creature, variant)
    end
end

local spell = Spell(SPELL_INSTANT)
function spell.onCastSpell(creature, variant, isHotkey)
    local cid = creature:getId()
    addEvent(executeCombat, 800, cid, variant)
    addEvent(executeCombat, 1200, cid, variant)
    return combat:execute(creature, variant)
end

spell:name("Con Triplici")
spell:words("exori con triplici")
spell:group("attack")
spell:vocation("paladin;", "royal paladin;", "Medieval Crossbowman;", "Spartan Spearman;", "Divine Shooter;")
spell:id(124)
spell:cooldown(1 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(200)
spell:manaPercent(9)
spell:needTarget(true)
spell:range(7)
spell:isPremium(true)
spell:register()
