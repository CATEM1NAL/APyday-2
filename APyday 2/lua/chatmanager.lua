Hooks:PostHook(ChatManager, "send_message", "APyday2_SendMessage", function(self, channel_id, message)
    if message == "!ping" then
        log("MESSAGE RECEIVED LOUD AND CLEAR BIG CHIEF")
    end

    self:_receive_message(1, "SYSTEM", "Command executed.")
    return true
end)