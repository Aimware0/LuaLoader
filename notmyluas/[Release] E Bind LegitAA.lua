-- Scraped by chicken
-- Author: RageHvH
-- Title [Release] E Bind LegitAA
-- Forum link https://aimware.net/forum/thread/145528

local KEYBOX = gui.Keybox(gui.Reference("Ragebot", "Anti-Aim", "Advanced"),"rbot.ebind", "E legit AA", 0)
 
local function AA()
  if KEYBOX:GetValue() ~= 0 then
    if input.IsButtonDown(KEYBOX:GetValue()) then
      gui.SetValue("rbot.antiaim.base", 0)
      gui.SetValue("rbot.antiaim.advanced.pitch", 0)
    else
      gui.SetValue("rbot.antiaim.base", 180)
      gui.SetValue("rbot.antiaim.advanced.pitch", 2)
    end
  end
end

callbacks.Register("Draw", AA)