-- Scraped by chicken
-- Author: leexx
-- Title [Release] Disable Panorama Blur
-- Forum link https://aimware.net/forum/thread/116716

local S,e=client.SetConVar,gui.Checkbox(gui.Reference("VISUALS","Shared"), 'lua_disable_panorama_blur', 'Disable Panorama Blur', false)

callbacks.Register('Draw',function()
 S('@panorama_disable_blur', e:GetValue() and 1 or 0, true)
end)



