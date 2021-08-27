-- BY DON SPEED
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

local ped = PlayerPedId()
	RemoveAllPedWeapons(ped,true)
	TriggerServerEvent('nav_hospital:colete')
	
	
	
RegisterNUICallback("ButtonClick",function(data,cb)
    local ped = PlayerPedId()
	if data == "morf" then
		TriggerServerEvent('nav_hospital:morfina')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "des" then
		TriggerServerEvent('nav_hospital:des')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "band" then
		TriggerServerEvent('nav_hospital:band')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "rem" then
		TriggerServerEvent('nav_hospital:rem')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)		
	elseif data == "dev" then
		TriggerServerEvent('nav_hospital:dev')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
        ToggleActionMenu()		
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)

local marcacoes = {
	{ 345.7339477539,-574.97961425782,43.281593322754 }
}
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			DrawMarker(25,x,y+0.33,z-0.90,0,0,0,0,180.0,130.0,2.0,2.0,1.0,25,25,122,50,0,0,0,0)
			--drawTxt("PRESSIONE  ~b~E~w~  PARA ACESSAR O ARSENAL",4,0.5,0.93,0.50,255,255,255,180)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					TriggerServerEvent('nav_hospital:permissao')
				end
			end
		end
	end
end)
RegisterNetEvent('nav_hospital:permissao')
AddEventHandler('nav_hospital:permissao',function()
    ToggleActionMenu()
end)
RegisterNetEvent('tratamentomorfina')
AddEventHandler('tratamentomorfina',function()
	repeat
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1)
		Citizen.Wait(1000)
	until GetEntityHealth(PlayerPedId()) >= 151 or GetEntityHealth(PlayerPedId()) <= 51
		TriggerEvent("Notify","sucesso","Tratamento concluido.")
end)
RegisterNetEvent('tratamentoremedio')
AddEventHandler('tratamentoremedio',function()
	repeat
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1)
		Citizen.Wait(600)
	until GetEntityHealth(PlayerPedId()) >= 200 or GetEntityHealth(PlayerPedId()) <= 100
		TriggerEvent("Notify","sucesso","Tratamento concluido.")
end)
-- ===============================================================================================================================================

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,121) then
			TriggerServerEvent("reanimar:jogador")
		end
	end
end)