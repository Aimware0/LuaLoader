-- Scraped by chicken
-- Author: Chicken4676
-- Title [Release] noscope for auto
-- Forum link https://aimware.net/forum/thread/145534

local aim_automation_ref = gui.Reference( "Ragebot", "Aimbot", "Automation")
local enabled = gui.Checkbox(aim_automation_ref, "rbot.aim.dynamic.scope.enabled", "Dynamic Scope", true)
local scar_only = gui.Checkbox(aim_automation_ref, "rbot.aim.dynamic.scope.scar", "Dynamic scope - scar only", true)
local noscope_dist = gui.Slider(aim_automation_ref, "rbot.aim.dynamic.scope.distance", "No scope distance", 400, 1, 1500)
local noscope_dist_duck = gui.Slider(aim_automation_ref, "rbot.aim.dynamic.scope.distance", "No scope distance (duck)", 450, 1, 1500)


function is_crouching(player)
	return player:GetProp('m_flDuckAmount') > 0.95
end

function closest_to_crosshair()
	local lowest = math.huge			
	local x, y = draw.GetScreenSize()
	local mid_x = x / 2
	local mid_y = y / 2
	
	local closest = nil
	
	for k, v in pairs(entities.FindByClass("CCSPlayer")) do
		if v:GetIndex() ~= entities.GetLocalPlayer():GetIndex() and v:GetTeamNumber() ~= entities.GetLocalPlayer():GetIndex() and v:IsAlive() then
			local p_x, p_y = client.WorldToScreen(v:GetAbsOrigin())
			if  p_x and p_y then
				local dist = math.pow(mid_x - p_x, 2) + math.pow(mid_y - p_y, 2)
				if dist < lowest then
					closest = v
					lowest = dist
				end
			end
		end
	end
	return closest
end


local aimbot_target = nil
callbacks.Register("AimbotTarget", function(t)
	if t:GetIndex() then
		aimbot_target = t
	else
		aimbot_target = nil
	end
end)

local should_noscope = false

callbacks.Register("Draw", function()
	local me = entities.GetLocalPlayer()
	if not me then return end
	local closest_player = closest_to_crosshair()

	if enabled:GetValue() then
		local me_pos = me:GetAbsOrigin()
		local should_noscope = false

		if aimbot_target then
			local a_pos = aimbot_target:GetAbsOrigin()
			local dist = vector.Distance({me_pos.x, me_pos.y, me_pos.z}, {a_pos.x, a_pos.y, a_pos.z})
			should_noscope = dist <= noscope_dist:GetValue() or (is_crouching(me) and dist <= noscope_dist_duck:GetValue())

		elseif closest_player then
			local closest_pos = closest_player:GetAbsOrigin()
			local dist = vector.Distance({me_pos.x, me_pos.y, me_pos.z}, {closest_pos.x, closest_pos.y, closest_pos.z})
			should_noscope = dist <= noscope_dist:GetValue() or (is_crouching(me) and dist <= 450)
		end
		local me_wepid = me:GetWeaponID()
		if scar_only:GetValue() and me_wepid == 11 or me_wepid == 38 then
			if should_noscope then
				gui.SetValue("rbot.aim.automation.scope", 0)
			else
				gui.SetValue("rbot.aim.automation.scope", 2 )
			end
		elseif not scar_only:GetValue() then
			if should_noscope then
				gui.SetValue("rbot.aim.automation.scope", 0)
			else
				gui.SetValue("rbot.aim.automation.scope", 2)
			end
		else
			gui.SetValue("rbot.aim.automation.scope", 2)
		end
	end
end)


local function OnDrawESP( builder )
	if not enabled:GetValue() then return end
    local ent = builder:GetEntity()
	local ent_pos = ent:GetAbsOrigin()
	
   	local me = entities.GetLocalPlayer()
	local me_pos = me:GetAbsOrigin()	
	
	if ent:IsPlayer() and ent:IsAlive() and ent:GetTeamNumber() ~= entities.GetLocalPlayer():GetTeamNumber() then
		local dist = vector.Distance({me_pos.x, me_pos.y, me_pos.z}, {ent_pos.x, ent_pos.y, ent_pos.z})
		if dist <= noscope_dist:GetValue() or (is_crouching(me) and dist <= noscope_dist_duck:GetValue()) then
			builder:Color(0,255,0)
			builder:AddTextTop("Noscope: " .. string.format("%.0f", dist))
		end
	end
end
callbacks.Register( "DrawESP", OnDrawESP )
