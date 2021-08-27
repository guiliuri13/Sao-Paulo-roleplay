local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_paramedico")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = nil
local selecionado = 0
local emservico = false

local CoordenadaX = 321.13494873047
local CoordenadaY = -571.66546630859
local CoordenadaZ = 28.791463851929

local passageiro = nil
local lastpassageiro = nil
local checkped = true
local maxlocs = 28
local timers = 0
local payment = 10
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALIDADES
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 151.30, ['y'] = -1028.63, ['z'] = 28.84, ['xp'] = 152.45, ['yp'] = -1041.24, ['zp'] = 29.37, ['h'] = 252.0 },
	[2] = { ['x'] = 423.84, ['y'] = -959.30, ['z'] = 28.81, ['xp'] = 437.37, ['yp'] = -979.03, ['zp'] = 30.68, ['h'] = 271.0 },
	[3] = { ['x'] = 1.03, ['y'] = -1510.86, ['z'] = 29.40, ['xp'] = 20.67, ['yp'] = -1505.62, ['zp'] = 31.85, ['h'] = 319.0 },
	[4] = { ['x'] = -188.07, ['y'] = -1612.28, ['z'] = 33.39, ['xp'] = -189.55, ['yp'] = -1585.80, ['zp'] = 34.76, ['h'] = 178.0 },
	[5] = { ['x'] = 98.88, ['y'] = -1927.16, ['z'] = 20.25, ['xp'] = 101.02, ['yp'] = -1912.35, ['zp'] = 21.40, ['h'] = 70.0 },
	[6] = { ['x'] = 320.98, ['y'] = -2022.02, ['z'] = 20.40, ['xp'] = 335.73, ['yp'] = -2010.77, ['zp'] = 22.31, ['h'] = 321.0 },
	[7] = { ['x'] = 755.53, ['y'] = -2486.26, ['z'] = 19.54, ['xp'] = 774.34, ['yp'] = -2475.07, ['zp'] = 20.14, ['h'] = 356.0 },
	[8] = { ['x'] = 1057.66, ['y'] = -2124.80, ['z'] = 32.20, ['xp'] = 1040.09, ['yp'] = -2115.65, ['zp'] = 32.84, ['h'] = 175.0 },
	[9] = { ['x'] = 1377.08, ['y'] = -1530.01, ['z'] = 56.07, ['xp'] = 1379.33, ['yp'] = -1514.99, ['zp'] = 58.43, ['h'] = 119.0 },
	[10] = { ['x'] = 1260.24, ['y'] = -588.15, ['z'] = 68.53, ['xp'] = 1240.60, ['yp'] = -601.63, ['zp'] = 69.78, ['h'] = 193.0 },
	[11] = { ['x'] = 899.58, ['y'] = -590.58, ['z'] = 56.85, ['xp'] = 886.76, ['yp'] = -608.20, ['zp'] = 58.44, ['h'] = 238.0 },
	[12] = { ['x'] = 945.18, ['y'] = -140.04, ['z'] = 74.07, ['xp'] = 959.34, ['yp'] = -121.23, ['zp'] = 74.96, ['h'] = 60.0 },
	[13] = { ['x'] = 84.44, ['y'] = 476.19, ['z'] = 146.91, ['xp'] = 80.10, ['yp'] = 486.12, ['zp'] = 148.20, ['h'] = 118.0 },
	[14] = { ['x'] = -720.03, ['y'] = 482.23, ['z'] = 107.10, ['xp'] = -721.10, ['yp'] = 489.75, ['zp'] = 109.38, ['h'] = 110.0 },
	[15] = { ['x'] = -1244.39, ['y'] = 497.98, ['z'] = 93.86, ['xp'] = -1229.15, ['yp'] = 515.72, ['zp'] = 95.42, ['h'] = 359.0 },
	[16] = { ['x'] = -1514.99, ['y'] = 442.97, ['z'] = 109.70, ['xp'] = -1495.97, ['yp'] = 437.10, ['zp'] = 112.49, ['h'] = 296.0 },
	[17] = { ['x'] = -1684.14, ['y'] = -308.47, ['z'] = 51.41, ['xp'] = -1684.87, ['yp'] = -291.66, ['zp'] = 51.89, ['h'] = 234.0 },
	[18] = { ['x'] = -1413.14, ['y'] = -531.91, ['z'] = 30.98, ['xp'] = -1447.29, ['yp'] = -537.71, ['zp'] = 34.74, ['h'] = 215.0 },
	[19] = { ['x'] = -1036.80, ['y'] = -492.27, ['z'] = 36.15, ['xp'] = -1007.32, ['yp'] = -486.80, ['zp'] = 39.97, ['h'] = 27.0 },
	[20] = { ['x'] = -551.46, ['y'] = -648.64, ['z'] = 32.73, ['xp'] = -533.39, ['yp'] = -622.87, ['zp'] = 34.67, ['h'] = 92.0 },
	[21] = { ['x'] = -616.30, ['y'] = -920.80, ['z'] = 22.98, ['xp'] = -598.49, ['yp'] = -929.96, ['zp'] = 23.86, ['h'] = 291.0 },
	[22] = { ['x'] = -752.13, ['y'] = -1041.29, ['z'] = 12.25, ['xp'] = -759.21, ['yp'] = -1047.16, ['zp'] = 13.50, ['h'] = 117.0 },
	[23] = { ['x'] = -1155.20, ['y'] = -1413.48, ['z'] = 4.46, ['xp'] = -1150.56, ['yp'] = -1426.38, ['zp'] = 4.95, ['h'] = 247.0 },
	[24] = { ['x'] = -997.88, ['y'] = -1599.65, ['z'] = 4.59, ['xp'] = -989.04, ['yp'] = -1575.82, ['zp'] = 5.17, ['h'] = 271.0 },
	[25] = { ['x'] = -829.38, ['y'] = -1218.09, ['z'] = 6.54, ['xp'] = -822.50, ['yp'] = -1223.35, ['zp'] = 7.36, ['h'] = 319.0 },
	[26] = { ['x'] = -334.47, ['y'] = -1418.13, ['z'] = 29.71, ['xp'] = -320.10, ['yp'] = -1389.73, ['zp'] = 36.50, ['h'] = 91.0 },
	[27] = { ['x'] = 135.28, ['y'] = -1306.46, ['z'] = 28.65, ['xp'] = 132.91, ['yp'] = -1293.90, ['zp'] = 29.26, ['h'] = 119.0 },
	[28] = { ['x'] = -34.00, ['y'] = -1079.86, ['z'] = 26.26, ['xp'] = -39.02, ['yp'] = -1082.46, ['zp'] = 26.42, ['h'] = 69.0 },
	[29] = { ['x'] = 296.15, ['y'] = -582.48, ['z'] = 42.93, ['xp'] = 296.15, ['yp'] = -582.48, ['zp'] = 42.93, ['h'] = 343.0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local pedlist = {
	[1] = { ['model'] = "ig_abigail", ['hash'] = 0x400AEC41 },
	[2] = { ['model'] = "a_m_o_acult_02", ['hash'] = 0x4BA14CCA },
	[3] = { ['model'] = "a_m_m_afriamer_01", ['hash'] = 0xD172497E },
	[4] = { ['model'] = "ig_mp_agent14", ['hash'] = 0xFBF98469 },
	[5] = { ['model'] = "u_m_m_aldinapoli", ['hash'] = 0xF0EC56E2 },
	[6] = { ['model'] = "ig_amandatownley", ['hash'] = 0x6D1E15F7 },
	[7] = { ['model'] = "ig_andreas", ['hash'] = 0x47E4EEA0 },
	[8] = { ['model'] = "csb_anita", ['hash'] = 0x0703F106 },
	[9] = { ['model'] = "u_m_y_antonb", ['hash'] = 0xCF623A2C },
	[10] = { ['model'] = "g_m_y_armgoon_02", ['hash'] = 0xC54E878A },
	[11] = { ['model'] = "ig_ashley", ['hash'] = 0x7EF440DB },
	[12] = { ['model'] = "s_m_m_autoshop_01", ['hash'] = 0x040EABE3 },
	[13] = { ['model'] = "g_m_y_ballaeast_01", ['hash'] = 0xF42EE883 },
	[14] = { ['model'] = "g_m_y_ballaorig_01", ['hash'] = 0x231AF63F },
	[15] = { ['model'] = "s_m_y_barman_01", ['hash'] = 0xE5A11106 },
	[16] = { ['model'] = "u_m_y_baygor", ['hash'] = 0x5244247D },
	[17] = { ['model'] = "a_m_o_beach_01", ['hash'] = 0x8427D398 },
	[18] = { ['model'] = "a_m_y_beachvesp_01", ['hash'] = 0x7E0961B8 },
	[19] = { ['model'] = "ig_bestmen", ['hash'] = 0x5746CD96 },
	[20] = { ['model'] = "a_f_y_bevhills_01", ['hash'] = 0x445AC854 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not emservico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
			DrawText3D(CoordenadaX,CoordenadaY,CoordenadaZ, "INICIAR ROTA DE BUSCA")
				DrawMarker(23,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,20,0,0,0,0)
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and emP.checkPermission() then
						emservico = true
						selecionado = math.random(maxlocs)
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PASSAGEIRO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if emservico then
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			local vehiclespeed = GetEntitySpeed(vehicle)*3.6
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 50.0 and IsVehicleModel(vehicle,GetHashKey("ambulance")) then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.0,240,200,80,20,1,0,0,1)
				if distance <= 2.5 then
					if IsControlJustPressed(0,38) and emP.checkPermission() and (GetEntityHeading(ped) >= locs[selecionado].h-20.0 and GetEntityHeading(ped) <= locs[selecionado].h+20.0) then
						RemoveBlip(blips)
						FreezeEntityPosition(vehicle,true)
						if DoesEntityExist(passageiro) then
							emP.checkPayment(payment)
							Citizen.Wait(3000)
							TaskLeaveVehicle(passageiro,vehicle,262144)
							TaskWanderStandard(passageiro,10.0,10)
							Citizen.Wait(1100)
							SetVehicleDoorShut(vehicle,3,0)
							Citizen.Wait(1000)
						end

						if checkped then
							local pmodel = math.random(#pedlist)
							modelRequest(pedlist[pmodel].model)

							RequestAnimSet("move_m@injured")
							while not HasAnimSetLoaded("move_m@injured") do
								Citizen.Wait(10)
							end

							passageiro = CreatePed(4,pedlist[pmodel].hash,locs[selecionado].xp,locs[selecionado].yp,locs[selecionado].zp,3374176,true,false)
							SetEntityInvincible(passageiro,true)
							TaskEnterVehicle(passageiro,vehicle,-1,0,1.0,1,0)
							SetPedMovementClipset(passageiro,"move_m@injured",0.25)
							checkped = false
							payment = 10
							lastpassageiro = passageiro
						else
							passageiro = nil
							checkped = true
							FreezeEntityPosition(vehicle,false)
							removePeds()
						end

						if checkped then
							lselecionado = selecionado
							while true do
								if lselecionado == selecionado then
									selecionado = math.random(maxlocs)
								else
									break
								end
								Citizen.Wait(1)
							end
						else
							selecionado = 29
						end

						CriandoBlip(locs,selecionado)

						if DoesEntityExist(passageiro) then
							while true do
								Citizen.Wait(1)
								local x2,y2,z2 = table.unpack(GetEntityCoords(passageiro))
								if not IsPedSittingInVehicle(passageiro,vehicle) then
									DrawMarker(21,x2,y2,z2+1.3,0,0,0,0,180.0,130.0,0.6,0.8,0.5,240,200,80,50,1,0,0,1)
								end
								if IsPedSittingInVehicle(passageiro,vehicle) then
									FreezeEntityPosition(vehicle,false)
									break
								end
							end
						end
					end
				end
			end

			if IsEntityAVehicle(vehicle) and DoesEntityExist(passageiro) then
				if math.ceil(vehiclespeed) >= 81 and timers <= 0 and payment > 0 then
					timers = 5
					payment = payment - 1
				end
			end

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if emservico then
			if timers > 0 then
				timers = timers - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVENPCS
-----------------------------------------------------------------------------------------------------------------------------------------
function removePeds()
	SetTimeout(20000,function()
		if emservico and lastpassageiro and passageiro == nil then
			TriggerServerEvent("trydeleteped",PedToNet(lastpassageiro))
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if emservico then
			local vehicle = GetPlayersLastVehicle()
			if IsControlJustPressed(0,168) and IsVehicleModel(vehicle,GetHashKey("ambulance")) then
				RemoveBlip(blips)
				if DoesEntityExist(passageiro) then
					TaskLeaveVehicle(passageiro,vehicle,262144)
					TaskWanderStandard(passageiro,10.0,10)
					Citizen.Wait(1100)
					SetVehicleDoorShut(vehicle,3,0)
					FreezeEntityPosition(vehicle,false)
				end
				blips = nil
				selecionado = 0
				passageiro = nil
				checkped = true
				emservico = false
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÃO
-----------------------------------------------------------------------------------------------------------------------------------------
function modelRequest(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(10)
	end
end

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Transporte de Paciente")
	EndTextCommandSetBlipName(blips)
end
function DrawText3D(x,y,z, text)
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
end


----------------------------------------------------------------------------------------------------------------------------------------
-- CORONHADA
----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
       DisableControlAction(1, 140, true)
              DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
        end
    end
end)

--CORONHADA 2

--Citizen.CreateThread(function()
--    while true do
--      Citizen.Wait(0)
--        DisableControlAction(0, 140, true) -- DESABILITAR CORONHADA
--    end
--end)

--------------------------------PLAYER INVISIVEL NA CRIAÇãO------------------

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
	  if Instanced then
		for i=0, 255 do --altere para 32 caso não use onesync
		  local otherPlayerPed = GetPlayerPed(i)
	
		  if otherPlayerPed ~= PlayerPedId() then
			SetEntityLocallyInvisible(otherPlayerPed)
			SetEntityNoCollisionEntity(PlayerPedId(),  otherPlayerPed,  true)
		  end
		end
	  end
	end
	end)

---------------------------------ADM MUDAR COR DO VEÍCULO----------------------

-------------------------------COOLDOWN BUNNYHOP--------------------------

local bunnyhop = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if bunnyhop > 0 then
            bunnyhop = bunnyhop - 2
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedJumping(ped) and bunnyhop <= 0 then
            bunnyhop = 2
        end
        if bunnyhop > 0 then
            DisableControlAction(0,22,true)
        end
        Citizen.Wait(2)
    end
end)

---------------------------NÃO IR PRO P1---------------

local disableShuffle = true
function disableSeatShuffle(flag)
    disableShuffle = flag
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
                if GetIsTaskActive(GetPlayerPed(-1), 165) then
				    if IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("mi4")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("coach"))then
						end
					else
						SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					end
                end
            end
        end
    end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        disableSeatShuffle(false)
        Citizen.Wait(5000)
        disableSeatShuffle(true)
    else
        CancelEvent()
    end
end)

