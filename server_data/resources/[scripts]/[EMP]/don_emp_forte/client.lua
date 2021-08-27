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

emp = Tunnel.getInterface("don_emp_forte")
vRP = Proxy.getInterface("vRP")

local dsForteBlip = nil 

local ForteTrab = false
local ForteId = 0

local ForteRota = {
      [1] = { ['x'] = 151.68, ['y'] = -1029.68, ['z'] = 29.19},
	  [2] = { ['x'] = -1219.86, ['y'] = -318.10, ['z'] = 37.53},
	  [3] = { ['x'] = -2974.84, ['y'] = 483.81, ['z'] = 15.26},
	  [4] = { ['x'] = -115.88, ['y'] = 6457.94, ['z'] = 31.46},
	  [5] = { ['x'] = 317.54, ['y'] = -268.08, ['z'] = 53.74},
	  [6] = { ['x'] = -346.01, ['y'] = -30.21, ['z'] = 47.37},
	  [7] = { ['x'] = 1175.71, ['y'] = 2689.95, ['z'] = 37.81},
	  [8] = { ['x'] = 135.14, ['y'] = -882.27, ['z'] = 30.31},
	  [9] = { ['x'] = -1320.37, ['y'] = -837.56, ['z'] = 16.78},
}
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		local ForteInicio = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -5.2795009613037,-675.42218017578,32.338073730469, true)
		if ForteInicio < 10.0  then
		    sleep = 5
			DrawTextForte(-5.2795009613037,-675.42218017578,32.338073730469, "[E] PARA INICIAR ENTREGA DE <b>MALOTES</b>")
			DrawMarker(20,-5.2795009613037,-675.42218017578,32.338073730469,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
			if ForteInicio < 3.0  then
		        if IsControlJustPressed(0,54) then
				    local vehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
   				    if ForteTrab == false and IsVehicleModel(vehicle,GetHashKey("Stockade")) then
			            CriandoBlipForte(ForteRota[1].x,ForteRota[1].y,ForteRota[1].z)
						ForteId = 1
						ForteTrab = true
					    TriggerEvent("Notify","importante","V? entregar os malotes")
		            end 
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
	    if ForteTrab then 
		    local ForteMedio = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), ForteRota[ForteId].x,ForteRota[ForteId].y,ForteRota[ForteId].z, true)
		    if ForteMedio < 10.0  then
			    sleep = 5
				DrawMarker(1,ForteRota[ForteId].x,ForteRota[ForteId].y,ForteRota[ForteId].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				if IsControlJustPressed(0,54) then
				    local vehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
   				    if ForteTrab == true and IsVehicleModel(vehicle,GetHashKey("Stockade")) then
				        ForteId = ForteId + 1
				    	if ForteId == 10 then 
				    	    ForteId = 1
			                CriandoBlipForte(ForteRota[ForteId].x,ForteRota[ForteId].y,ForteRota[ForteId].z)
				    		TriggerServerEvent('DonSpeed:PagamentoForte')
				    	else
				    	    CriandoBlipForte(ForteRota[ForteId].x,ForteRota[ForteId].y,ForteRota[ForteId].z)
				    		Citizen.Wait(3000)
				    		TriggerServerEvent('DonSpeed:PagamentoForte')
				    	end
				    end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
Citizen.CreateThread(function()
	while true do
	    local sleep = 1000
		if IsControlJustPressed(0,168) and ForteTrab == true then
		   RemoveBlip(dsForteBlip)
		   ForteTrab = false
		   ForteId = 0
		   TriggerEvent("Notify","importante","Cancelado com sucesso .")
		end
		Citizen.Wait(sleep)
	end
end)

function CriandoBlipForte(x,y,z)
    RemoveBlip(dsForteBlip)
	dsForteBlip = AddBlipForCoord(x,y,z)
	SetBlipSprite(dsForteBlip,1)
	SetBlipColour(dsForteBlip, 6)
	SetBlipScale(dsForteBlip)
	SetBlipAsShortRange(dsForteBlip,false)
	SetBlipRoute(dsForteBlip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de dinheiro")
	EndTextCommandSetBlipName(dsForteBlip)
end

function DrawTextForte(x,y,z, text)
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