-- Scraped by chicken
-- Author: adrianobessa5682
-- Title [Release] Simple Night Mode
-- Forum link https://aimware.net/forum/thread/127599

print("Loaded Aimware Simple Night mode Lua by Starlordaiden")
local reference = gui.Reference("VISUALS", "WORLD", "Extra");
local exposure = gui.Slider(reference, "nex_bloom_exposure", "Night Mode", 100, 1, 100);
callbacks.Register("Draw", "Night Mode", function()
local controller = entities.FindByClass("CEnvTonemapController")[1];
if(controller) then
controller:SetProp("m_bUseCustomAutoExposureMin", 1);
controller:SetProp("m_bUseCustomAutoExposureMax", 1);

controller:SetProp("m_flCustomAutoExposureMin", exposure:GetValue()/100);
controller:SetProp("m_flCustomAutoExposureMax", exposure:GetValue()/100);
end
end)