RegisterCommand("seat", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false)


-----------------------------------------------------------------------------------------------------------------------------------------
-- ANTICHEAT SPAWN--
-- BLACKLIST WEAPONS - ABAIXO VOCÊ COLOCA AS ARMAS BANIDAS DO SEU SERVIDOR
-----------------------------------------------------------------------------------------------------------------------------------------
blackWeapons = {
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_RAYPISTOL",
	"WEAPON_SMG_MK2",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_MINISMG",
	"WEAPON_RAYCARBINE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_SNOWBALL",
	"WEAPON_PIPEBOMB",
	"WEAPON_BALL",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_PETROLCAN"
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		for k,v in ipairs(blackWeapons) do
			Citizen.Wait(1)
			if HasPedGotWeapon(PlayerPedId(),GetHashKey(v),false) == 1 then
				RemoveWeaponFromPed(PlayerPedId(),GetHashKey(v))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST OBJECTS -- ABAIXO VOCÊ COLOCA OS OBJETOS BANIDOS DO SEU SERVIDOR
-----------------------------------------------------------------------------------------------------------------------------------------
local blackObjects = {
	"hei_prop_carrier_radar_1_l1",
	"v_res_mexball",
	"prop_rock_1_a",
	"prop_rock_1_b",
	"prop_rock_1_c",
	"prop_rock_1_d",
	"prop_player_gasmask",
	"prop_rock_1_e",
	"prop_rock_1_f",
	"prop_rock_1_g",
	"prop_rock_1_h",
	"prop_test_boulder_01",
	"prop_test_boulder_02",
	"prop_test_boulder_03",
	"prop_test_boulder_04",
	"apa_mp_apa_crashed_usaf_01a",
	"ex_prop_exec_crashdp",
	"apa_mp_apa_yacht_o1_rail_a",
	"apa_mp_apa_yacht_o1_rail_b",
	"apa_mp_h_yacht_armchair_01",
	"apa_mp_h_yacht_armchair_03",
	"apa_mp_h_yacht_armchair_04",
	"apa_mp_h_yacht_barstool_01",
	"apa_mp_h_yacht_bed_01",
	"apa_mp_h_yacht_bed_02",
	"apa_mp_h_yacht_coffee_table_01",
	"apa_mp_h_yacht_coffee_table_02",
	"apa_mp_h_yacht_floor_lamp_01",
	"apa_mp_h_yacht_side_table_01",
	"apa_mp_h_yacht_side_table_02",
	"apa_mp_h_yacht_sofa_01",
	"apa_mp_h_yacht_sofa_02",
	"apa_mp_h_yacht_stool_01",
	"apa_mp_h_yacht_strip_chair_01",
	"apa_mp_h_yacht_table_lamp_01",
	"apa_mp_h_yacht_table_lamp_02",
	"apa_mp_h_yacht_table_lamp_03",
	"prop_flag_columbia",
	"apa_mp_apa_yacht_o2_rail_a",
	"apa_mp_apa_yacht_o2_rail_b",
	"apa_mp_apa_yacht_o3_rail_a",
	"apa_mp_apa_yacht_o3_rail_b",
	"apa_mp_apa_yacht_option1",
	"proc_searock_01",
	"apa_mp_h_yacht_",
	"apa_mp_apa_yacht_option1_cola",
	"apa_mp_apa_yacht_option2",
	"apa_mp_apa_yacht_option2_cola",
	"apa_mp_apa_yacht_option2_colb",
	"apa_mp_apa_yacht_option3",
	"apa_mp_apa_yacht_option3_cola",
	"apa_mp_apa_yacht_option3_colb",
	"apa_mp_apa_yacht_option3_colc",
	"apa_mp_apa_yacht_option3_cold",
	"apa_mp_apa_yacht_option3_cole",
	"apa_mp_apa_yacht_jacuzzi_cam",
	"apa_mp_apa_yacht_jacuzzi_ripple003",
	"apa_mp_apa_yacht_jacuzzi_ripple1",
	"apa_mp_apa_yacht_jacuzzi_ripple2",
	"apa_mp_apa_yacht_radar_01a",
	"apa_mp_apa_yacht_win",
	"prop_crashed_heli",
	"apa_mp_apa_yacht_door",
	"prop_shamal_crash",
	"xm_prop_x17_shamal_crash",
	"apa_mp_apa_yacht_door2",
	"apa_mp_apa_yacht",
	"prop_flagpole_2b",
	"prop_flagpole_2c",
	"prop_flag_canada",
	"apa_prop_yacht_float_1a",
	"apa_prop_yacht_float_1b",
	"apa_prop_yacht_glass_01",
	"apa_prop_yacht_glass_02",
	"apa_prop_yacht_glass_03",
	"apa_prop_yacht_glass_04",
	"apa_prop_yacht_glass_05",
	"apa_prop_yacht_glass_06",
	"apa_prop_yacht_glass_07",
	"apa_prop_yacht_glass_08",
	"apa_prop_yacht_glass_09",
	"apa_prop_yacht_glass_10",
	"prop_flag_canada_s",
	"prop_flag_eu",
	"prop_flag_eu_s",
	"prop_target_blue_arrow",
	"prop_target_orange_arrow",
	"prop_target_purp_arrow",
	"prop_target_red_arrow",
	"apa_prop_flag_argentina",
	"apa_prop_flag_australia",
	"apa_prop_flag_austria",
	"apa_prop_flag_belgium",
	"apa_prop_flag_brazil",
	"apa_prop_flag_canadat_yt",
	"apa_prop_flag_china",
	"apa_prop_flag_columbia",
	"apa_prop_flag_croatia",
	"apa_prop_flag_czechrep",
	"apa_prop_flag_denmark",
	"apa_prop_flag_england",
	"apa_prop_flag_eu_yt",
	"apa_prop_flag_finland",
	"apa_prop_flag_france",
	"apa_prop_flag_german_yt",
	"apa_prop_flag_hungary",
	"apa_prop_flag_ireland",
	"apa_prop_flag_israel",
	"apa_prop_flag_italy",
	"apa_prop_flag_jamaica",
	"apa_prop_flag_japan_yt",
	"apa_prop_flag_canada_yt",
	"apa_prop_flag_lstein",
	"apa_prop_flag_malta",
	"apa_prop_flag_mexico_yt",
	"apa_prop_flag_netherlands",
	"apa_prop_flag_newzealand",
	"apa_prop_flag_nigeria",
	"apa_prop_flag_norway",
	"apa_prop_flag_palestine",
	"apa_prop_flag_poland",
	"apa_prop_flag_portugal",
	"apa_prop_flag_puertorico",
	"apa_prop_flag_russia_yt",
	"apa_prop_flag_scotland_yt",
	"apa_prop_flag_script",
	"apa_prop_flag_slovakia",
	"apa_prop_flag_slovenia",
	"apa_prop_flag_southafrica",
	"apa_prop_flag_southkorea",
	"apa_prop_flag_spain",
	"apa_prop_flag_sweden",
	"apa_prop_flag_switzerland",
	"apa_prop_flag_turkey",
	"apa_prop_flag_uk_yt",
	"apa_prop_flag_us_yt",
	"apa_prop_flag_wales",
	"prop_flag_uk",
	"prop_flag_uk_s",
	"prop_flag_us",
	"prop_flag_usboat",
	"prop_flag_us_r",
	"prop_flag_us_s",
	"prop_flag_france",
	"prop_flag_france_s",
	"prop_flag_german",
	"prop_flag_german_s",
	"prop_flag_ireland",
	"prop_flag_ireland_s",
	"prop_flag_japan",
	"prop_flag_japan_s",
	"prop_flag_ls",
	"prop_flag_lsfd",
	"prop_flag_lsfd_s",
	"prop_flag_lsservices",
	"prop_flag_lsservices_s",
	"prop_flag_ls_s",
	"prop_flag_mexico",
	"prop_flag_mexico_s",
	"prop_flag_russia",
	"prop_flag_russia_s",
	"prop_flag_s",
	"prop_flag_sa",
	"prop_flag_sapd",
	"prop_flag_sapd_s",
	"prop_flag_sa_s",
	"prop_flag_scotland",
	"prop_flag_scotland_s",
	"prop_flag_sheriff",
	"prop_flag_sheriff_s",
	"prop_flag_uk",
	"prop_flag_uk_s",
	"prop_flag_us",
	"prop_flag_usboat",
	"prop_flag_us_r",
	"prop_flag_us_s",
	"prop_flamingo",
	"prop_swiss_ball_01",
	"prop_air_bigradar_l1",
	"prop_air_bigradar_l2",
	"prop_air_bigradar_slod",
	"p_fib_rubble_s",
	"prop_money_bag_01",
	"p_cs_mp_jet_01_s",
	"prop_poly_bag_money",
	"prop_air_radar_01",
	"hei_prop_carrier_radar_1",
	"prop_air_bigradar",
	"prop_carrier_radar_1_l1",
	"prop_asteroid_01",
	"prop_xmas_ext",
	"p_oil_pjack_01_amo",
	"p_oil_pjack_01_s",
	"p_oil_pjack_02_amo",
	"p_oil_pjack_03_amo",
	"p_oil_pjack_02_s",
	"p_oil_pjack_03_s",
	"prop_aircon_l_03",
	"prop_med_jet_01",
	"p_med_jet_01_s",
	"hei_prop_carrier_jet",
	"bkr_prop_biker_bblock_huge_01",
	"bkr_prop_biker_bblock_huge_02",
	"bkr_prop_biker_bblock_huge_04",
	"bkr_prop_biker_bblock_huge_05",
	"hei_prop_heist_emp",
	"prop_weed_01",
	"prop_air_bigradar",
	"prop_juicestand",
	"prop_lev_des_barge_02",
	"hei_prop_carrier_defense_01",
	"prop_aircon_m_04",
	"prop_mp_ramp_03",
	"stt_prop_stunt_track_dwuturn",
	"ch3_12_animplane1_lod",
	"ch3_12_animplane2_lod",
	"hei_prop_hei_pic_pb_plane",
	"light_plane_rig",
	"prop_cs_plane_int_01",
	"prop_dummy_plane",
	"prop_mk_plane",
	"v_44_planeticket",
	"prop_planer_01",
	"ch3_03_cliffrocks03b_lod",
	"ch3_04_rock_lod_02",
	"csx_coastsmalrock_01_",
	"csx_coastsmalrock_02_",
	"csx_coastsmalrock_03_",
	"csx_coastsmalrock_04_",
	"mp_player_introck",
	"Heist_Yacht",
	"csx_coastsmalrock_05_",
	"mp_player_int_rock",
	"mp_player_introck",
	"prop_flagpole_1a",
	"prop_flagpole_2a",
	"prop_flagpole_3a",
	"prop_a4_pile_01",
	"cs2_10_sea_rocks_lod",
	"cs2_11_sea_marina_xr_rocks_03_lod",
	"prop_gold_cont_01",
	"prop_hydro_platform",
	"ch3_04_viewplatform_slod",
	"ch2_03c_rnchstones_lod",
	"proc_mntn_stone01",
	"prop_beachflag_le",
	"proc_mntn_stone02",
	"cs2_10_sea_shipwreck_lod",
	"des_shipsink_02",
	"prop_dock_shippad",
	"des_shipsink_03",
	"des_shipsink_04",
	"prop_mk_flag",
	"prop_mk_flag_2",
	"proc_mntn_stone03",
	"FreeModeMale01",
	"rsn_os_specialfloatymetal_n",
	"rsn_os_specialfloatymetal",
	"cs1_09_sea_ufo",
	"rsn_os_specialfloaty2_light2",
	"rsn_os_specialfloaty2_light",
	"rsn_os_specialfloaty2",
	"rsn_os_specialfloatymetal_n",
	"rsn_os_specialfloatymetal",
	"P_Spinning_Anus_S_Main",
	"P_Spinning_Anus_S_Root",
	"cs3_08b_rsn_db_aliencover_0001cs3_08b_rsn_db_aliencover_0001_a",
	"sc1_04_rnmo_paintoverlaysc1_04_rnmo_paintoverlay_a",
	"rnbj_wallsigns_0001",
	"proc_sml_stones01",
	"proc_sml_stones02",
	"maverick",
	"Miljet",
	"proc_sml_stones03",
	"proc_stones_01",
	"proc_stones_02",
	"proc_stones_03",
	"proc_stones_04",
	"proc_stones_05",
	"proc_stones_06",
	"prop_coral_stone_03",
	"prop_coral_stone_04",
	"prop_gravestones_01a",
	"prop_gravestones_02a",
	"prop_gravestones_03a",
	"prop_gravestones_04a",
	"prop_gravestones_05a",
	"prop_gravestones_06a",
	"prop_gravestones_07a",
	"prop_gravestones_08a",
	"prop_gravestones_09a",
	"prop_gravestones_10a",
	"prop_prlg_gravestone_05a_l1",
	"prop_prlg_gravestone_06a",
	"test_prop_gravestones_04a",
	"test_prop_gravestones_05a",
	"test_prop_gravestones_07a",
	"test_prop_gravestones_08a",
	"test_prop_gravestones_09a",
	"prop_prlg_gravestone_01a",
	"prop_prlg_gravestone_02a",
	"prop_prlg_gravestone_03a",
	"prop_prlg_gravestone_04a",
	"prop_stoneshroom1",
	"prop_stoneshroom2",
	"v_res_fa_stones01",
	"test_prop_gravestones_01a",
	"test_prop_gravestones_02a",
	"prop_prlg_gravestone_05a",
	"FreemodeFemale01",
	"p_cablecar_s",
	"stt_prop_stunt_tube_l",
	"stt_prop_stunt_track_dwuturn",
	"p_spinning_anus_s",
	"prop_windmill_01",
	"hei_prop_heist_tug",
	"prop_air_bigradar",
	"p_oil_slick_01",
	"prop_dummy_01",
	"hei_prop_heist_emp",
	"p_tram_cash_s",
	"hw1_blimp_ce2",
	"prop_fire_exting_1a",
	"prop_fire_exting_1b",
	"prop_fire_exting_2a",
	"prop_fire_exting_3a",
	"hw1_blimp_ce2_lod",
	"hw1_blimp_ce_lod",
	"hw1_blimp_cpr003",
	"hw1_blimp_cpr_null",
	"hw1_blimp_cpr_null2",
	"prop_lev_des_barage_02",
	"hei_prop_carrier_defense_01",
	"prop_juicestand",
	"S_M_M_MovAlien_01",
	"s_m_m_movalien_01",
	"s_m_m_movallien_01",
	"u_m_y_babyd",
	"CS_Orleans",
	"A_M_Y_ACult_01",
	"S_M_M_MovSpace_01",
	"U_M_Y_Zombie_01",
	"s_m_y_blackops_01",
	"a_f_y_topless_01",
	"a_c_boar",
	"a_c_cat_01",
	"a_c_chickenhawk",
	"a_c_chimp",
	"s_f_y_hooker_03",
	"a_c_chop",
	"a_c_cormorant",
	"a_c_cow",
	"a_c_coyote",
	"v_ilev_found_cranebucket",
	"p_cs_sub_hook_01_s",
	"a_c_crow",
	"a_c_dolphin",
	"a_c_fish",
	"hei_prop_heist_hook_01",
	"prop_rope_hook_01",
	"prop_sub_crane_hook",
	"s_f_y_hooker_01",
	"prop_vehicle_hook",
	"prop_v_hook_s",
	"prop_dock_crane_02_hook",
	"prop_winch_hook_long",
	"a_c_hen",
	"a_c_humpback",
	"a_c_husky",
	"a_c_killerwhale",
	"a_c_mtlion",
	"a_c_pigeon",
	"a_c_poodle",
	"prop_coathook_01",
	"prop_cs_sub_hook_01",
	"a_c_pug",
	"a_c_rabbit_01",
	"a_c_rat",
	"a_c_retriever",
	"a_c_rhesus",
	"a_c_rottweiler",
	"a_c_sharkhammer",
	"a_c_sharktiger",
	"a_c_shepherd",
	"a_c_stingray",
	"a_c_westy",
	"CS_Orleans",
	"prop_windmill_01",
	"prop_Ld_ferris_wheel",
	"p_tram_crash_s",
	"p_oil_slick_01",
	"p_ld_stinger_s",
	"p_ld_soc_ball_01",
	"p_parachute1_s",
	"p_cablecar_s",
	"prop_beach_fire",
	"prop_lev_des_barge_02",
	"prop_lev_des_barge_01",
	"prop_sculpt_fix",
	"prop_flagpole_2b",
	"prop_flagpole_2c",
	"prop_winch_hook_short",
	"prop_flag_canada",
	"prop_flag_canada_s",
	"prop_flag_eu",
	"prop_flag_eu_s",
	"prop_flag_france",
	"prop_flag_france_s",
	"prop_flag_german",
	"prop_ld_hook",
	"prop_flag_german_s",
	"prop_flag_ireland",
	"prop_flag_ireland_s",
	"prop_flag_japan",
	"prop_flag_japan_s",
	"prop_flag_ls",
	"prop_flag_lsfd",
	"prop_flag_lsfd_s",
	"prop_cable_hook_01",
	"prop_flag_lsservices",
	"prop_flag_lsservices_s",
	"prop_flag_ls_s",
	"prop_flag_mexico",
	"prop_flag_mexico_s",
	"csx_coastboulder_00",
	"des_tankercrash_01",
	"des_tankerexplosion_01",
	"des_tankerexplosion_02",
	"des_trailerparka_02",
	"des_trailerparkb_02",
	"des_trailerparkc_02",
	"des_trailerparkd_02",
	"des_traincrash_root2",
	"des_traincrash_root3",
	"des_traincrash_root4",
	"des_traincrash_root5",
	"des_finale_vault_end",
	"des_finale_vault_root001",
	"des_finale_vault_root002",
	"des_finale_vault_root003",
	"des_finale_vault_root004",
	"des_finale_vault_start",
	"des_vaultdoor001_root001",
	"des_vaultdoor001_root002",
	"des_vaultdoor001_root003",
	"des_vaultdoor001_root004",
	"des_vaultdoor001_root005",
	"des_vaultdoor001_root006",
	"des_vaultdoor001_skin001",
	"des_vaultdoor001_start",
	"des_traincrash_root6",
	"prop_ld_vault_door",
	"prop_vault_door_scene",
	"prop_vault_door_scene",
	"prop_vault_shutter",
	"p_fin_vaultdoor_s",
	"v_ilev_bk_vaultdoor",
	"prop_gold_vault_fence_l",
	"prop_gold_vault_fence_r",
	"prop_gold_vault_gate_01",
	"prop_bank_vaultdoor",
	"des_traincrash_root7",
	"prop_flag_russia",
	"prop_flag_russia_s",
	"prop_flag_s",
	"ch2_03c_props_rrlwindmill_lod",
	"prop_flag_sa",
	"prop_flag_sapd",
	"prop_flag_sapd_s",
	"prop_flag_sa_s",
	"prop_flag_scotland",
	"prop_flag_scotland_s",
	"prop_flag_sheriff",
	"prop_flag_sheriff_s",
	"prop_flag_uk",
	"prop_yacht_lounger",
	"prop_yacht_seat_01",
	"prop_yacht_seat_02",
	"prop_yacht_seat_03",
	"marina_xr_rocks_02",
	"marina_xr_rocks_03",
	"prop_test_rocks01",
	"prop_test_rocks02",
	"prop_test_rocks03",
	"prop_test_rocks04",
	"marina_xr_rocks_04",
	"marina_xr_rocks_05",
	"marina_xr_rocks_06",
	"prop_yacht_table_01",
	"csx_searocks_02",
	"csx_searocks_03",
	"csx_searocks_04",
	"csx_searocks_05",
	"csx_searocks_06",
	"p_yacht_chair_01_s",
	"p_yacht_sofa_01_s",
	"prop_yacht_table_02",
	"csx_coastboulder_00",
	"csx_coastboulder_01",
	"csx_coastboulder_02",
	"csx_coastboulder_03",
	"csx_coastboulder_04",
	"csx_coastboulder_05",
	"csx_coastboulder_06",
	"csx_coastboulder_07",
	"csx_coastrok1",
	"csx_coastrok2",
	"csx_coastrok3",
	"csx_coastrok4",
	"csx_coastsmalrock_01",
	"csx_coastsmalrock_02",
	"csx_coastsmalrock_03",
	"csx_coastsmalrock_04",
	"csx_coastsmalrock_05",
	"prop_yacht_table_03",
	"prop_flag_uk_s",
	"prop_flag_us",
	"prop_flag_usboat",
	"prop_flag_us_r",
	"prop_flag_us_s",
	"p_gasmask_s",
	"prop_flamingo"
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		local handle,object = FindFirstObject()
		local finished = false
		repeat
			Citizen.Wait(1)
			if IsEntityAttached(object) and DoesEntityExist(object) then
				if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
					ReqAndDelete(object,true)
				end
			end
			for i=1,#blackObjects do
				if GetEntityModel(object) == GetHashKey(blackObjects[i]) then
					ReqAndDelete(object,false)
				end
			end
			finished,object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
	end
end)

function ReqAndDelete(object,detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end

		if detach then
			DetachEntity(object,0,false)
		end

		SetEntityCollision(object,false,false)
		SetEntityAlpha(object,0.0,true)
		SetEntityAsMissionEntity(object,true,true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end