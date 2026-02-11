-- I have no fucking clue if there's a better place to
-- do this than in setups/setup. The issue is the game
-- needs to be able to access apd2_data before it does
-- pretty much anything else in its current state, so
-- the game will crash if apd2_data isn't initialized
-- immediately. Prehooking setups/setup was the first
-- solution I found that worked. If there's a better
-- way to do this, please let me know!

APD2Path = ModPath -- BeardLib can suck a fat nut

function apd2_load_save()
  log("Attempting apd2_data load...")
  apd2_data = io.load_as_json(SavePath .. "apyday2.txt") or {}
  apd2_data.upgrades = apd2_data.upgrades or {}
  apd2_data.weapons = apd2_data.weapons or {}
  apd2_data.heists = apd2_data.heists or {}
  apd2_data.x = apd2_data.x or {}
  apd2_data.x.mutators = apd2_data.x.mutators or 0
  apd2_data.game = apd2_data.game or {}
  apd2_data.game.ponr = apd2_data.game.ponr or (600 * (1 + (apd2_data.game.ponr_upgrade or 0)))
  if not apd2_data.game.next_heist then
    dofile(APD2Path .. "lua/heist_selector.lua")
    apd2_data.heists.next_heist = next_heist
  end

  -- Utils.PrintTable(apd2_data)
  apd2_default_upgrades = {"player_special_enemy_highlight","player_hostage_trade"}
end

apd2_load_save()