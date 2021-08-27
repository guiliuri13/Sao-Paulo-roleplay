-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local asasdsadmenuactive = false
function ToggleActionMenu()
	asasdsadmenuactive = not asasdsadmenuactive
	if asasdsadmenuactive then
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
		TriggerServerEvent('crz_vanilla:AA1')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "AA2" then
		TriggerServerEvent('crz_vanilla:AA2')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	
    elseif data == "AA3" then
		TriggerServerEvent('crz_vanilla:AA3')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "AA4" then
		TriggerServerEvent('crz_vanilla:AA4')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	
    elseif data == "AA5" then
		TriggerServerEvent('crz_vanilla:AA5')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)			
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 95.825393676758,-1294.3837890625,29.268741607666 }
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
					TriggerServerEvent('crz_vanilla:permissao')
				end
			end
		end
	end
end)
RegisterNetEvent('crz_vanilla:permissao')
AddEventHandler('crz_vanilla:permissao',function()
    ToggleActionMenu()
end)