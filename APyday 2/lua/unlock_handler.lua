-- no clue how optimal this is. if you're an experienced modder
-- and this makes you wince, please let me know what I can do
-- to track unlocks better.

function apd2_unlock_handler(unlock_type, id)
    log("RUNNING UNLOCK HANDLER!")

    apd2_load_save()
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

    io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
    log("Saved " .. SavePath .. "apyday2.txt")
end