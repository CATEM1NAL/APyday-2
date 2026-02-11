-- this hook can probably be improved, both in terms of
-- code quality and where we actually hook into, but it
-- works for now.

local ponr_active = false

Hooks:PostHook(IngameStandardState, "at_enter", "apd2_force_ponr", function(self)
    local mission = managers.mission
    local data = {
        id = "forced_ponr",
        class = "ElementPointOfNoReturn",
        values = { elements = {} }
    }
    mission._scripts["default"]._elements["forced_ponr"] = ElementPointOfNoReturn:new(mission, data)
    if not ponr_active then
        apd2_load_save()
        log("[APD2>force_ponr] " .. apd2_data.game.ponr)
        managers.groupai:state():set_point_of_no_return_timer(apd2_data.game.ponr or (600 * (1 + (apd2_data.game.ponr_upgrade or 0))), "forced_ponr")
        -- sorry for this monstrosity of a line

        apd2_maskup_time = TimerManager:game():time()
        -- used to calculate time remaining. the following line works:
        -- managers.groupai:state():get_point_of_no_return_timer() 
        -- but this takes the current PONR timer, which under most
        -- circumstances is correct UNLESS the heist assigns its own.
        -- in that case the PONR time remaining becomes the heist's
        -- PONR timer, which is problematic if you narrowly escape Shadow Raid
        -- for example (next heist timer set to a short amount of time)

        ponr_active = true
    end
end)