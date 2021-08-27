-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local ddasdas = false
function ToggleActionMenu()
	ddasdas = not ddasdas
	if ddasdas then
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
		TriggerServerEvent('crz_parts:AA1')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "AA2" then
		TriggerServerEvent('crz_parts:AA2')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	
    elseif data == "AA3" then
		TriggerServerEvent('crz_parts:AA3')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)			
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 725.70892333984,-1066.8127441406,28.31100654602 }
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
					TriggerServerEvent('crz_parts:permissao')
				end
			end
		end
	end
end)
RegisterNetEvent('crz_parts:permissao')
AddEventHandler('crz_parts:permissao',function()
    ToggleActionMenu()
end)