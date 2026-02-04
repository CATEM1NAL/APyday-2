Hooks:PostHook(NarrativeTweakData, "is_job_locked", "apd2_heists", function(self, job_id)
    if apd2_data.h and apd2_data.h[job_id] then
        log("Unlocking " .. job_id)
        return false
    else
        log("Locking " .. job_id)
        return true
    end
end)