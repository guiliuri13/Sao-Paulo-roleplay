local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("reviver")
vRP = Proxy.getInterface("vRP")


distanciaSpawn = 100
EstiloDirecao = 786603  

local apertarBotao = true  -- PRECISA APERTAR BOTAO PRO SAMU VIR ?
local botao = 38 -- TECLA E 

function openGui()
  SendNUIMessage({openMeter = true})
end

--Fechar o Gui e desabilitar o NUI
function closeGui()
  SendNUIMessage({openMeter = false})

end

chamou = false
samu = false
Citizen.CreateThread( function()
    while true do
    Wait(0)
    player = PlayerPedId()
    cdsPly = GetEntityCoords(player)
    if GetEntityHealth(player) <= 100 and not chamou then 
 TriggerServerEvent('verificaSamu')
    if not samu then 
    openGui()
        if vRP.isInComa() then 
            if apertarBotao  then
                if IsControlJustPressed(0, botao) then 
                chamou = true
                closeGui() 
                TriggerServerEvent('Reviver:reviver')
                Wait(10)
                end
            else 
                TriggerServerEvent('Reviver:reviver')
                Wait(10)
            end
        end 
    end
  else
  closeGui()
  
  end
    end
end)

RegisterNetEvent('SemSamu')
AddEventHandler('SemSamu', function()

samu =false
end) 

RegisterNetEvent('comSamu')
AddEventHandler('comSamu', function()
  closeGui()
  print("comsamu")
samu =true
end) 


RegisterNetEvent('fecharGui')
AddEventHandler('fecharGui', function()
closeGui()  
chamou =false
end)

    while not HasModelLoaded(driverhash) and RequestModel(driverhash) or not HasModelLoaded(vehhash) and RequestModel(vehhash) do
        RequestModel(driverhash)
        RequestModel(vehhash)
        Citizen.Wait(0)
    end

    if DoesEntityExist(veiculoSamu) then
        DeleteVeh(veiculoSamu, medico)
        SpawnaAmbulancia(playerPos.x, playerPos.y, playerPos.x, vehhash, driverhash)
    else
        SpawnaAmbulancia(playerPos.x, playerPos.y, playerPos.x, vehhash, driverhash)
    end
    GoToTarget(playerPos.x, playerPos.y, playerPos.z, veiculoSamu, medico, vehhash, player)
end)




RegisterNetEvent('VehicleSpawn')
AddEventHandler('VehicleSpawn', function(vehicleName)
  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey(vehicleName)
  RequestModel(vehicle)
  while not HasModelLoaded(vehicle) do
    Wait(1)
  end
  local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
  local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, false)
  SetVehicleOnGroundProperly(spawned_car)
  SetModelAsNoLongerNeeded(vehicle)
	SetVehicleDoorsLocked(NetToVeh(spawned_car),1)
		SetVehicleDoorsLockedForAllPlayers(NetToVeh(spawned_car),false)

  Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
  SetPedIntoVehicle(PlayerPedId(),spawned_car, -1)
end)
