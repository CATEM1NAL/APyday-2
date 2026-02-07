Hooks:PostHook(PlayerManager, "aquire_default_upgrades", "apd2_skills", function(self)
    if apd2_data and apd2_data.s then
        local default_upgrades = {}
        for key, _ in pairs(apd2_data.s) do
            table.insert(default_upgrades, key)
            Utils.PrintTable(default_upgrades)
        end
    end
end)