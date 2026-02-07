log("Attempting apd2_data load...")
apd2_data = io.load_as_json("mods/saves/apyday2.txt") or {}
apd2_default_upgrades = {"jowi","x_1911","x_b92fs","x_deagle","x_g22c",
    "x_g17","x_usp","x_sr2","x_mp5","x_akmsu","x_packrat","x_p226","x_m45",
    "x_mp7","x_ppk","player_special_enemy_highlight","player_hostage_trade"}