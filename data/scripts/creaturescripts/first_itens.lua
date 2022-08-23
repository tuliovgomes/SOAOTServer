local firstItens = CreatureEvent("PlayerLogin")


local vocations = { --Items given depending on vocation [1] is vocation 1: sorcerer
	[1] = {3074},
	[2] = {3066},
	[3] = {3277},
	[4] = {3271}
}

function firstItens.onLogin(player)
	if player:getLastLoginSaved() <= 0 then
		VOC = vocations[player:getVocation():getId()]

		player:addItem(2854, 1)
		player:addItem(3351, 1)
		player:addItem(3357, 1)
		player:addItem(3557, 1)
		player:addItem(3413, 1)
		player:addItem(3552, 1)
		player:addItem(3552, 1)
		player:addItem(3043, 2)
		player:addItem(268, 50)
		player:addItem(266, 50)

		if not VOC then
			return true
		end

		for i = 1, #VOC do
				player:addItem(VOC[i], 1)
		end

	end

	return true
end

firstItens:register()
