local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")


vRP = Proxy.getInterface("vRP")
contrab = Tunnel.getInterface("contrabando")

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
	if data == "utilidades-comprar-lockpick" then
		TriggerServerEvent("contrabando-comprar","lockpick")
--	elseif data == "utilidades-comprar-laptop" then
--		TriggerServerEvent("contrabando-comprar","laptop")
--	elseif data == "utilidades-comprar-c4" then
--		TriggerServerEvent("contrabando-comprar","c4")
--	elseif data == "utilidades-comprar-pendrive" then
--		TriggerServerEvent("contrabando-comprar","pendrive")
	elseif data == "utilidades-comprar-rebite" then
		TriggerServerEvent("contrabando-comprar","rebite")
	elseif data == "utilidades-comprar-placa" then
		TriggerServerEvent("contrabando-comprar","placa")

	elseif data == "utilidades-vender-lockpick" then
		TriggerServerEvent("contrabando-vender","lockpick")
--	elseif data == "utilidades-vender-pendrive" then
--		TriggerServerEvent("contrabando-vender","pendrive")
	elseif data == "utilidades-vender-rebite" then
		TriggerServerEvent("contrabando-vender","rebite")
	elseif data == "utilidades-vender-placa" then
		TriggerServerEvent("contrabando-vender","placa")

	elseif data == "AA1" then
		TriggerServerEvent('crz_vanilla:AA1')
	--	PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
	elseif data == "AA2" then
		TriggerServerEvent('crz_vanilla:AA2')
	--	PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	
	elseif data == "AA3" then
		TriggerServerEvent('crz_vanilla:AA3')
	--	PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
	elseif data == "AA4" then
		TriggerServerEvent('crz_vanilla:AA4')
	--	PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	
	elseif data == "AA5" then
		TriggerServerEvent('crz_vanilla:AA5')
	--	PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1561.5983886718,-2433.9072265625,84.076866149902,true)
		if distance <= 30 then
			DrawMarker(23,1561.5983886718,-2433.9072265625,84.076866149902-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
			if distance <= 1.1 then
				if IsControlJustPressed(0,38) and contrab.checkPermission() then
					ToggleActionMenu()
				end
			end
		end
	end
end)