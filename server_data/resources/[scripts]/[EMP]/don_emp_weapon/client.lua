-- By Don_Speed    -      Don_Speed#6282

--[[	
              vrp/cfg/item.lua
    
    ["partspistol"] = { "Peças Pistola", 0.5},
	["wammopistol"] = { "(M)Peças Pistola", 0.1},
	
	["partsminismg"] = { "Peças SMG", 0.5},
	["wammominismg"] = { "(M)Peças SMG", 0.1},
	
	["partsassault"] = { "Peças Assault", 1.0},
	["wammoassault"] = { "(M)Peças Assault", 0.1},
	
	
	
	        vrp_inventario/config
			
	items["partspistol"] = {"none",0 ,0 ,0 , "WEAPON_PISTOL.png"}
	items["wammopistol"] = {"none",0 ,0 ,0 , "municaopistola.png"}
	items["partsminismg"] = {"none",0 ,0 ,0 , "WEAPON_MICROSMG.png"}
	items["wammominismg"] = {"none",0 ,0 ,0 , "municaopistola.png"}
	items["partsassault"] = {"none",0 ,0 ,0 , "WEAPON_ASSAULTRIFLE.png"}
	items["wammoassault"] = {"none",0 ,0 ,0 , "municaorifle.png"}

]]
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")

local dsBlipWeapon = nil
local dsEmRota = false
local dsYRota = nil


