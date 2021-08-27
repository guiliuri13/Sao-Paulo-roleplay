-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local aasdsadmenuactive = false
function ToggleActionMenu()
	aasdsadmenuactive = not aasdsadmenuactive
	if aasdsadmenuactive then
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
    if data == "AA1" then
		TriggerServerEvent('crz_mecanico:AA1')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "AA2" then
		TriggerServerEvent('crz_mecanico:AA2')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	
    elseif data == "AA3" then
		TriggerServerEvent('crz_mecanico:AA3')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)			
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 922.81481933594,-984.57440185546,39.753135681152 }
}
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			DrawMarker(27,x,y+0.33,z-0.90,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					TriggerServerEvent('crz_mecanico:permissao')
				end
			end
		end
	end
end)
RegisterNetEvent('crz_mecanico:permissao')
AddEventHandler('crz_mecanico:permissao',function()
    ToggleActionMenu()
end)