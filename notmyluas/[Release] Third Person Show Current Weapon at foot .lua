-- Scraped by chicken
-- Author: 2878713023
-- Title  [Release] Third Person Show Current Weapon at foot 
-- Forum link https://aimware.net/forum/thread/147614

--Partofthecodecomesfromtheawforum
--AuthorQi

localwidtext_reference=gui.Reference("Visuals","Overlay","Weapon")
localwidtext_checkbox=gui.Checkbox(widtext_reference,"local.weapon.text","LocalWeapon",0)
localwidtext_clr=gui.ColorPicker(widtext_checkbox,"clr","name",255,255,255,255)
widtext_checkbox:SetDescription("Displaysthecurrentweapontextatthefoot.")

localfont=draw.CreateFont('SegoeUI',20,1000)

localfunctionpredict_velocity(entity,prediction_amount)

localabsVelocity={0,0,0}
localpos_={entity:GetAbsOrigin()}
localmodifed_velocity={vector.Multiply({0,0,0})}
return{vector.Subtract({vector.Add(pos_,modifed_velocity)},{0,0,0})}
end


localfunctionPlayersFilter(fn)
localvalid={}
fork,playerinpairs(entities.FindByClass("CCSPlayer"))do
iffnandfn(player)then
table.insert(valid,player)
end
end
returnvalid
end


callbacks.Register("Draw",function()

localLocalPlayer=entities.GetLocalPlayer()
localhp=LocalPlayer:GetHealth()
ifLocalPlayerthen
ifhp~=0then
ifwidtext_checkbox:GetValue()andgui.GetValue('esp.local.thirdperson')then
localmy_pos=LocalPlayer:GetAbsOrigin()
localprediction=predict_velocity(LocalPlayer)
localx,y,z=vector.Add(
{my_pos.x,my_pos.y,my_pos.z},
{prediction[1],prediction[2],prediction[3]}
)

localprediction=Vector3(x,y,z)

localplayers=PlayersFilter(function(player)
localtr=engine.TraceLine(prediction,
player:GetAbsOrigin()+Vector3(0,0,0)
)
return
trandtr.entityandtr.entity:IsPlayer()and
tr.entity:GetTeamNumber()~=LocalPlayer:GetTeamNumber()
end)

localwid=LocalPlayer:GetWeaponID();
ifwid==1then
widtext='DesertEagle'
elseifwid==2then
widtext='DualBerettas'
elseifwid==3then
widtext='Five-SeveN'
elseifwid==4then
widtext='Glock-18'
elseifwid==7then
widtext='AK-47'
elseifwid==8then
widtext='AUG'
elseifwid==9then
widtext='AWP'
elseifwid==10then
widtext='FAMAS'
elseifwid==11then
widtext='G3SG1'
elseifwid==13then
widtext='GalilAR'
elseifwid==14then
widtext='M249'
elseifwid==16then
widtext='M4A4'
elseifwid==17then
widtext='MAC-10'
elseifwid==19then
widtext='P90'
elseifwid==23then
widtext='MP5-SD'
elseifwid==24then
widtext='UMP-45'
elseifwid==25then
widtext='XM1014'
elseifwid==26then
widtext='PP-Bizon'
elseifwid==27then
widtext='MAG-7'
elseifwid==28then
widtext='Negev'
elseifwid==29then
widtext='Sawed-Off'
elseifwid==30then
widtext='Tec-9'
elseifwid==31then
widtext='Zeusx27'
elseifwid==32then
widtext='P2000'
elseifwid==33then
widtext='MP7'
elseifwid==34then
widtext='MP9'
elseifwid==35then
widtext='Nova'
elseifwid==36then
widtext='P250'
elseifwid==37then
widtext='BallisticShield'
elseifwid==38then
widtext='SCAR-20'
elseifwid==39then
widtext='SG553'
elseifwid==40then
widtext='SSG08'
elseifwid==41then
widtext='Knife'
elseifwid==42then
widtext='Knife'
elseifwid==43then
widtext='Flashbang'
elseifwid==44then
widtext='Grenade'
elseifwid==45then
widtext='Smoke'
elseifwid==46then
widtext='Molotov'
elseifwid==47then
widtext='Decoy'
elseifwid==48then
widtext='Incendiary'
elseifwid==49then
widtext='C4'
elseifwid==57then
widtext='Medi-Shot'
elseifwid==59then
widtext='Knife'
elseifwid==60then
widtext='M4A1-S'
elseifwid==61then
widtext='USP-S'
elseifwid==62then
widtext='TradeUpContract'
elseifwid==63then
widtext='CZ75'
elseifwid==64then
widtext='Revolver'
elseifwid==68then
widtext='TacticalAwareness'
elseifwid==69then
widtext='BareHands'
elseifwid==70then
widtext='BreachCharge'
elseifwid==72then
widtext='Tablet'
elseifwid==75then
widtext='Axe'
elseifwid==76then
widtext='Hammer'
elseifwid==78then
widtext='Wrench'
elseifwid==81then
widtext='FireBomb'
elseifwid==82then
widtext='DiversionDevice'
elseifwid==83then
widtext='FragGrenade'
elseifwid==85then
widtext='BumpMine'
elseifwid==500then
widtext='Bayonet'
elseifwid==503then
widtext='ClassicKnife'
elseifwid==505then
widtext='FlipKnife'
elseifwid==506then
widtext='GutKnife'
elseifwid==507then
widtext='Karambit'
elseifwid==508then
widtext='M9Bayonet'
elseifwid==509then
widtext='HuntsmanKnife'
elseifwid==512then
widtext='FalchionKnife'
elseifwid==514then
widtext='BowieKnife'
elseifwid==515then
widtext='ButterflyKnife'
elseifwid==516then
widtext='ShadowDaggers'
elseifwid==517then
widtext='ParacordKnife'
elseifwid==518then
widtext='SurvivalKnife'
elseifwid==519then
widtext='UrsusKnife'
elseifwid==520then
widtext='NavajaKnife'
elseifwid==521then
widtext='NomadKnife'
elseifwid==522then
widtext='StilettoKnife'
elseifwid==523then
widtext='TalonKnife'
elseifwid==525then
widtext='SkeletonKnife'
end

localx2,y2=client.WorldToScreen(prediction)
localw,h=draw.GetTextSize(widtext);
localx2_1=x2-(w/2)
localr,g,b,a=widtext_clr:GetValue()

draw.SetFont(font)
draw.Color(14,14,14,a)
draw.Text(x2_1+1,y2*1.06+1,widtext)
draw.Color(r,g,b,a)
draw.Text(x2_1,y2*1.06,widtext)
end
end
end
end)

