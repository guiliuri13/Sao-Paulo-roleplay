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
    local ped = PlayerPedId()
	if data == "contratar" then
	    TriggerServerEvent('patrao_contratar')
        ToggleActionMenu()		
	elseif data == "promover" then
	    TriggerServerEvent('patrao_promover')	
		ToggleActionMenu()
    elseif data == "demitir" then
		TriggerServerEvent('patrao_demitir')	
        ToggleActionMenu()	
	end
end)


---------------------------------------------------------------------------------------------------------------------------------------------
--LOCAIS
---------------------------------------------------------------------------------------------------------------------------------------------

local marcacoes = {
	{ 447.99829101562,-973.46228027344,30.689601898194 }
}
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			DrawMarker(27,x,y+0.33,z-0.90,0,0,0,0,180.0,130.0,2.0,2.0,1.0,25,25,122,50,0,0,0,0)
			if distance <= 1.2 then
			    DrawText3Ds(x,y,z, "PRESSIONE ~r~E~w~ PARA ABRIR O MENU DO PATRÃO")
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end