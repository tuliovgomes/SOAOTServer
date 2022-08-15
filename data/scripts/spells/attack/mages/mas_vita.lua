local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ELECTRICALSPARK)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4, -48, -4, -59)

local combat2 = Combat()

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ELECTRICALSPARK)
combat2:setArea(createCombatArea(AREA_CIRCLE6X6))
combat2:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4, -48, -4, -59)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 999999999)
setConditionFormula(condition, -8.3, 8, -18.2, 6)
combat2:addCondition(condition)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ROOTS)

local function executeCombat(cid, variant)
    local creature = Creature(cid)
    if creature then
        combat:execute(creature, variant)
    end
end

local function executeCombat2(cid, variant)
    local creature = Creature(cid)
    if creature then
        combat2:execute(creature, variant)
    end
end

local spell = Spell(SPELL_INSTANT)
function spell.onCastSpell(creature, variant, isHotkey)
    local cid = creature:getId()
    addEvent(executeCombat2, 800, cid, variant)
    addEvent(executeCombat, 1200, cid, variant)
    return combat:execute(creature, variant)
end

spell:name("Con Multi")
spell:words("teste")
spell:group("attack", "focus")
spell:vocation("sorcerer;", "master sorcerer;", "Archmage;", "Arcane Wizard;", "Divine Mage;")
spell:id(124)
spell:cooldown(20 * 1000)
spell:groupCooldown(10 * 1000)
spell:isSelfTarget(true)
spell:level(1000)
spell:manaPercent(85)
spell:isPremium(true)
spell:register()