local dsWeapon = {
    -- weapon_pistol
    [1] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[2] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[3] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[4] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[5] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[6] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[7] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[8] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[9] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	[10] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 3 ,['wvalor'] = 750 ,['parts'] = "partspistol"} ,
	
	[11] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 100 ,['wvalor'] = 5 ,['parts'] = "wammopistol"} ,
	[12] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[13] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[14] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[15] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[16] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[17] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[18] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[19] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	[20] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammopistol"} ,
	-- weapon_minismg
	[21] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[22] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[23] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[24] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[25] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[26] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[27] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[28] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[29] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	[30] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 3 ,['wvalor'] = 1000 ,['parts'] = "partsminismg"} ,
	
	[31] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[32] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[33] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[34] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[35] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[36] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[37] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[38] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[39] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	[40] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 100 ,['wvalor'] = 150 ,['parts'] = "wammominismg"} ,
	
	-- weapon_assaultrifle
	[41] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[42] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[43] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[44] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[45] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[46] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[47] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[48] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[49] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	[50] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 3 ,['wvalor'] = 2500 ,['parts'] = "partsassault"} ,
	
	[51] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[52] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[53] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[54] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[55] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[56] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[57] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[58] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[59] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
	[60] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 100 ,['wvalor'] = 250 ,['parts'] = "wammoassault"} ,
}

Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local AMafia = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1398.36,1156.91,114.33 , true)
		if AMafia < 4.0  then
		    sleep = 5
			sdDrawText3Ds( 1398.36, 1156.91,114.33 , "[H] PARA INICIAR BUSCA DE <b>PEÇAS DE ARMAS</b>")
			DrawMarker(20, 1398.36, 1156.91,114.33 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsEmRota == false then
			   TriggerServerEvent('Don_Speed:PermissaoWeapon', "mafia.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local AMafia = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 981.90,-103.00,74.84 , true)
		if AMafia < 4.0  then
			sleep = 5
		    sdDrawText3Ds( 981.90, -103.00,74.84 , "[H] PARA INICIAR BUSCA DE <b>PEÇAS DE ARMAS</b>")
			DrawMarker(20, 981.90, -103.00,74.84 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsEmRota == false then
			   TriggerServerEvent('Don_Speed:PermissaoWeapon', "motoclub.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

--[[
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local AMafia = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -2674.122,1336.18,144.25 , true)
		if AMafia < 4.0  then
			sleep = 5
		    sdDrawText3Ds( -2674.122, 1336.18,144.25 , "[H] PARA INICIAR BUSCA DE <b>PEÇAS DE ARMAS</b>")
			DrawMarker(20, -2674.122, 1336.18,144.25 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsEmRota == false then
			   TriggerServerEvent('Don_Speed:PermissaoWeapon', "yakuza.permissao")
			end
		end
		Citizen.Wait(sleep)
	end
end)
--]]

RegisterNetEvent("Don_Speed:ContinuaWeapon")
AddEventHandler("Don_Speed:ContinuaWeapon",function()

    RemoveBlip(dsBlipWeapon)
    dsEmRota = true
    dsYRota = math.random(1, 60)	
    CriandoBlip(dsWeapon[dsYRota].x,dsWeapon[dsYRota].y, dsWeapon[dsYRota].z)
	
	PlaySoundFrontend(-1,"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET",false)
	
	TriggerEvent("Notify","sucesso","Siga sua rota , para obter suas peças .")
	
end)
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		if dsEmRota then
		    local dsWeaponblip = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsWeapon[dsYRota].x, dsWeapon[dsYRota].y, dsWeapon[dsYRota].z, true)
		    if dsWeaponblip < 4.0  then
				sleep = 5
		        sdDrawText3Ds(dsWeapon[dsYRota].x, dsWeapon[dsYRota].y, dsWeapon[dsYRota].z, "[H] PARA COMPRAR PEÇAS DESTA LOJA")
			    DrawMarker(20,dsWeapon[dsYRota].x, dsWeapon[dsYRota].y, dsWeapon[dsYRota].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				
				if IsControlJustPressed(0,74)then
			        TriggerServerEvent('Don_Speed:WeacomComprar',dsWeapon[dsYRota].wqtd, dsWeapon[dsYRota].wvalor, dsWeapon[dsYRota].parts)
		        end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local Transformar = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1393.14 , 1134.80 , 114.33 , true)
		if Transformar < 4.0  then
		    sleep = 5
			sdDrawText3Ds( 1393.14 , 1134.80 , 114.33 , "[H] PARA INICIAR A MONTAGEM DA <b>ARMA</b>")
			DrawMarker(20, 1393.14 , 1134.80 , 114.33 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74)then
			   TriggerServerEvent('Don_Speed:MontagemWeapon', "mafia.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)
--[[
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local Transformar = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -2678.454 , 1330.35 , 140.88 , true)
		if Transformar < 4.0  then
		    sleep = 5
			sdDrawText3Ds( -2678.454 , 1330.35 , 140.88 , "[H] PARA INICIAR A MONTAGEM DA <b>ARMA</b>")
			DrawMarker(20, -2678.454 , 1330.35 , 140.88 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74)then
			   TriggerServerEvent('Don_Speed:MontagemWeapon', "yakuza.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)
--]]
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local Transformar = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 986.7896 , -92.711 , 74.845 , true)
		if Transformar < 4.0  then
		    sleep = 5
			sdDrawText3Ds( 986.7896 , -92.711 , 74.845 , "[H] PARA INICIAR A MONTAGEM DA <b>ARMA</b>")
			DrawMarker(20, 986.7896 , -92.711 , 74.845 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74)then
			   TriggerServerEvent('Don_Speed:MontagemWeapon', "motoclub.permissao")
		    end
		end
		Citizen.Wait(sleep)
	end
end)

----------------------------
Citizen.CreateThread(function() -- Don_Speed / Cancelar missao
	while true do
		local sleep = 1000
		if IsControlJustPressed(0,168) then
			RemoveBlip(dsBlipWeapon)
		    dsBlipWeapon = nil
            dsEmRota = false
            dsYRota = nil
			PlaySoundFrontend(-1,"ScreenFlash", "MissionFailedSounds",false)
			IDorg = 0
		end
		Citizen.Wait(sleep)
	end
end)

function CriandoBlip(x,y,z)
	dsBlipWeapon = AddBlipForCoord(x,y,z)
	SetBlipSprite(dsBlipWeapon,1)
	SetBlipColour(dsBlipWeapon,5)
	SetBlipScale(dsBlipWeapon,0.7)
	SetBlipAsShortRange(dsBlipWeapon,false)
	SetBlipRoute(dsBlipWeapon,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de drogas")
	EndTextCommandSetBlipName(dsBlipWeapon)
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