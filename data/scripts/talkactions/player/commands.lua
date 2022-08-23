local commands = TalkAction("!comandos", "/comandos", "!commands", "/commands")

function commands.onSay(player, words, param)
    if player then
        local text = 'Comandos disponiveis: \n\n'
        text = text .. '!bless \n'
        text = text .. '!buyhouse \n'
        text = text .. '!leavehouse \n'
        text = text .. '!sellhouse \n'
				text = text .. '!serverinfo \n'
				text = text .. '!spells \n'
        text = text .. '!info \n\n'
        player:showTextDialog(173, text)
    end
    return false
end

commands:register()
