-- This is what the menu button does when clicked
function MenuCallbackHandler:apd2_play_next()
  if not apd2_data.game.next_heist then apd2_next_heist(0) end

  -- Random mutators!
  managers.mutators:reset_all_mutators()
  dofile(APD2Path .. "lua/tables/mutators.lua")
  local current_mutator = nil
  for i = 1, apd2_data.x.mutators do
    current_mutator = math.random(#apd2_mutators)
    managers.mutators:set_enabled("Mutator" .. apd2_mutators[current_mutator])
    table.remove(apd2_mutators, current_mutator)
  end

  -- Dumps you straight into a heist
  MenuCallbackHandler:play_single_player()
  MenuCallbackHandler:start_single_player_job({
    difficulty = "normal",
    job_id = apd2_data.game.next_heist
  })
  log("[APD2>menu] Loading " .. apd2_data.game.next_heist)
  MenuCallbackHandler:start_the_game()
end


-- This whole hook was basically taken wholesale from Create Empty Lobby
Hooks:Add("MenuManagerBuildCustomMenus", "apd2_playnextbutton", function(menu_manager, nodes)
  managers.localization:add_localized_strings({
    ["apd2_start_run_title"] = "Start Run",
    ["apd2_start_run_desc"] = "Bring as much chaos to the streets of D.C. as you can within the time limit.",
    ["apd2_play_next_title"] = "Continue Run",
    ["apd2_play_next_desc"] = "Return to the run. Time remaining: " .. math.floor(apd2_data.game.ponr) .. " seconds."
  })

  local mainmenu = nodes.main
  if mainmenu == nil then
    return
  end

  local data = {
    type = "CoreMenuItem.Item",
  }
  local params = {
    name = "apd2_play_next_btn",
    text_id = "apd2_play_next_title",
    help_id = "apd2_play_next_desc",
    callback = "apd2_play_next",
    font_size = 35,
    font = tweak_data.menu.pd2_large_font
  }
  if not apd2_data.game.next_heist then
    params.text_id = "apd2_start_run_title"
    params.help_id = "apd2_start_run_desc"
  end

  local new_item = mainmenu:create_item(data, params)

  new_item.dirty_callback = callback(mainmenu, mainmenu, "item_dirty")
  if mainmenu.callback_handler then
    new_item:set_callback_handler(mainmenu.callback_handler)
  end

  local position = 1
  table.insert(mainmenu._items, position, new_item)

  local apd2_hidden_buttons = { crimenet = true, crimenet_offline = true,
  story_missions = true, social_hub = true, fbi_files = true, gamehub = true,
  movie_theater = true, achievements = true }

  for i, item in pairs(mainmenu._items) do
    if apd2_hidden_buttons[item._parameters.name] then
      item:set_visible(false)
    end
  end
  -- Utils.PrintTable(nodes.inventory, 3)

  if RestructuredMenus then
    if RestructuredMenus.settings.main_add_crimenet_broker then
      MenuHelper:HideMenuItem(mainmenu, 'contract_broker')
    end
  end
end)