if apd2_data and apd2_data.x and apd2_data.x["bots"] then
    log("Bot count: " .. math.min(apd2_data.x["bots"], 22))
    CriminalsManager.MAX_NR_TEAM_AI = math.min(apd2_data.x["bots"], 22)
else
    log("No bots unlocked.")
    CriminalsManager.MAX_NR_TEAM_AI = 0
end
CriminalsManager.MAX_NR_CRIMINALS = 22