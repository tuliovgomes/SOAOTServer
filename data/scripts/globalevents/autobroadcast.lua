local autobroadcast = GlobalEvent("autobroadcast")

function autobroadcast.onTime(interval, lastExecution)
	local messages = {
		"[SYSTEM] use the !commands command to know all the server commands .",
		"[BUGS] problems or suggestions? Enter our Discord: https://discord.gg/sGeXWvE9 \n For each valid BUG Report you receive a bonus!",
		"[CONTACT] Discord: https://discord.gg/sGeXWvE9",
		"[SYSTEM]: The server's global save occurs every day at 06:00hrs.",
		"[SECURITY]: Never use the same password on other servers as you will be making life easier for hackers.",
		"[SECURITY]: Protect your password. Use it only on our official website.",
	}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT)
    return true
end

autobroadcast:interval(600000)
autobroadcast:register()

