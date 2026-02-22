local APD2FileIdent = "[APD2>upgrades] "

Hooks:PreHook(PlayerManager, "aquire_default_upgrades", "apd2_removeupgrades", function(self)
  for key, _ in pairs(Global.upgrades_manager.aquired) do
    if key ~= "amcar" and key ~= "glock_17" and key ~= "weapon" then
      if not apd2_data.upgrades[key] and not apd2_data.unlocks[key] then
        log(APD2FileIdent .. "Removing upgrade " .. key )
        managers.upgrades:unaquire(key)
      end
    end
  end
  --Utils.PrintTable(Global.upgrades_manager.aquired, 3)
end)

Hooks:PostHook(SkillTreeTweakData, "init", "apd2_addupgrades", function(self)
  self.default_upgrades = {}
  
  if managers.upgrades then
    for key, _ in pairs(apd2_data.upgrades) do
      managers.upgrades:aquire(key)
    end
    for key, _ in pairs(apd2_data.unlocks) do
      managers.upgrades:aquire(key)
    end
  end
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