dofile(APD2Path .. "lua/dlc_check.lua")

-- basic "loot and leave" type heists
apd2_heist_t1 = { "short1", "jewelry_store", "ukrainian_job_prof",
"four_stores", "family", "arm_fac", "arm_par", "arm_hcm", "arm_und", "arm_cro", 
"mallcrasher", }
-- Tutorials, Jewelry Store, Ukrainian Job, Four Stores, Diamond Store,
-- Armored Transports, Mallcrasher

local UnlockedUpgrade = apd2_data.upgrades

if apd2_data.x.bots > 1 and UnlockedUpgrade.cable_tie then
  table.insert(apd2_heist_t1, "short2")
end

if UnlockedUpgrade.player_corpse_dispose and UnlockedUpgrade.player_extra_corpse_dispose_amount then
  table.insert(apd2_heist_t1, "short1")
end

-- 
apd2_heist_t2 = { "nightclub","branchbank_prof","gallery" }
-- Nightclub, Bank Heist, Art Gallery, 

-- basic heists with some moving parts
apd2_heist_t3 = { "roberts", "brb", "cage", "chas", "spa" }
-- GO Bank, Brooklyn Bank, Car Shop, Dragon Heist, Brooklyn 10-10

-- bigger heists
apd2_heist_t4 = { "run", "kosugi", "watchdogs_wrapper",
"sah", "crojob1", "crojob_wrapper", "election_day", "jolly", "dinner" }
-- Heat Street, Shadow Raid, Watchdogs, Shacklethorne,
-- Bomb Heists, Election Day, Aftershock, Slaughterhouse

apd2_heist_t5 = { "rvd", "arena", "arm_for", "flat", "dah",
"firestarter", "moon" }
-- Reservoir Dogs, Alesso, Train Heist, Panic Room, Diamond Heist,
-- Stealing Xmas, 

-- final heists, grand scale
apd2_heist_final = { "pent", "vit", "deep", "nmh", "haunted", 
"friend", "kenaz", "16_stores", "peta" }
-- Mountain Master, White House, Crude Awakening, No Mercy,
-- Safe House Nightmare, Scarface Mansion, Golden Grin, 28 Stores
-- Goat Sim

-- endless heists are weird. most have very basic objectives
-- but due to their nature you could realistically play them at
-- any tier depending on how much time you want to spend on them
-- for this reason they are included at all tiers

apd2_heist_endless_all = { "hvh", "help", "nail", "cane", "pines" } -- always in the pool
-- Cursed Kill Room, Prison Nightmare, Lab Rats, Santa's Workshop, White Xmas

apd2_heist_endless = { "rat", "mex_cooking", "pal" } -- only used above tier 1
-- Cook Off, Border Crystals, Counterfeit

local all_heists = { apd2_heist_t1, apd2_heist_t2, apd2_heist_t3, apd2_heist_t4, apd2_heist_t5, apd2_heist_final }

for _, tier in ipairs(all_heists) do
    for _, heist in ipairs(apd2_heist_endless_all) do
        table.insert(tier, heist)
    end
    if tier ~= apd2_heist_t1 then
        for _, heist in ipairs(apd2_heist_endless) do
            table.insert(tier, heist)
        end
    end
end