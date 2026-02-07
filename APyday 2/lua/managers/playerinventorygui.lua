Hooks:PostHook(PlayerInventoryGui, "init", "apd2_inventorygui", function(self, ws, fullscreen_ws, node)
-- CHECK FOR DLCS
local owned_dlcs = {}

for dlc_id, dlc_data in pairs(tweak_data.dlc) do
    -- Only check real DLC entries (skip internal flags)
    if dlc_data.app_id or dlc_data.content then
        if managers.dlc:is_dlc_unlocked(dlc_id) then
            table.insert(owned_dlcs, dlc_id)
        end
    end
end

-- Print them to the BLT log
log("Owned DLC:")
Utils.PrintTable(owned_dlcs, 2)
end)