
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

RegisterNUICallback("ButtonClick",function(data,cb)
    local ped = PlayerPedId()
	if data == "glockarma" then
	    PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		 TriggerServerEvent('nav_armaspm:Arsenal', 1)
	elseif data == "ibelarma" then
	    TriggerServerEvent('nav_armaspm:Arsenal', 2)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "coleteprotecao" then
		TriggerServerEvent('nav_armaspm:colete')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "parafalarma" then
	    TriggerServerEvent('nav_armaspm:Arsenal', 3)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "sarma" then
	     TriggerServerEvent('nav_armaspm:Arsenal', 4)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "devolverarma" then
		TriggerServerEvent('nav_armaspm:zerocolete')
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		Citizen.Wait(1000)
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"))
   	    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"))
		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"))
		
    elseif data == "cacetetearma" then
	    TriggerServerEvent('nav_armaspm:Arsenal', 5)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
    elseif data == "larma" then
	     TriggerServerEvent('nav_armaspm:Arsenal', 6)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)	
    elseif data == "tarma" then
	     TriggerServerEvent('nav_armaspm:Arsenal', 7)
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)			
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 460.20913696289,-981.26800537109,30.689661026001 }
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
				if IsControlJustPressed(0,38) then
					TriggerServerEvent('nav_armaspm:permissao')
				end
			end
		end
	end
end)
RegisterNetEvent('nav_armaspm:permissao')
AddEventHandler('nav_armaspm:permissao',function()
    ToggleActionMenu()
end)
local NameArmaa = { 
   [1] = { ['C'] = "WEAPON_COMBATPISTOL"},
   [2] = { ['C'] = "WEAPON_CARBINERIFLE" },
   [3] = { ['C'] = "WEAPON_SPECIALCARBINE" },
   [4] = { ['C'] = "WEAPON_PUMPSHOTGUN_MK2"},
   [5] = { ['C'] = "WEAPON_NIGHTSTICK"},
   [6] = { ['C'] = "WEAPON_FLASHLIGHT" },
   [7] = { ['C'] = "WEAPON_STUNGUN" }
}
RegisterNetEvent('nav_armaspm:equipar')
AddEventHandler('nav_armaspm:equipar',function(idDon, quantidade)

	GiveWeaponToPed(PlayerPedId(),GetHashKey(NameArmaa[idDon].C),parseInt(quantidade),0,0)
	PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
	ToggleActionMenu()
end)
RegisterNetEvent('nav_armaspm:equiparlanterna')
AddEventHandler('nav_armaspm:equiparlanterna',function()
    local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("weapon_nightstick"),1,0,0)
end)
RegisterNetEvent('nav_armaspm:equiparca')
AddEventHandler('nav_armaspm:equiparca',function()
    local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("weapon_flashlight"),1,0,0)
end)