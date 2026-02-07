Hooks:PostHook(NarrativeTweakData, "is_job_locked", "apd2_heists", function(self, job_id)
    if apd2_data.heists and apd2_data.heists[job_id] then
        log("Unlocking " .. job_id)
        return false
    else
        log("Locking " .. job_id)
        return true
    end
end)