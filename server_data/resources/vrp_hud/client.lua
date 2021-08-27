local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local hour = 0
local minute = 0
local month = ""
local dayOfMonth = 0
local proximity = 10.001
local voice = 2
local sBuffer = {}
local vBuffer = {}
local fan_belt = false
local ExNoCarro = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- DATA E HORA
-----------------------------------------------------------------------------------------------------------------------------------------
function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()
	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end

function CalculateDateToDisplay()
	month = GetClockMonth()
	dayOfMonth = GetClockDayOfMonth()
	ordinal = "th"
	if month == 0 then
		month = "Janeiro"
	elseif month == 1 then
		month = "Fevereiro"
	elseif month == 2 then
		month = "Março"
	elseif month == 3 then
		month = "Abril"
	elseif month == 4 then
		month = "Maio"
	elseif month == 5 then
		month = "Junho"
	elseif month == 6 then
		month = "Julho"
	elseif month == 7 then
		month = "Agosto"
	elseif month == 8 then
		month = "Sep"
	elseif month == 9 then
		month = "Outubro"
	elseif month == 10 then
		month = "Novembro"
	elseif month == 11 then
		month = "Dezembro"
	end

	if dayOfMonth == 1 or dayOfMonth == 21 then
		ordinal = "Dia"
	elseif dayOfMonth == 2 or dayOfMonth == 22 then
		ordinal = "Dia"
	elseif dayOfMonth == 3 then
		ordinal = "Dia"
	else
		ordinal = "Dia"
	end

end
-----------------------------------------------------------------------------------------------------------------------------------------
-- fan_css
-----------------------------------------------------------------------------------------------------------------------------------------
local fan_css = [[
	.div_fan {
		bottom: 3%;
		right: 2%;
		position: absolute;
	}
	.voice1 {
		background: #1081a8;
		border-radius: 3px;
		display: flex;
		justify-content: center;
		align-items: center;
		color: rgba(0, 0, 0, 0.6);
		height: 30px;
		width: 30px;
		float: left;
	}
	.voice2 {
		background: #aa8100;
		border-radius: 3px;
		display: flex;
		justify-content: center;
		align-items: center;
		color: rgba(0, 0, 0, 0.6);
		height: 30px;
		width: 30px;
		float: left;
	}
	.voice3 {
		background: #8c0e0e;
		border-radius: 3px;
		display: flex;
		justify-content: center;
		align-items: center;
		color: rgba(0, 0, 0, 0.6);
		height: 30px;
		width: 30px;
		float: left;
	}
	.life{
		height: 30px;
		width: 30px;
		background-color: #245824;
		position: relative;
		border-radius: 4px;
		float:left;
		margin-right: 10px;
	}
	
	.life .life-bar{
	   position: absolute;
	   bottom: 0;
	   background-color: #338133;
	   border-radius: 3px;
	   width: 100%
	}
	.life i {
		position: absolute;
		color: rgba(0, 0, 0, 0.6);
		width: 30px;
		height: 30px;
		text-align: center;
		font-size: 18px;
		line-height: 1.7;
	}
	.vest{
		height: 30px;
		width: 30px;
		background-color: #2e5163;
		position: relative;
		border-radius: 4px;
		float:left;
		margin-right: 10px;
		
	}
	.vest .vest-bar{
	   position: absolute;
	   bottom: 0;
	   background-color: #337896;
	   border-radius: 3px;
	   width: 100%;
	}
	.vest i {
		position: absolute;
		color: rgba(0, 0, 0, 0.6);
		width: 30px;
		height: 30px;
		text-align: center;
		font-size: 18px;
		line-height: 1.7;
	}
	.gas{
		height: 30px;
		width: 30px;
		background-color: #5d0b0b;
		position: relative;
		border-radius: 4px;
		float:left;
		margin-right: 10px;
	}
	
	.gas .gas-bar{
	   position: absolute;
	   bottom: 0;
	   background-color: #c32e2e;
	   border-radius: 3px;
	   width: 100%
	}
	.gas i {
		position: absolute;
		color: rgba(0, 0, 0, 0.6);
		width: 30px;
		height: 30px;
		text-align: center;
		font-size: 18px;
		line-height: 1.7;
	}
	.texto {
		margin-right: 12px;
		height: 32px;
		font-family: Arial;
		font-size: 13px;
		text-shadow: 1px 1px #000;
		color: rgba(255,255,255,0.5);
		text-align: right;
		line-height: 16px;
		float: left;
	}
	.texto b {
		color: rgba(255,255,255,0.7);
	}

	.div_InCar {
		bottom: 1%;
		left:3%;
		position: absolute;
	}
	
	.mph {
		height: 20px;
		width: 40px;
		background-color: #222;
		position: relative;
		border-radius: 2px;
		float:left;
		margin-right: 10px;
		font-family: Arial;
		font-size: 9px;
		text-shadow: 1px 1px #000;
		color: rgba(255,255,255,1);
	}

	.texto2 {
		font-family: Arial;
		font-size: 10px;
		text-shadow: 1px 1px #000;
		color: rgba(255,255,255,0.5);
		float: left;
		font-weight: 100;
	}
	.texto2 b {
		color: rgba(255,255,255,0.7);
	}


]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerSpawned",function()
--	NetworkSetTalkerProximity(proximity)
	vRP._setDiv("fan",fan_css,"")
end)

