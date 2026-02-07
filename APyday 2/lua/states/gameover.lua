Hooks:PostHook(GameOverState, "at_enter", "apd2_gameover", function(self)
	-- apd2_data = apd2_default_upgrades
	Utils.PrintTable(apd2_data, 2)
	-- io.save_as_json(apd2_data, "mods/saves/apyday2.txt")
	log("Saved mods/saves/apyday2.txt")
end)