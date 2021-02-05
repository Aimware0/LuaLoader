-- Scraped by chicken
-- Author: Chicken4676
-- Title [Release] Fake Duck indicator [V5]
-- Forum link https://aimware.net/forum/thread/128456

local storedTick = 0
local crouched_ticks = { }


local function toBits(num)
  local t = { }
  while num > 0 do
    rest = math.fmod(num,2)
    t[#t+1] = rest
    num = (num-rest) / 2
  end

  return t
end

callbacks.Register("DrawESP", "FD_Indicator", function(Builder)
  local g_Local = entities.GetLocalPlayer()
  local Entity = Builder:GetEntity()

 

  if g_Local == nil or Entity == nil or not Entity:IsAlive() then
    return
  end

  local index = Entity:GetIndex()
  local m_flDuckAmount = Entity:GetProp("m_flDuckAmount")
  local m_flDuckSpeed = Entity:GetProp("m_flDuckSpeed")
  local m_fFlags = Entity:GetProp("m_fFlags")

  if crouched_ticks[index] == nil then
    crouched_ticks[index] = 0
  end

  if m_flDuckSpeed ~= nil and m_flDuckAmount ~= nil then
    if m_flDuckSpeed == 8 and m_flDuckAmount <= 0.9 and m_flDuckAmount > 0.01 and toBits(m_fFlags)[1] == 1 then
      if storedTick ~= globals.TickCount() then
        crouched_ticks[index] = crouched_ticks[index] + 1
        storedTick = globals.TickCount()
      end

      if crouched_ticks[index] >= 5 then
        Builder:Color(255, 255, 0, 255)
        Builder:AddTextRight("Fake Duck")
      end
    else
      crouched_ticks[index] = 0
    end
  end
end)