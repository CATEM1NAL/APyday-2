Hooks:PostHook(SkillTreeTweakData, "init", "apd2_skills", function(self)
    self.default_upgrades = {}
    if apd2_data and apd2_data.s then
        for key, _ in pairs(apd2_data.s) do
            table.insert(self.default_upgrades, key)
            Utils.PrintTable(self.default_upgrades)
        end
    end
end)