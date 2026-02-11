dofile(APD2Path .. "lua/heist_selector.lua")

Hooks:PostHook(VictoryState, "at_enter", "apd2_heistwin", function(self)

  -- calculates time remaining for next PONR
  if level_id ~= "hvh" then
    apd2_data.game.ponr = (apd2_data.game.ponr or (600 * (1 + (apd2_data.game.ponr_upgrade or 0)))) - (TimerManager:game():time() - apd2_maskup_time)
  else
    apd2_data.game.ponr = managers.groupai:state():get_point_of_no_return_timer()
  end

  DelayedCalls:Add("apd2_remaining_time", 1, function() -- display remaining time in chat
    if apd2_data.game.ponr < 0 then
      managers.chat:_receive_message(ChatManager.GAME, "APYDAY 2", "Remaining time is less than 0.", Color(255, 118, 126, 189) / 255)
    else
      managers.chat:_receive_message(ChatManager.GAME, "APYDAY 2", "Time left: " .. apd2_data.game.ponr, Color(255, 118, 126, 189) / 255)
    end
  end)

  if managers.job:on_last_stage() then
    apd2_data.game.heists_won = (apd2_data.game.heists_won or 0) + 1
    apd2_next_heist(apd2_data.game[heists_won])
  end
end)