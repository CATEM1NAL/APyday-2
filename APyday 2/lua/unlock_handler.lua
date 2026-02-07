function apd2_unlock_handler(unlock_type, id)
    log("RUNNING UNLOCK HANDLER!")
    apd2_data = io.load_as_json("mods/saves/apyday2.txt") or {}
    apd2_data[unlock_type] = apd2_data[unlock_type] or {}

    --  UNLOCKS
    -- "X" = Progressive Unlock

    if unlock_type == "heists" or unlock_type == "weapons" or unlock_type == "upgrades" then
    	apd2_data[unlock_type][id] = true
    else
        if apd2_data[unlock_type][id] ~= nil then
            apd2_data[unlock_type][id] = apd2_data[unlock_type][id] + 1
        else
            apd2_data[unlock_type][id] = 1
        end
    end
    managers.chat:_receive_message(ChatManager.GAME, "APYDAY 2", "Unlocked " .. unlock_type .. " " .. id, Color(255, 118, 126, 189) / 255)
    Utils.PrintTable(apd2_data, 2)
    io.save_as_json(apd2_data, "mods/saves/apyday2.txt")
    log("Saved mods/saves/apyday2.txt")
end