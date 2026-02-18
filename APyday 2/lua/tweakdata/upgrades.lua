Hooks:PostHook(SkillTreeTweakData, "init", "apd2_unlocks", function(self)
  self.default_upgrades = apd2_default_upgrades
  for key, _ in pairs(apd2_data.upgrades) do
    table.insert(self.default_upgrades, key)
  end
  for key, _ in pairs(apd2_data.weapons) do
    table.insert(self.default_upgrades, key)
  end
  log("[APD2>upgrades] CURRENT UPGRADES:")
  Utils.PrintTable(self.default_upgrades)
end)

Hooks:PostHook(UpgradesTweakData, "init", "apd2_nolevelunlocks", function(self)
  -- local no_level_lock = { "s552","scar","spas12","rpk","usp","ppk","p226","m45","mp7" }
  -- I thought adding the weapons with no level lock to the level table would work, it doesn't

  -- move all level unlocks to the same level (255)
  local all_levels = { upgrades = {} }
  for _, level in pairs(self.level_tree) do
    if level.upgrades then
      for _, upgrade in ipairs(level.upgrades) do
        table.insert(all_levels.upgrades, upgrade)
      end
    end
  end
  self.level_tree = { [255] = all_levels }
end)