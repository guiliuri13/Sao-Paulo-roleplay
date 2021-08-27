-- By Don_Speed    -      Don_Speed#6282
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")

local dsBlipM = nil
local dsTrabalhoM = false
local dsRotaIDM = nil

local dsMaconha = {
	[1] = { ['x'] = -1158.98 , ['y'] = 481.90 , ['z'] = 86.09 , ['qtd'] = 2 , ['valor'] = 1500 },
	[2] = { ['x'] = -1219.55 , ['y'] = -1435.43 , ['z'] = 4.32 , ['qtd'] = 2 , ['valor'] = 1500 },
	[3] = { ['x'] = -1945.03 , ['y'] = -548.32 , ['z'] = 14.72 , ['qtd'] = 2 , ['valor'] = 1500 } ,
	[4] = { ['x'] = -3193.65 , ['y'] = 1208.50 , ['z'] = 9.42 , ['qtd'] = 2 , ['valor'] = 1500 }, 
	[5] = { ['x'] = -1516.63 , ['y'] = 851.37 , ['z'] = 181.59 , ['qtd'] = 2 , ['valor'] = 1500 },
	[6] = { ['x'] = 2515.64 , ['y'] = 4203.43 , ['z'] = 40.00 , ['qtd'] = 2 , ['valor'] = 1500 },
	[7] = { ['x'] = 2029.74 , ['y'] = 4980.68 , ['z'] = 42.09 , ['qtd'] = 2 , ['valor'] = 1500 },
	[8] = { ['x'] = -215.02 , ['y'] = 6444.29 , ['z'] = 31.31 , ['qtd'] = 2 , ['valor'] = 1500 },
	[9] = { ['x'] = -130.82 , ['y'] = 6551.81 , ['z'] = 29.87 , ['qtd'] = 2 , ['valor'] = 1500 },
	[10] = { ['x'] = -1592.95 , ['y'] = 5203.06 , ['z'] = 4.31 , ['qtd'] = 2 , ['valor'] = 1500 }
}
local dsCocaina = {
	[1] = { ['x'] = -115.69 , ['y'] = -373.02 , ['z'] = 38.1187 , ['qtd'] = 2 , ['valor'] = 1500 },
	[2] = { ['x'] = -1621.754 , ['y'] = 15.30750 , ['z'] = 62.535 , ['qtd'] = 2 , ['valor'] = 1500 },
	[3] = { ['x'] = -1452.9091 , ['y'] = 545.554 , ['z'] = 120.981 , ['qtd'] = 2 , ['valor'] = 1500 } ,
	[4] = { ['x'] = 2620.028 , ['y'] = 3248.53 , ['z'] = 55.4625 , ['qtd'] = 2 , ['valor'] = 1500 }, 
	[5] = { ['x'] = 2418.559 , ['y'] = 4020.5678 , ['z'] = 36.833 , ['qtd'] = 2 , ['valor'] = 1500 },
	[6] = { ['x'] = -356.990 , ['y'] = 6207.277 , ['z'] = 31.842 , ['qtd'] = 2 , ['valor'] = 1500 },
	[7] = { ['x'] = -1584.902 , ['y'] = -838.901 , ['z'] = 10.1201 , ['qtd'] = 2 , ['valor'] = 1500 },
	[8] = { ['x'] = -1075.686 , ['y'] = -1644.68 , ['z'] = 4.5012 , ['qtd'] = 2 , ['valor'] = 1500 },
	[9] = { ['x'] = -1075.686 , ['y'] = -1644.68 , ['z'] = 4.5012 , ['qtd'] = 2 , ['valor'] = 1500 },
	[10] = { ['x'] = -1075.686 , ['y'] = -1644.68 , ['z'] = 4.5012 , ['qtd'] = 2 , ['valor'] = 1500 }
}
local dsLSD = {
	[1] = { ['x'] = 839.13 , ['y'] = 2176.73 , ['z'] = 52.29 , ['qtd'] = 2 , ['valor'] = 1500 },
	[2] = { ['x'] = 1128.97 , ['y'] = 2125.24 , ['z'] = 55.54 , ['qtd'] = 2 , ['valor'] = 1500 },
	[3] = { ['x'] = 2403.51 , ['y'] = 3127.78 , ['z'] = 48.15 , ['qtd'] = 2 , ['valor'] = 1500 },
	[4] = { ['x'] = 2601.18 , ['y'] = 2804.38 , ['z'] = 33.82 , ['qtd'] = 2 , ['valor'] = 1500 },
	[5] = { ['x'] = 2745.93 , ['y'] = 2787.80 , ['z'] = 35.54 , ['qtd'] = 2 , ['valor'] = 1500 },
	[6] = { ['x'] = 2831.88 , ['y'] = 2799.79 , ['z'] = 57.52 , ['qtd'] = 2 , ['valor'] = 1500 },
	[7] = { ['x'] = 2670.27 , ['y'] = 1600.59 , ['z'] = 24.53 , ['qtd'] = 2 , ['valor'] = 1500 },
	[8] = { ['x'] = 2670.27 , ['y'] = 1613.06 , ['z'] = 24.50 , ['qtd'] = 2 , ['valor'] = 1500 },
	[9] = { ['x'] = -841.82 , ['y'] = 5401.41 , ['z'] = 34.61 , ['qtd'] = 2 , ['valor'] = 1500 },
	[10] = { ['x'] = 1360.39 , ['y'] = -570.32 , ['z'] = 74.22 , ['qtd'] = 2 , ['valor'] = 1500 }
}
local dsMeta = {
	[1] = { ['x'] = 839.13 , ['y'] = 2176.73 , ['z'] = 52.29 , ['qtd'] = 2 , ['valor'] = 1500 },
	[2] = { ['x'] = 2832.510 , ['y'] = 2800.015 , ['z'] = 57.4832 , ['qtd'] = 2 , ['valor'] = 1500 }, 
	[3] = { ['x'] = -106.7035 , ['y'] = -8.3896 , ['z'] = 70.523 , ['qtd'] = 2 , ['valor'] = 1500 },
	[4] = { ['x'] = -1161.652 , ['y'] = -1099.723 , ['z'] = 2.2034 , ['qtd'] = 2 , ['valor'] = 1500 },
	[5] = { ['x'] = -1036.143 , ['y'] = -1228.25 , ['z'] = 6.1528 , ['qtd'] = 2 , ['valor'] = 1500 }, 
	[6] = { ['x'] = 795.5579 , ['y'] = -1725.411 , ['z'] = 30.523 , ['qtd'] = 2 , ['valor'] = 1500 },
	[7] = { ['x'] = -1089.938 , ['y'] = 548.16 , ['z'] = 103.632 , ['qtd'] = 2 , ['valor'] = 1500 },
	[8] = { ['x'] = -130.9081 , ['y'] = 6551.729 , ['z'] = 29.8751 , ['qtd'] = 2 , ['valor'] = 1500 },
	[9] = { ['x'] = 1413.2816 , ['y'] = 3664.0437 , ['z'] = 34.4074 , ['qtd'] = 2 , ['valor'] = 1500 },
	[10] = { ['x'] = 814.2621 , ['y'] = -1644.523 , ['z'] = 30.9060 , ['qtd'] = 2 , ['valor'] = 1500 }
}
local dsCrack = {
	[1] = { ['x'] = 839.13 , ['y'] = 2176.73 , ['z'] = 52.29 , ['qtd'] = 2 , ['valor'] = 1500 },
	[2] = { ['x'] = 1128.97 , ['y'] = 2125.24 , ['z'] = 55.54 , ['qtd'] = 2 , ['valor'] = 1500 },
	[3] = { ['x'] = 2403.51 , ['y'] = 3127.78 , ['z'] = 48.15 , ['qtd'] = 2 , ['valor'] = 1500 },
	[4] = { ['x'] = 2601.18 , ['y'] = 2804.38 , ['z'] = 33.82 , ['qtd'] = 2 , ['valor'] = 1500 },
	[5] = { ['x'] = 2745.93 , ['y'] = 2787.80 , ['z'] = 35.54 , ['qtd'] = 2 , ['valor'] = 1500 },
	[6] = { ['x'] = 2831.88 , ['y'] = 2799.79 , ['z'] = 57.52 , ['qtd'] = 2 , ['valor'] = 1500 },
	[7] = { ['x'] = 2670.27 , ['y'] = 1600.59 , ['z'] = 24.53 , ['qtd'] = 2 , ['valor'] = 1500 },
	[8] = { ['x'] = 2670.27 , ['y'] = 1613.06 , ['z'] = 24.50 , ['qtd'] = 2 , ['valor'] = 1500 },
	[9] = { ['x'] = -841.82 , ['y'] = 5401.41 , ['z'] = 34.61 , ['qtd'] = 2 , ['valor'] = 1500 },
	[10] = { ['x'] = 1360.39 , ['y'] = -570.32 , ['z'] = 74.22 , ['qtd'] = 2 , ['valor'] = 1500 }
}
----- By DonSpeed - Maconha
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local donMaconha = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1659.74,-42.52,168.32, true)
		if donMaconha < 4.0  then
			sleep = 5
		    sdDrawText3Ds(1659.74,-42.52,168.32, "[H] PARA INICIAR ENTREGA DE <b>MACONHA</b>")
			DrawMarker(20,1659.74,-42.52,168.32,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsTrabalhoM == false then
			   TriggerServerEvent('Don_Speed:PermissaoM', "maconha.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("Don_Speed:ContinuaM")
AddEventHandler("Don_Speed:ContinuaM",function()
    RemoveBlip(dsBlipM)
    dsTrabalhoM = true
    dsRotaIDM = math.random(1, 10)	
    CriandoBlip(dsMaconha[dsRotaIDM].x,dsMaconha[dsRotaIDM].y, dsMaconha[dsRotaIDM].z)
	
	PlaySoundFrontend(-1,"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET",false)
	TriggerEvent("Notify","sucesso","Siga sua rota .")
	
end)

Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		if dsRotaIDM then
		    local AAAdonMaconha = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsMaconha[dsRotaIDM].x, dsMaconha[dsRotaIDM].y, dsMaconha[dsRotaIDM].z, true)
		    if AAAdonMaconha < 4.0  then
				sleep = 5
		        sdDrawText3Ds(dsMaconha[dsRotaIDM].x, dsMaconha[dsRotaIDM].y, dsMaconha[dsRotaIDM].z, "[H] PARA ENTREGAR "..dsMaconha[dsRotaIDM].qtd.."<b>x MACONHA</b>")
			    DrawMarker(20,dsMaconha[dsRotaIDM].x, dsMaconha[dsRotaIDM].y, dsMaconha[dsRotaIDM].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				if IsControlJustPressed(0,74)then
			        TriggerServerEvent('Don_Speed:Pagar', dsMaconha[dsRotaIDM].qtd, dsMaconha[dsRotaIDM].valor)
		        end
			end
		end
		Citizen.Wait(sleep)
	end
end)

----------------------------
-----	By DonSpeed - Cocaina
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local donCoca = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1533.49,-2462.67,62.1, true)
		if donCoca < 4.0  then
			sleep = 5
		    sdDrawText3Ds(1533.49,-2462.67,62.1, "[H] PARA INICIAR ENTREGA DE <b>COCAINA</b>")
			DrawMarker(20,1533.49,-2462.67,62.1,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsTrabalhoM == false then
			   TriggerServerEvent('Don_Speed:PermissaoC', "cocaina.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("Don_Speed:ContinuaC")
AddEventHandler("Don_Speed:ContinuaC",function()
    RemoveBlip(dsBlipM)
    dsTrabalhoM = true
    dsRotaIDM = math.random(1, 10)	
    CriandoBlip(dsCocaina[dsRotaIDM].x,dsCocaina[dsRotaIDM].y, dsCocaina[dsRotaIDM].z)
	
	PlaySoundFrontend(-1,"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET",false)
	TriggerEvent("Notify","sucesso","Siga sua rota .")
end)

Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		if dsRotaIDM then
		    local aaacoca = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsCocaina[dsRotaIDM].x, dsCocaina[dsRotaIDM].y, dsCocaina[dsRotaIDM].z, true)
		    if aaacoca < 4.0  then
				sleep = 5
		        sdDrawText3Ds(dsCocaina[dsRotaIDM].x, dsCocaina[dsRotaIDM].y, dsCocaina[dsRotaIDM].z, "[H] PARA ENTREGAR "..dsCocaina[dsRotaIDM].qtd.."<b>x COCAINA</b>")
			    DrawMarker(20,dsCocaina[dsRotaIDM].x, dsCocaina[dsRotaIDM].y, dsCocaina[dsRotaIDM].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				if IsControlJustPressed(0,74)then
			        TriggerServerEvent('Don_Speed:PagarC', dsCocaina[dsRotaIDM].qtd, dsCocaina[dsRotaIDM].valor)
		        end
			end
		end
		Citizen.Wait(sleep)
	end
end)

--[[
----- By DonSpeed - LSD
Citizen.CreateThread(function() 
	while true do
	    local sleep = 1000
		local donlsd = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 348.67, -1867.37, 30.67, true)
		if donlsd < 4.0  then
			sleep = 5
		    sdDrawText3Ds(348.67,-1867.37,30.67, "[H] PARA INICIAR ENTREGA DE <b>LSD</b>")
			DrawMarker(20,348.67,-1867.37,30.67,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsTrabalhoM == false then
			   TriggerServerEvent('Don_Speed:PermissaoL', "lsd.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("Don_Speed:ContinuaL")
AddEventHandler("Don_Speed:ContinuaL",function()
    RemoveBlip(dsBlipM)
    dsTrabalhoM = true
    dsRotaIDM = math.random(1, 10)	
    CriandoBlip(dsLSD[dsRotaIDM].x,dsLSD[dsRotaIDM].y, dsLSD[dsRotaIDM].z)
	
	PlaySoundFrontend(-1,"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET",false)
	TriggerEvent("Notify","sucesso","Siga sua rota .")
	
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if dsRotaIDM then
		    local aaalsd = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsLSD[dsRotaIDM].x, dsLSD[dsRotaIDM].y, dsLSD[dsRotaIDM].z, true)
		    if aaalsd < 4.0  then
				sleep = 5
		        sdDrawText3Ds(dsLSD[dsRotaIDM].x, dsLSD[dsRotaIDM].y, dsLSD[dsRotaIDM].z, "[H] PARA ENTREGAR "..dsLSD[dsRotaIDM].qtd.."<b>x LSD</b>")
			    DrawMarker(20,dsLSD[dsRotaIDM].x, dsLSD[dsRotaIDM].y, dsLSD[dsRotaIDM].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				if IsControlJustPressed(0,74)then
			        TriggerServerEvent('Don_Speed:PagarL', dsLSD[dsRotaIDM].qtd, dsLSD[dsRotaIDM].valor)
		        end
			end
		end
		Citizen.Wait(sleep)
	end
end)
--]]

----- By DonSpeed - Meta
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local donmet = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 706.57,-304.80,59.252, true)
		if donmet < 4.0  then
			sleep = 5
		    sdDrawText3Ds(706.57,-304.80,59.252, "[H] PARA INICIAR ENTREGA DE <b>META</b>")
			DrawMarker(20,706.57,-304.80,59.252,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsTrabalhoM == false then
			   TriggerServerEvent('Don_Speed:PermissaoMeta', "meta.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("Don_Speed:ContinuaMeta")
AddEventHandler("Don_Speed:ContinuaMeta",function()
    RemoveBlip(dsBlipM)
    dsTrabalhoM = true
    dsRotaIDM = math.random(1, 10)	
    CriandoBlip(dsMeta[dsRotaIDM].x,dsMeta[dsRotaIDM].y, dsMeta[dsRotaIDM].z)
	
	PlaySoundFrontend(-1,"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET",false)
	TriggerEvent("Notify","sucesso","Siga sua rota .")
	
end)

Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		if dsRotaIDM then
		    local aameta = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsMeta[dsRotaIDM].x, dsMeta[dsRotaIDM].y, dsMeta[dsRotaIDM].z, true)
		    if aameta < 4.0  then
				sleep = 5
		        sdDrawText3Ds(dsMeta[dsRotaIDM].x, dsMeta[dsRotaIDM].y, dsMeta[dsRotaIDM].z, "[H] PARA ENTREGAR "..dsMeta[dsRotaIDM].qtd.."<b>x LSD</b>")
			    DrawMarker(20,dsMeta[dsRotaIDM].x, dsMeta[dsRotaIDM].y, dsMeta[dsRotaIDM].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				if IsControlJustPressed(0,74)then
			        TriggerServerEvent('Don_Speed:PagarMeta', dsMeta[dsRotaIDM].qtd, dsMeta[dsRotaIDM].valor)
		        end
			end
		end
		Citizen.Wait(sleep)
	end
end)
----- By DonSpeed - Crack
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local doncrackpegar = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1380.543,-2495.150,52.460, true)
		if doncrackpegar < 4.0  then
		    sleep = 5
			sdDrawText3Ds(1380.543,-2495.150,52.460, "[H] PARA INICIAR ENTREGA DE <b>CRACK</b>")
			DrawMarker(20,1380.543,-2495.150,52.460,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsTrabalhoM == false then
			   TriggerServerEvent('Don_Speed:PermissaoCrack', "crack.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("Don_Speed:ContinuaCrack")
AddEventHandler("Don_Speed:ContinuaCrack",function()
    RemoveBlip(dsBlipM)
    dsTrabalhoM = true
    dsRotaIDM = math.random(1, 10)	
    CriandoBlip(dsCrack[dsRotaIDM].x,dsCrack[dsRotaIDM].y, dsCrack[dsRotaIDM].z)
	
	PlaySoundFrontend(-1,"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET",false)
	TriggerEvent("Notify","sucesso","Siga sua rota .")
	
end)

Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		if dsRotaIDM then
		    local doncrackwww = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsCrack[dsRotaIDM].x, dsCrack[dsRotaIDM].y, dsCrack[dsRotaIDM].z, true)
		    if doncrackwww < 4.0  then
				sleep = 5
		        sdDrawText3Ds(dsCrack[dsRotaIDM].x, dsCrack[dsRotaIDM].y, dsCrack[dsRotaIDM].z, "[H] PARA ENTREGAR "..dsCrack[dsRotaIDM].qtd.."<b>x CRACK</b>")
			    DrawMarker(20,dsCrack[dsRotaIDM].x, dsCrack[dsRotaIDM].y, dsCrack[dsRotaIDM].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				if IsControlJustPressed(0,74)then
			        TriggerServerEvent('Don_Speed:PagarCrack', dsCrack[dsRotaIDM].qtd, dsCrack[dsRotaIDM].valor)
		        end
			end
		end
		Citizen.Wait(sleep)
	end
end)
----------------------------
Citizen.CreateThread(function() -- Don_Speed / Cancelar missao
	while true do
		local sleep = 1000
		if IsControlJustPressed(0,168) and dsTrabalhoM then
			dsRotaIDM = nil
			dsTrabalhoM = false
			RemoveBlip(dsBlipM)
			PlaySoundFrontend(-1,"ScreenFlash", "MissionFailedSounds",false)
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("Don_Speed:Cancelar")
AddEventHandler("Don_Speed:Cancelar",function()
    dsRotaIDM = nil
	dsTrabalhoM = false
	RemoveBlip(dsBlipM)
	PlaySoundFrontend(-1,"ScreenFlash", "MissionFailedSounds",false)
	TriggerEvent("Notify","sucesso","Cancelado , missao cancelada.")
end)

function CriandoBlip(x,y,z)
    RemoveBlip(dsBlipM)
	dsBlipM = AddBlipForCoord(x,y,z)
	SetBlipSprite(dsBlipM,1)
	SetBlipColour(dsBlipM,1)
	SetBlipScale(dsBlipM,0.7)
	SetBlipAsShortRange(dsBlipM,false)
	SetBlipRoute(dsBlipM,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de drogas")
	EndTextCommandSetBlipName(dsBlipM)
end

function sdDrawText3Ds(x,y,z, text)
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
-- By Don_Speed    -      Don_Speed#6282
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed