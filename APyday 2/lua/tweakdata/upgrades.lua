Hooks:PostHook(SkillTreeTweakData, "init", "apd2_upgrades", function(self)
    self.default_upgrades = apd2_default_upgrades
    if apd2_data and apd2_data.upgrades then
        for key, _ in pairs(apd2_data.upgrades) do
            table.insert(self.default_upgrades, key)
        end
        log("CURRENT UPGRADES:")
        Utils.PrintTable(self.default_upgrades)
    end
end)