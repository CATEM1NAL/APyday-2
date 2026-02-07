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
        managers.groupai:state():set_point_of_no_return_timer(600, "forced_ponr")
        ponr_active = true
    end
end)