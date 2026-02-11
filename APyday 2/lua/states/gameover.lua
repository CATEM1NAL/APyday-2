dofile(APD2Path .. "lua/heist_selector.lua")

Hooks:PostHook(GameOverState, "at_enter", "apd2_heistfail", function(self)
  -- apd2_data.upgrades = {}
  apd2_data.game.ponr = nil
  apd2_data.game.heists_won = nil
  apd2_data.game.next_heist = nil
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log("Saved " .. SavePath .. "apyday2.txt")
end)