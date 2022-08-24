local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4, -35, -4, -40)

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

spell:name("Con Multi")
spell:words("exori con multi")
spell:group("attack")
spell:vocation("paladin;", "royal paladin;", "Medieval Crossbowman;", "Spartan Spearman;", "Divine Shooter;")
spell:id(124)
spell:cooldown(2 * 1000)
spell:groupCooldown(3 * 1000)
spell:level(600)
spell:manaPercent(20)
spell:needTarget(true)
spell:range(7)
spell:isPremium(true)
spell:register()
