function apd2_unlock_handler(unlock_type, id)
    log("RUNNING UNLOCK HANDLER!")
    apd2_data = io.load_as_json("mods/saves/apyday2.txt") or {}
    apd2_data[unlock_type] = apd2_data[unlock_type] or {}

    --  UNLOCKS
    -- "H" = Heist
    -- "W" = Weapon
    -- "S" = Skill
    -- "X" = Progressive Unlock

    if unlock_type == "h" or unlock_type == "w" or unlock_type == "s" then
    	apd2_data[unlock_type][id] = true
    else
        if apd2_data[unlock_type][id] ~= nil then
            apd2_data[unlock_type][id] = apd2_data[unlock_type][id] + 1
        else
            apd2_data[unlock_type][id] = 1
        end
    end
    io.save_as_json(apd2_data, "mods/saves/apyday2.txt")
    Utils.PrintTable(apd2_data, 2)
    log("Saved mods/saves/apyday2.txt")
end