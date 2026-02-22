managers.localization:load_localization_file(APD2Path .. "loc/apd2_upgrades.json")
-- should I be loading the loc file every time this menu is created??
-- probably not. do I care?? it works. fuck you.

local upgrade_table = {}

if next(apd2_data.upgrades) ~= nil then
  for upgrade_name, _ in pairs(apd2_data.upgrades) do
    table.insert(upgrade_table, managers.localization:text(upgrade_name))
  end
else
  table.insert(upgrade_table, "None")
end

local menu = QuickMenu:new("Current Upgrades", table.concat(upgrade_table, "\n"), {})
menu:Show()