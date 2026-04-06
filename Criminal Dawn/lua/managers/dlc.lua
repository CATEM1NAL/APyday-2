-- Unlock content that is inaccessible in Criminal Dawn & achievement locked content that impacts gameplay
Hooks:OverrideFunction(GenericDLCManager, "has_pd2_clan", function() return true end)
Hooks:OverrideFunction(GenericDLCManager, "is_content_skirmish_locked", function() return false end)
Hooks:OverrideFunction(GenericDLCManager, "is_content_crimespree_locked", function() return false end)
Hooks:OverrideFunction(GenericDLCManager, "is_weapon_mod_achievement_locked", function() return false end)
Hooks:OverrideFunction(GenericDLCManager, "is_weapon_mod_achievement_milestone_locked", function() return false end)