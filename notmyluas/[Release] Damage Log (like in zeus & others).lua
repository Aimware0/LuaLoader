-- Scraped by chicken
-- Author: uffjaa
-- Title [Release] Damage Log (like in zeus & others)
-- Forum link https://aimware.net/forum/thread/88656


function HitGroup( INT_HITGROUP )
  if INT_HITGROUP == nil then 
    return;
  elseif INT_HITGROUP == 0 then
    return "body";
  elseif INT_HITGROUP == 1 then
    return "head";
  elseif INT_HITGROUP == 2 then
    return "chest";
  elseif INT_HITGROUP == 3 then
    return "belly";
  elseif INT_HITGROUP == 4 then 
    return "left arm";
  elseif INT_HITGROUP == 5 then 
    return "right arm";
  elseif INT_HITGROUP == 6 then 
    return "left leg";
  elseif INT_HITGROUP == 7 then 
    return "right leg";
  elseif INT_HITGROUP == 10 then 
    return "body";
  end
end

local urmom_gay = {};
local time_until_each_fucking_thing_disappears = 5;
local number_of_little_squares_between_each_line = 10;
local textOffsetX = 5;
local textOffsetY = 2;

local function onAction(Event)
  local eventType = Event:GetName()

  if eventType == 'player_hurt' then
    local pLocal = client.GetLocalPlayerIndex();
    local iAttacker = client.GetPlayerIndexByUserID(Event:GetInt('attacker'));
    local victimName = client.GetPlayerNameByUserID(Event:GetInt('userid'));
    local i_wonder_where_did_that_bullet_hit = Event:GetInt('hitgroup');
    local damage = Event:GetInt('dmg_health');
    
    if pLocal == iAttacker then
      table.insert(urmom_gay, {globals.RealTime(), victimName, HitGroup(i_wonder_where_did_that_bullet_hit), damage,
      math.max(0, entities.GetByUserID(Event:GetInt('userid')):GetHealth() - damage)});
      print("hit");
    end
    
  elseif eventType == 'round_start' then
    urmom_gay = {}
  end
end

local function onDraw()
  local amount_of_things_currently_on_the_screen_lol = 0;
  
  for i, j in pairs(urmom_gay) do    
    if globals.RealTime() > j[1] + time_until_each_fucking_thing_disappears then
      table.remove(urmom_gay, i);
    else
      draw.Text(textOffsetX, amount_of_things_currently_on_the_screen_lol * number_of_little_squares_between_each_line + textOffsetY, string.format( "Hit %s in the %s for %s damage (%s health remaining)",
      j[2], j[3], j[4], j[5]))
      draw.TextShadow(textOffsetX, amount_of_things_currently_on_the_screen_lol * number_of_little_squares_between_each_line + textOffsetY, string.format( "Hit %s in the %s for %s damage (%s health remaining)",
      j[2], j[3], j[4], j[5]))
      amount_of_things_currently_on_the_screen_lol = amount_of_things_currently_on_the_screen_lol + 1;
    end
  end
  
end


client.AllowListener('round_start')
client.AllowListener('player_hurt')
callbacks.Register('FireGameEvent', 'onAction', onAction)
callbacks.Register('Draw', 'onDraw', onDraw)