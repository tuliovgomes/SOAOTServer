-- Developer = "Túlio Gomes",
-- Version = "2.0",
-- lastUpdate = "15/03/2022"

local slotMachine = Action()

local monster = {"Death Blob", "Acid Blob", "Ink Blob"}
local positions = {
    {x = 1000, y = 1014, z = 5}, {x = 1001, y = 1014, z = 5},
    {x = 1002, y = 1014, z = 5}
} -- monster position
local price = 5000 -- price
local reward = 50000 -- reward

function slotMachine.onUse(player, item, fromPosition, target, toPosition,
                           isHotkey)
    local first = math.random(1, #monster)
    local second = math.random(1, #monster)
    local third = math.random(1, #monster)
    local monster1monster1 = 1
    local monster2monster2 = 2
    local monster3monster3 = 3
    local tab = {}

    if player:getStorageValue(82193) == -1 then
        local str = 'Rules for betting on the slot machine:  \n\n'
        str = str .. 'To bet on this machine the price is:  5k \n'
        str = str .. 'The reward in this machine is: 50k '
        player:popupFYI(str)
        player:setStorageValue(82193, os.time() + 24 * 60 * 60)

        return true
    end

    if getGlobalStorageValue(82192) > os.time() then
        player:sendCancelMessage("You need wait a second to bet.", cid)
        return true
    end

    if getGlobalStorageValue(82192) > os.time() then
        player:sendCancelMessage("You need wait a second to bet.", cid)
        return true
    end

    if player:removeMoneyBank(price) then
        setGlobalStorageValue(82192, os.time() + 6)

        Position(positions[1]):sendMagicEffect(7)
        Position(positions[2]):sendMagicEffect(7)
        Position(positions[3]):sendMagicEffect(7)

        Position(positions[1]):sendMagicEffect(27)
        Position(positions[2]):sendMagicEffect(27)
        Position(positions[3]):sendMagicEffect(27)

        Position(positions[1]):sendMagicEffect(32)
        Position(positions[2]):sendMagicEffect(32)
        Position(positions[3]):sendMagicEffect(32)

        addEvent(function()

            monster1 = Game.createMonster(monster[first], positions[1])
            monster1:changeSpeed(0)
            Position(positions[1]):sendMagicEffect(27)
            Position(positions[1]):sendMagicEffect(32)
            table.insert(tab, first)
        end, 1000)

        addEvent(function()

            monster2 = Game.createMonster(monster[second], positions[2])
            monster2:changeSpeed(0)
            Position(positions[2]):sendMagicEffect(27)
            Position(positions[2]):sendMagicEffect(32)
            table.insert(tab, second)
        end, 2000)

        addEvent(function()

            monster3 = Game.createMonster(monster[third], positions[3])
            monster3:changeSpeed(0)
            Position(positions[3]):sendMagicEffect(27)
            Position(positions[3]):sendMagicEffect(32)
            table.insert(tab, third)
        end, 3000)

        addEvent(function()

            Position(positions[1]):sendMagicEffect(62)
            Position(positions[2]):sendMagicEffect(62)
            Position(positions[3]):sendMagicEffect(62)

            Position(positions[1]):sendMagicEffect(27)
            Position(positions[2]):sendMagicEffect(27)
            Position(positions[3]):sendMagicEffect(27)

            Position(positions[1]):sendMagicEffect(32)
            Position(positions[2]):sendMagicEffect(32)
            Position(positions[3]):sendMagicEffect(32)

            monster1:remove()
            monster2:remove()
            monster3:remove()

            if tab[1] == tab[2] and tab[1] == tab[3] then
                player:getPosition():sendMagicEffect(29)
                player:getPosition():sendMagicEffect(29)
                player:getPosition():sendMagicEffect(29)
                player:getPosition():sendMagicEffect(28)
                player:getPosition():sendMagicEffect(28)
                player:say(" You Win :) ", TALKTYPE_MONSTER_SAY)
                player:addMoney(reward)
            else
                player:say(" You lose :( ", TALKTYPE_MONSTER_SAY)
            end
        end, 4000)
        return true
    else
        player:sendCancelMessage("You don't have enough money. You need " ..
                                     price .. " to bet.", cid)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end
end

slotMachine:aid(1945)
slotMachine:register()
