local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	local vehicle = vRP.getNearestVehicle(7)
	if data == "extra01" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),1)
	elseif data == "extra02" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),2)
	elseif data == "extra03" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),3)
	elseif data == "extra04" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),4)
	elseif data == "extra05" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),5)
	elseif data == "extra06" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),6)
	elseif data == "extra07" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),7)
	elseif data == "extra08" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),8)
	elseif data == "extra09" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),9)
	elseif data == "extra10" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),10)
	elseif data == "extra11" then
		TriggerServerEvent("tryextras",VehToNet(vehicle),11)
	elseif data == "toogle" then
		if GetVehicleLivery(vehicle) == 0 then
			SetVehicleLivery(vehicle,1)
		elseif GetVehicleLivery(vehicle) == 1 then
			SetVehicleLivery(vehicle,0)
		end
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('extras')
AddEventHandler('extras',function()
	ToggleActionMenu()
end)

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCEXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncextras")
AddEventHandler("syncextras",function(index,extra)
	Citizen.CreateThread(function()
		if NetworkDoesNetworkIdExist(index) then
			local v = NetToVeh(index)
			if DoesExtraExist(v,extra) then
				if IsVehicleExtraTurnedOn(v,extra) then
					SetVehicleExtra(v,extra,true)
				else
					SetVehicleExtra(v,extra,false)
				end
			end
		end
	end)
end)