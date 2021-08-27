local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_mecanico")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = 472.221
local CoordenadaY = -1310.130
local CoordenadaZ = 29.224
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
    [0] = { ['x'] = 2137.96,['y'] = 2905.55,['z'] = 50.76},
	[1] = { ['x'] = 2137.96,['y'] = 2905.55,['z'] = 50.76},
	[2] = { ['x'] = 2107.15,['y'] = 2928.26,['z'] = 50.93},
	[3] = { ['x'] = 2076.85,['y'] = 2950.15,['z'] = 49.92},
	[5] = { ['x'] = 2049.79,['y'] = 2946.23,['z'] = 57.51},
	[6] = { ['x'] = 2021.15,['y'] = 2945.28,['z'] = 47.36},
	[7] = { ['x'] = 1999.95,['y'] = 2935.25,['z'] = 50.47},
	[8] = { ['x'] = 1985.66,['y'] = 2929.56,['z'] = 46.55}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(23,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
				if distance <= 2.2 then
					DrawText3D(CoordenadaX,CoordenadaY,CoordenadaZ, "PRESSIONE  ~b~E~w~  PARA INICIAR O TRABALHO")
					if IsControlJustPressed(0,38) then
						servico = true
						selecionado = math.random(8)
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z+0.30,0,0,0,0,180.0,130.0,2.0,2.0,1.0,240,200,80,50,1,0,0,1)
				if distance <= 2.5 then
					
						if IsControlJustPressed(0,38) and emP.checkPayment() then
							RemoveBlip(blips)
							backentrega = selecionado
							while true do
								if backentrega == selecionado then
									selecionado = math.random(8)
									TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, false)
								else
									break
								end
								Citizen.Wait(3000)
							end
							Citizen.Wait(3000)
							ClearPedTasks(PlayerPedId(-1))
							CriandoBlip(locs,selecionado)
						end
					
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			if IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local dds = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),479.66217041016,-1326.1356201172,29.207496643066,true)
		DrawMarker(23,479.66217041016,-1326.1356201172,29.207496643066-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
		if dds <= 3.0  then
			DrawText3D(479.66217041016,-1326.1356201172,29.207496643066, "PRESSIONE  ~b~E~w~  PARA PEGAR O EMPREGO ")
			if IsControlJustPressed(0,38) then
				TriggerServerEvent("vrp_mec:servicos")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
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
function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Ferramenta")
	EndTextCommandSetBlipName(blips)
end