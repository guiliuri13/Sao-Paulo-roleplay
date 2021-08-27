-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_survival",cRP)
vSERVER = Tunnel.getInterface("vrp_survival")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local deadplayer = false
local blockControls = false
local knockPlayer = false
local cooldown = 0
local fixCool = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(1000)
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
	end
end)


Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local ped = GetPlayerPed(-1)
		if GetEntityHealth(ped) <= 101 then
			if not deadplayer then
				deadplayer = true
				local x,y,z = table.unpack(GetEntityCoords(ped))
				NetworkResurrectLocalPlayer(x,y,z,true,true,false)
				SendNUIMessage({setDisplay = true, playSound = true})
				SetTimecycleModifier("rply_vignette")
				SetTimecycleModifierStrength(0.999)
				SetEntityHealth(ped,101)
				SetEntityInvincible(ped,true)
				if IsPedInAnyVehicle(ped) then
					TaskLeaveVehicle(ped,GetVehiclePedIsIn(ped),4160)
				end
				createCam()
				vRP._stopAnim(false)
				TriggerServerEvent("ripPostit")
				TriggerEvent("radio:outServers")
			else
				SetPedArmour(ped,0)
				SetEntityHealth(ped,101)
				if not IsEntityPlayingAnim(ped,"misslamar1dead_body","dead_idle",3) then
					vRP.playAnim(false,{{"misslamar1dead_body","dead_idle"}},true)
				end
			end
		end
		Citizen.Wait(5)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("fixNUI",function(data,cb)
	CreateThread( function()
		while true do
			if IsControlJustPressed(0,38) and GetEntityHealth(PlayerPedId()) <= 101 then
				cRP.finishPlayer()
				break
			end
			if IsControlJustPressed(0,49) and GetEntityHealth(PlayerPedId()) <= 101 then
				if cooldown <= 0 then
					cooldown = 300
					local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
					TriggerServerEvent("vrp_survival:callServices",x,y,z)
					TriggerEvent("Notify","aviso","Você chamou um paramédico, aguarde no local.",10000)
					break
				else
					TriggerEvent("Notify","aviso","Você deve aguardar "..cooldown.." segundos para chamar um paramédico novamente.",10000)
				end
			end
			if GetEntityHealth(PlayerPedId()) > 200 then
				break
			end
			Wait(0)
		end	
	end)	
end)

function createCam()
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamActive(cam, true)
    RenderScriptCams(1, 1, 5000, 1, 1)
    AttachCamToPedBone(cam, PlayerPedId(), 31085, 0, 0, 1.0 , true)
    SetCamFov(cam, 90.0)
    SetCamRot(cam, -90.0, 0.0, GetEntityHeading(PlayerPedId()), true)
    return
end

function deleteCam()
    RenderScriptCams(0, 1, 2000, 1, 1)
    DestroyCam(cam, false)
    return
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEALTHRECHARGE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		SetPlayerHealthRechargeMultiplier(PlayerId(),0)
		Citizen.Wait(100)
	end
end)




-----------------------------------------------------------------------------------------------------------------------------------------
-- DEADPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deadPlayer()
	return deadplayer
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEADTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deadTimer()
	if deadplayer then
		return true
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEADPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.finishPlayer()
	local ped = GetPlayerPed(-1)
	deadplayer = false
	deleteCam()
	SetTimecycleModifier()
	SendNUIMessage({ setDisplay = false, playSound = false})
	ClearPedBloodDamage(ped)
	TriggerEvent("resetBleeding")
	TriggerEvent("resetDiagnostic")
	TriggerServerEvent("clearInventory")
	SetEntityInvincible(ped,false)
	DoScreenFadeOut(1000)
	SetEntityHealth(ped,400)
	Citizen.Wait(1000)
	TriggerEvent("vrp_survival:endNui")
	SetEntityCoords(ped,374.76,-598.16,28.81,1,0,0,1)
	SetTimeout(5000,function()
		DoScreenFadeIn(1000)
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVIVEGOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.reviveGod(health)
	local ped = GetPlayerPed(-1)
	deleteCam()
	SetTimecycleModifier()
	SetEntityHealth(ped,health)
	SetEntityInvincible(ped,false)
	SendNUIMessage({ setDisplay = false, playSound = false})
	if deadplayer then
		deadplayer = false
		blockControls = true
		vRP.playAnim(false,{{"amb@world_human_stupor@male@base","base"}},true)
		Citizen.Wait(10000)
		blockControls = false
		vRP._stopAnim(false)
	end
	TriggerEvent("resetBleeding")
	TriggerEvent("resetDiagnostic")
	TriggerEvent("vrp_survival:endNui")
end

function cRP.setHealth(health)
	SetEntityHealth(PlayerPedId(),parseInt(health))
end

------------------------------------------------------------------------------------------------------------------------------------
-- REVIVEPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.revivePrison()
	local ped = GetPlayerPed(-1)
	if GetEntityHealth(ped) <= 101 then
		deadplayer = false
		deleteCam()
		SetTimecycleModifier()
		SetEntityHealth(ped,110)
		SetEntityInvincible(ped,false)
		TriggerEvent("resetBleeding")
		TriggerEvent("resetDiagnostic")
		SendNUIMessage({ setDisplay = false, playSound = false})
		TriggerEvent("vrp_survival:endNui")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKCONTROLS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local yume = 1000
		if blockControls or deadplayer then
			yume = 4
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,23,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,75,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,32,true)
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true)
			DisableControlAction(0,271,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,183,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,113,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,168,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
		end
		Citizen.Wait(yume)
	end
end)