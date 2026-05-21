Hooks:PostHook(SecurityLockGui, "_start", "CrimDawn_StartSecurityLockGUI", function(self, _, timer)
  if CrimDawn.OnFinalHeist() then return end
  local TimerMult = math.min(Global.CrimDawn.data.game.progression_items * 2, 99)
  TimerMult = 1 - (TimerMult / 100)

  self._timer = self._timer * TimerMult
  self._current_timer = self._current_timer * TimerMult
end)