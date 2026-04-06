-- Automatically unlock side job weapons so they are available for use
Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_arbiter", function() return true end)
Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_breech", function() return true end)
Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_ching", function() return true end)
Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_erma", function() return true end)
Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_shock", function() return true end)

Hooks:PostHook(BlackMarketManager, "get_item_amount", "CrimDawn_BMInfiniteItems", function(self, _, category)
  if category ~= "weapon_skins" then return 1 end
end)

Hooks:OverrideFunction(BlackMarketManager, "_setup_unlocked_crew_items", function(self)
  self:_unlock_crew_item("crew_interact")
  self:_unlock_crew_item("crew_inspire")
  self:_unlock_crew_item("crew_scavenge")
  self:_unlock_crew_item("crew_ai_ap_ammo")
  self:_unlock_crew_item("crew_ai_cable_ties")
  self:_unlock_crew_item("crew_ai_flashbang")
  self:_unlock_crew_item("crew_ai_counter_strike")
  self:_unlock_crew_item("crew_ai_counter_tase")
	self:_unlock_crew_item("crew_healthy")
	self:_unlock_crew_item("crew_sturdy")
	self:_unlock_crew_item("crew_evasive")
	self:_unlock_crew_item("crew_motivated")
	self:_unlock_crew_item("crew_regen")
	self:_unlock_crew_item("crew_quiet")
	self:_unlock_crew_item("crew_generous")
	self:_unlock_crew_item("crew_eager")
end)

Hooks:OverrideFunction(BlackMarketManager, "equipped_van_skin", function()
  local skins = { "default", "brown", "green", "grey", "red", "white", "yellow", "icecream", "spooky" }
  if managers.dlc:is_dlc_unlocked("overkill_pack") then table.insert(skins, "overkill") end
  return skins[math.random(1, #skins)]
end)