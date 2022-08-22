local mount = Action()

local config = {
	{itemid = 12306, mountid = 5},
	{itemid = 12547, mountid = 16},
	{itemid = 12519, mountid = 14},
	{itemid = 12800, mountid = 15},
	{itemid = 12319, mountid = 8},
	{itemid = 23538, mountid = 94},
	{itemid = 23684, mountid = 98},
	{itemid = 23685, mountid = 99},
	{itemid = 12311, mountid = 2},
	{itemid = 5907, mountid = 3},
	{itemid = 21439, mountid = 41},
	{itemid = 12260, mountid = 10},
	{itemid = 12509, mountid = 21},
	{itemid = 12320, mountid = 1},
	{itemid = 19136, mountid = 39},
	{itemid = 28791, mountid = 126},
	{itemid = 21186, mountid = 43},
}

function mount.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	for i = 1, #config do
		if config[i].itemid == item.itemid then
			local mountclicked = config[i]
			if player:getStorageValue(mountclicked.itemid) == -1 then
				player:addMount(mountclicked.mountid)
				player:setStorageValue(mountclicked.itemid)
				player:removeItem(mountclicked.itemid, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You got a new mount!")
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have that mount, sorry.")
			end
		end
	end
end

for i = 1, #config do
	mount:id(config[i].itemid)
end

mount:register()
