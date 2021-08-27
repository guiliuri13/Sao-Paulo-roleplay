local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_shownearestid")
vRP = Proxy.getInterface("vRP")


--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		nuserid = func.getNuserId()
	end
end)]]

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPedInAnyVehicle(PlayerPedId(), false) then
		css = [[
		.div_showid {
			font-size: 5px;
        	font-family:arial;
        	text-shadow: 1px 1px #000;
        	color: rgba(255,255,255,1);
        	position: absolute;
        	padding: 10px;
        	border-radius: 10px;
        	border-right: 3px solid rgba(255, 0, 0,0.8);
        	background-color: rgba(0,0,0,0.5);
        	bottom: 140px;
        	left: 20px;
		}
		
	else
		css = [[
		.div_showid {
			font-size: 5px;
        	font-family:arial;
        	text-shadow: 1px 1px #000;
        	color: rgba(255,255,255,1);
        	position: absolute;
        	padding: 10px;
        	border-radius: 10px;
        	border-right: 3px solid rgba(255, 0, 0,0.8);
        	background-color: rgba(0,0,0,0.5);
        	bottom: 20px;
        	left: 20px;
		}
		
	end
end]]

hud = true
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		menustate = GetPauseMenuState()
		if menustate > 0 then
			hud = false
		elseif menustate <= 0 then
			hud = true
		end		
	end
end)

gameversion = GetOnlineVersion()
print(gameversion)

sessionsolo = NetworkSessionIsSolo()
print(sessionsolo)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local nplayer = func.getNuserId()
		if hud and IsPedInAnyVehicle(PlayerPedId(), false) then
			vRP.setDiv("showid", css, "<h1 style='font-size: 10px;font-family:Roboto, sans-serif;font-style:italic;text-shadow: 1px 1px #000;color: rgba(255,255,255,1);position: absolute;padding: 10px;border-radius: 10px;border-right: 3px solid RGB(237, 127, 0);background-image: linear-gradient(90deg, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));;bottom: 1%;right: 15px; opacity:1.0; transition: opacity 2s'>ID PRÓXIMO: "..nplayer)
		elseif hud then
			vRP.setDiv("showid", css, "<h1 style='font-size: 10px;font-family:Roboto, sans-serif;font-style:italic;text-shadow: 1px 1px #000;color: rgba(255,255,255,1);position: absolute;padding: 10px;border-radius: 10px;border-right: 3px solid RGB(237, 127, 0);background-image: linear-gradient(90deg, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));;bottom: 1%;right: 15px; opacity:1.0; transition: opacity 2s'>ID PRÓXIMO: "..nplayer)
		elseif not hud then
			vRP.removeDiv("showid")	
		end	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end


function DrawText3D(x,y,z, text, scl, font, opacity) 
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
	local scale = (1/dist)*scl
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
   
	if onScreen then
		SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, opacity)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
	end
end