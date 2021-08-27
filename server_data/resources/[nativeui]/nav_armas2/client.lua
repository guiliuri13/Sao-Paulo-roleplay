
local gfdhgfdggdfgfdg = false
function ToggleActionMenu()
	gfdhgfdggdfgfdg = not gfdhgfdggdfgfdg
	if gfdhgfdggdfgfdg then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end

RegisterNUICallback("ButtonClick",function(data,cb)
    local ped = PlayerPedId()
	if data == "ROTAglockarma" then
	    PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		 TriggerServerEvent('nav_arsenalrota:Arsenal', 1)
	elseif data == "ROTAibelarma" then
	    TriggerServerEvent('nav_arsenalrota:Arsenal', 2)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "ROTAcoleteprotecao" then
		TriggerServerEvent('nav_arsenalrota:colete')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "ROTAparafalarma" then
	    TriggerServerEvent('nav_arsenalrota:Arsenal', 3)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "ROTAsarma" then
	     TriggerServerEvent('nav_arsenalrota:Arsenal', 4)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "ROTAdevolverarma" then
		TriggerServerEvent('nav_arsenalrota:zerocolete')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		Citizen.Wait(1000)
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"))
   	    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"))
		
  --[[  elseif data == "ROTAcacetetearma" then
	    TriggerServerEvent('nav_arsenalrota:Arsenal', 5)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "ROTAlarma" then
	     TriggerServerEvent('nav_arsenalrota:Arsenal', 6)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	]]
    elseif data == "ROTAtarma" then
	     TriggerServerEvent('nav_arsenalrota:Arsenal', 7)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)			
	elseif data == "ROTAfechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local dsmarcacoes = {
	{ -2048.8989257813,-456.32824707031,16.424406051636 }
}
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		for _,mark in pairs(dsmarcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			DrawMarker(27,x,y+0.33,z-0.90,0,0,0,0,180.0,130.0,2.0,2.0,1.0,25,25,122,50,0,0,0,0)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					TriggerServerEvent('nav_arsenalrota:permissao')
				end
			end
		end
	end
end)
RegisterNetEvent('nav_arsenalrota:permissao')
AddEventHandler('nav_arsenalrota:permissao',function()
    ToggleActionMenu()
end)
local ROTArma = { 
   [1] = { ['C'] = "WEAPON_COMBATPISTOL"},
   [2] = { ['C'] = "WEAPON_CARBINERIFLE" },
   [3] = { ['C'] = "WEAPON_SPECIALCARBINE" },
   [4] = { ['C'] = "WEAPON_PUMPSHOTGUN_MK2"},
   [5] = { ['C'] = "WEAPON_NIGHTSTICK"},
   [6] = { ['C'] = "WEAPON_FLASHLIGHT" },
   [7] = { ['C'] = "WEAPON_STUNGUN" }
}
RegisterNetEvent('ROTA:EquiparItens')
AddEventHandler('ROTA:EquiparItens',function(idDon, quantidade)
	GiveWeaponToPed(PlayerPedId(),GetHashKey(ROTArma[idDon].C),parseInt(quantidade),0,0)
	PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
	ToggleActionMenu()
end)
RegisterNetEvent('nav_arsenalrota:EquiparLanterna')
AddEventHandler('nav_arsenalrota:EquiparLanterna',function()
    local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),1,0,0)
	TriggerEvent("Notify","sucesso","Equipado.")
end)
RegisterNetEvent('nav_arsenalrota:EquiparAcetete')
AddEventHandler('nav_arsenalrota:EquiparAcetete',function()
    local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),1,0,0)
	TriggerEvent("Notify","sucesso","Equipado.")
end)