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
	if data == "HTMLVIP1" then
	    TriggerServerEvent('nav_vip:vip1')
        ToggleActionMenu()		
	elseif data == "HTMLVIP2" then
	    TriggerServerEvent('nav_vip:vip2')	
		ToggleActionMenu()
    elseif data == "HTMLVIP3" then
		TriggerServerEvent('nav_vip:vip3')	
        ToggleActionMenu()	
    elseif data == "HTMLVIP4" then
	    TriggerServerEvent('nav_vip:vip4')	
		ToggleActionMenu()
    elseif data == "HTMLVIP5" then
	    TriggerServerEvent('nav_vip:vip5')	
		ToggleActionMenu()
    elseif data == "HTMLVIP6" then
	    TriggerServerEvent('nav_vip:vip6')	
		ToggleActionMenu()		
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ -268.40411376953,-957.13928222656,31.22313117981 }
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
			    DrawText3Ds(x,y,z, "COMPRA DE VIPS - PRESSIONE ~r~E~w~ PARA ACESSAR O MENU")
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