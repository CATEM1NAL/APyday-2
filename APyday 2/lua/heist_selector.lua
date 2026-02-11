dofile(APD2Path .. "lua/tables/heists.lua")

local heist_tables = { apd2_heist_t1, apd2_heist_t2, apd2_heist_t3, apd2_heist_t4, apd2_heist_final }

function apd2_next_heist(heists_won)  
  local index = (heists_won or 0) + 1
  local current_tier = heist_tables[index]
  managers.network.matchmake.difficulty = heists_won or 0
  local next_heist = current_tier[math.random(#current_tier)]
  apd2_data.game.heists_played = {[next_heist] = true}
  apd2_data.game.next_heist = next_heist
  Utils.PrintTable(apd2_data.game.heists_played, 1)
  log("[APD2>heist_selector] " .. apd2_data.game.next_heist)
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log("Saved " .. SavePath .. "apyday2.txt")
end