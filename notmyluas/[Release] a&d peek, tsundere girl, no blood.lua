-- Scraped by chicken
-- Author: ambien55
-- Title [Release] a&d peek, tsundere girl, no blood
-- Forum link https://aimware.net/forum/thread/101443

local last_a, last_d = 0
callbacks.Register("CreateMove", function(cmd)
 local flags = entities.GetLocalPlayer():GetPropInt("m_fFlags")
 if flags == nil then return end
 local onground = (flags & 1) ~= 0
 
 if (not onground) then return end
 
 if (input.IsButtonDown(65) and input.IsButtonDown(68)) then
  if(last_a ~= nil and last_d ~= nil) then
   if(last_d < last_a) then
    cmd:SetSideMove(450)
   elseif(last_d > last_a) then
    cmd:SetSideMove(-450)
   end
  end
  return
 end
 
 if (input.IsButtonDown(65)) then
  last_a = globals.CurTime()
 end

 if (input.IsButtonDown(68)) then
  last_d = globals.CurTime()
 end
end)