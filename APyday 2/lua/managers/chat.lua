dofile(ModPath .. "lua/unlock_handler.lua")

Hooks:PostHook(ChatManager, "send_message", "apd2_chatdebug", function(self, channel_id, sender, message)
    log(message)
    if message:match("^!") then
        log("MESSAGE RECEIVED LOUD AND CLEAR BIG CHIEF")
        local unlock_type, id = message:match("^!(%S+)%s+(%S+)$")
        apd2_unlock_handler(unlock_type, id)
    end
end)