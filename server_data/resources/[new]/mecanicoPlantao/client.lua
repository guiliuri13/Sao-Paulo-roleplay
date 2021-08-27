local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
func = Tunnel.getInterface("mecanico")
vRP = Proxy.getInterface("vRP")

distanciaSpawn = 70
EstiloDirecao = 1074528293

local apertarBotao = true -- PRECISA APERTAR BOTAO PRO SAMU VIR ?
local botao = 38 -- TECLA E
local carro 

function openGui()
  SendNUIMessage({openMeter = true})
end

--Fechar o Gui e desabilitar o NUI
function closeGui()
  SendNUIMessage({openMeter = false})
end

function AtualizaHUD(rota)
  SendNUIMessage(
    {
      updateBalance = true,
      rotatxt = rota
    }
  )
end

chamou = false
mec = false
Citizen.CreateThread(
  function()
    while true do
      Wait(1)
      player = PlayerPedId()
      cdsPly = GetEntityCoords(player)
      carro = GetVehiclePedIsUsing(player)
      if IsControlJustPressed(0, botao) then
  
      end
    GetVehicleBodyHealth(carro)
      motor = GetVehicleEngineHealth(carro)
      if motor <= 600 and motor > 101 then
        openGui()
        AtualizaHUD("defeito")
 TriggerServerEvent('verificaMec')

      elseif motor <= 100 and not mec and not chamou then
        openGui()
        AtualizaHUD("parou")
        print("estragou")
        if apertarBotao then
          if IsControlJustPressed(0, botao) then
            chamou = true
            closeGui()
            TriggerServerEvent("repararCarro")
            Wait(10)
          end
        else
          TriggerServerEvent("repararCarro")
          Wait(10)
        end
      elseif chamou or motor > 600 or  mec then
        closeGui()
      end
    end
  end
)


RegisterNetEvent('semMec')
AddEventHandler('semMec', function()

mec =false
end) 

RegisterNetEvent('comMec')
AddEventHandler('comMec', function()

mec =true
end) 






RegisterNetEvent("fecharGui")
AddEventHandler(
  "fecharGui",
  function()
    closeGui()
    chamou = false
  end
)

RegisterNetEvent("FixCarro")
AddEventHandler("FixCarro", function()

      player = PlayerPedId()
      carro = GetVehiclePedIsUsing(player)

        SetVehicleFixed(carro)
				SetVehicleDirtLevel(carro,0.0)
				SetVehicleUndriveable(carro,false)
				SetEntityAsMissionEntity(carro,true,true)
				SetVehicleOnGroundProperly(carro)
				SetVehicleFuelLevel(carro,fuel)


end)

RegisterNetEvent('reparar')
AddEventHandler('reparar',function(vehicle)
	TriggerServerEvent("tryreparar",VehToNet(vehicle))
end)

RegisterNetEvent('syncreparar')
AddEventHandler('syncreparar',function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local fuel = GetVehicleFuelLevel(v)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleFixed(v)
				SetVehicleDirtLevel(v,0.0)
				SetVehicleUndriveable(v,false)
				SetEntityAsMissionEntity(v,true,true)
				SetVehicleOnGroundProperly(v)
				SetVehicleFuelLevel(v,fuel)
			end
		end
	end
end)


RegisterNetEvent("chamaMecanico")
AddEventHandler(
  "chamaMecanico",
  function()
    player = PlayerPedId()
    playerPos = GetEntityCoords(player)
    print("NPC")
    local driverhash = 1498487404
    RequestModel(driverhash)
    local vehhash = GetHashKey("Towtruck")
    RequestModel(vehhash)

    while not HasModelLoaded(driverhash) and RequestModel(driverhash) or
      not HasModelLoaded(vehhash) and RequestModel(vehhash) do
      RequestModel(driverhash)
      RequestModel(vehhash)
      Citizen.Wait(0)
    end

    if DoesEntityExist(veiculoSamu) then
      DeleteVeh(veiculoSamu, medico)
      SpawnaAmbulancia(GetEntityCoords(carro).x, GetEntityCoords(carro).y, GetEntityCoords(carro).x, vehhash, driverhash)
    else
      SpawnaAmbulancia(GetEntityCoords(carro).x, GetEntityCoords(carro).y, GetEntityCoords(carro).x, vehhash, driverhash)
    end

     

    GoToTarget( GetEntityCoords(carro).x,  GetEntityCoords(carro).y,  GetEntityCoords(carro).z, veiculoSamu, medico, vehhash, carro)
  end
)

function notificacao(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("VehicleSpawn")
AddEventHandler(
  "VehicleSpawn",
  function(vehicleName)
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
    SetVehicleDoorsLocked(NetToVeh(spawned_car), 1)
    SetVehicleDoorsLockedForAllPlayers(NetToVeh(spawned_car), false)
    print(vehicleName)
    Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
    SetPedIntoVehicle(PlayerPedId(), spawned_car, -1)
  end
)