function UpdateOverlay()
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped,false))
	local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(x,y,z))
	CalculateTimeToDisplay()
	CalculateDateToDisplay()
	NetworkClearVoiceChannel()
--	NetworkSetTalkerProximity(proximity)
	local h = math.ceil((GetEntityHealth(ped)-100)/3)
	local a = GetPedArmour(ped) 
	local speed = GetEntitySpeed(GetVehiclePedIsIn(ped,false))
	local fuel = 0
	local fan_CarCSS = "none"

	if a == 0 then display = "none" else display = "block" end

	if fan_belt then BeltColor = "#90ba3c" else BeltColor = "white" end

	if IsPedInAnyVehicle(ped) then
		fuel = parseInt(GetVehicleFuelLevel(GetVehiclePedIsIn(ped,false)))
		fan_CarCSS = "block"
	else
		fan_CarCSS = "none"
	end

	vRP._setDivContent("fan","<div class=\"texto\"><b>"..ordinal.." "..dayOfMonth..", "..month.."</b>  -  "..hour..":"..minute.."    <br>Você esta em <b>"..street.."</b></div>                      <div class=\"life\"><div class=\"life-bar\" style=\"height: "..h.."%;\"></div><i class=\"fas fa-heart\"></i></div>                       <div class=\"vest\" style=\"display: "..display..";\"><div class=\"vest-bar\" style=\"height: "..a.."%;\"></div><i class=\"fas fa-shield-alt\"></i></div>         <div class=\"gas\" style=\"display: "..fan_CarCSS..";\"><div class=\"gas-bar\" style=\"height: "..fuel.."%;\"></div><i class=\"fas fa-gas-pump\"></i></div>                    <div class=\"voice"..voice.."\"><i class=\"fas fa-volume-up\"></i></div>")
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		UpdateOverlay()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(1,212) and GetEntityHealth(PlayerPedId()) > 100 then
			if proximity == 3.001 then
				voice = 2
				proximity = 10.001
			elseif proximity == 10.001 then
				voice = 3
				proximity = 25.001
			elseif proximity == 25.001 then
				voice = 1
				proximity = 3.001
			end
			UpdateOverlay()
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CINTO DE SEGURANÇA
-----------------------------------------------------------------------------------------------------------------------------------------
IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end	

Fwv = function (entity)
	local hr = GetEntityHeading(entity) + 90.0
	if hr < 0.0 then
		hr = 360.0 + hr
	end
	hr = hr * 0.0174533
	return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

local segundos = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local car = GetVehiclePedIsIn(ped)
		if car ~= 0 and (ExNoCarro or IsCar(car)) then
			ExNoCarro = true
			if fan_belt then
				DisableControlAction(0,75)
			end

			sBuffer[2] = sBuffer[1]
			sBuffer[1] = GetEntitySpeed(car)

			if sBuffer[2] ~= nil and not fan_belt and GetEntitySpeedVector(car,true).y > 1.0 and sBuffer[1] > 10.25 and (sBuffer[2] - sBuffer[1]) > (sBuffer[1] * 0.255) then
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityHealth(ped,GetEntityHealth(ped)-90)
				SetEntityVelocity(ped,vBuffer[2].x,vBuffer[2].y,vBuffer[2].z)
				vRP.ejectVehicle()
				segundos = 5
			end

			vBuffer[2] = vBuffer[1]
			vBuffer[1] = GetEntityVelocity(car)

			if IsControlJustReleased(1,47) then
				TriggerEvent("cancelando",true)
				if fan_belt then
					TriggerEvent("vrp_sound:source",'unbelt',0.5)
					SetTimeout(2000,function()
						fan_belt = false
						TriggerEvent("cancelando",false)
					end)
				else
					TriggerEvent("vrp_sound:source",'belt',0.5)
					SetTimeout(3000,function()
						fan_belt = true
						TriggerEvent("cancelando",false)
					end)
				end
			end
		elseif ExNoCarro then
			ExNoCarro = false
			fan_belt = false
			sBuffer[1],sBuffer[2] = 0.0,0.0
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RAGDOLL
---------------------------------------------------------------------------------------------------------------------------------------
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if segundos > 0 and GetEntityHealth(PlayerPedId()) > 100 then
			vRP._playAnim(false,{{"mini@cpr@char_b@cpr_str","cpr_kol_idle"}},true)
		end
	end
end)  ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- AGACHAR
-----------------------------------------------------------------------------------------------------------------------------------------
local agachar = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		DisableControlAction(0,36,true)
		if not IsPedInAnyVehicle(ped) then
			RequestAnimSet("move_ped_crouched")
			RequestAnimSet("move_ped_crouched_strafing")
			if IsDisabledControlJustPressed(0,36) then
				if agachar then
					ResetPedMovementClipset(ped,0.25)
					ResetPedStrafeClipset(ped)
					agachar = false
				else
					SetPedMovementClipset(ped,"move_ped_crouched",0.25)
					SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
					agachar = true
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x+width/2,y+height/2,width,height,r,g,b,a)
end

function drawTxt(x,y,scale,text,r,g,b,a)
	SetTextFont(4)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end