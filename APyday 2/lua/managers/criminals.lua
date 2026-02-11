if apd2_data.x["bots"] then
  log("[APD2>criminals] Bot count: " .. math.min(apd2_data.x.bots, 21))
  CriminalsManager.MAX_NR_TEAM_AI = math.min(apd2_data.x.bots, 21)
  -- I hate how math.min is used to set a max value.
else
  log("[APD2>criminals] No bots unlocked.")
  CriminalsManager.MAX_NR_TEAM_AI = 0
end
CriminalsManager.MAX_NR_CRIMINALS = 22