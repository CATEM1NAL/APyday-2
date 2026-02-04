if apd2_data.s then
    for i, value in ipairs(apd2_data.s) do
        SkillTreeManager:unlock(value)
    end
end