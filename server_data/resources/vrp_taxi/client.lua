------------------------------------------------------
----------https://github.com/DaviReisVieira-----------
------------EMAIL:VIEIRA08DAVI38@GMAIL.COM------------
---------------DISCORD: DAVI REIS #2602---------------
------------------------------------------------------

-- Settings
local TaxiGuiAtivo = true -- ATIVA/DESATIVA o GUI(Padrão: true)
local Custobandeira = 0.25 --(1.00 = R$60 por minuto) Custo por minuto
local custoporKm = 3.0 -- Custo por Km
local CustoBase = 4.50 -- Custo Inicial

DecorRegister("bandeiras", 1)
DecorRegister("kilometros", 1)
DecorRegister("meteractive", 2)
DecorRegister("CustoBase", 1)
DecorRegister("custoporKm", 1)
DecorRegister("Custobandeira", 1)

--Variáveis NUI
local inTaxi = false
local meterOpen = false
local meterActive = false

--Abrir Gui e Focus NUI
function openGui()
  SendNUIMessage({openMeter = true})
end

--Fechar o Gui e desabilitar o NUI
function closeGui()
  SendNUIMessage({openMeter = false})
  meterOpen = false
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    if NoTaxi() and GetPedInVehicleSeat(veh, -1) ~= ped then
      local ped = GetPlayerPed(-1)
      local veh = GetVehiclePedIsIn(ped, false)
      TriggerEvent('taxi:updatebandeira', veh)
      openGui()
      meterOpen = true
    end
    if meterActive and GetPedInVehicleSeat(veh, -1) == ped then
      local _bandeira = DecorGetFloat(veh, "bandeiras")
      local _kilometros = DecorGetFloat(veh, "kilometros")
      local _Custobandeira = DecorGetFloat(veh, "Custobandeira")

      if _Custobandeira ~= 0 then
        DecorSetFloat(veh, "bandeiras", _bandeira + _Custobandeira)
      else
        DecorSetFloat(veh, "bandeiras", _bandeira + Custobandeira)
      end
      DecorSetFloat(veh, "kilometros", _kilometros + round(GetEntitySpeed(veh) * 0.001, 5))
      TriggerEvent('taxi:updatebandeira', veh)
    end
    if NoTaxi() and not GetPedInVehicleSeat(veh, -1) == ped then
      TriggerEvent('taxi:updatebandeira', veh)
    end
  end
end)

if TaxiGuiAtivo then
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if(NoTaxi()) then
        if (inTaxi == false) then
          msg = "Pressiona F10 para abrir o taxímetro"
          TriggerEvent("Notify","sucesso", msg)
          TriggerEvent('taxi:toggleDisplay')
          Citizen.Wait(100)
        end
        inTaxi = true
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
          if IsControlJustReleased(0, 57)  then -- F10
            TriggerEvent('taxi:toggleDisplay')
            Citizen.Wait(100)
          end
          if IsControlJustReleased(0, 121)  then -- PageUp
            TriggerEvent('taxi:toggleHire')
            Citizen.Wait(100)
          end
          if IsControlJustReleased(0,11) then -- PageDn
            TriggerEvent('taxi:resetMeter')
            Citizen.Wait(100)
          end
        end
      else
        if(meterOpen) then
          closeGui()
        end
        meterOpen = false
      end
    end
  end)
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

--Métodos de retorno de chamada NUI
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)

RegisterNetEvent('taxi:toggleDisplay')
AddEventHandler('taxi:toggleDisplay', function()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
    if meterOpen then
      closeGui()
      meterOpen = false
    else
      local _bandeira = DecorGetFloat(veh, "bandeiras")
      if _bandeira < CustoBase then
        DecorSetFloat(veh, "bandeiras", CustoBase)
      end
      TriggerEvent('taxi:updatebandeira', veh)
      openGui()
      meterOpen = true
    end
  end
end)

RegisterNetEvent('taxi:toggleHire')
AddEventHandler('taxi:toggleHire', function()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
    if meterActive then
      SendNUIMessage({meterActive = false})
      meterActive = false
      DecorSetBool(veh, "meteractive", false)
      Citizen.Trace("Trigger OFF")
    else
      SendNUIMessage({meterActive = true})
      meterActive = true
      DecorSetBool(veh, "meteractive", true)
      Citizen.Trace("Trigger ON")
    end
  end
end)

RegisterNetEvent('taxi:resetMeter')
AddEventHandler('taxi:resetMeter', function()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  if(NoTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
    local _bandeira = DecorGetFloat(veh, "bandeiras")
    local _kilometros = DecorGetFloat(veh, "kilometros")
    DecorSetFloat(veh, "CustoBase", CustoBase)
    DecorSetFloat(veh, "custoporKm", custoporKm)
    DecorSetFloat(veh, "Custobandeira", Custobandeira)
    DecorSetFloat(veh, "bandeiras", DecorGetFloat(veh, "CustoBase"))
    DecorSetFloat(veh, "kilometros", 0.0)
    TriggerEvent('taxi:updatebandeira', veh)
  end
end)

--Verifique se o jogador está em um veh
function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

--Confirma se o PLAYER está em um TT
function NoTaxi()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  local model = GetEntityModel(veh)
  local displaytext = GetDisplayNameFromVehicleModel(model)
  local name = GetLabelText(displaytext)
  if (name == "Táxi") then
    return true
  else
    return false
  end
end

--Verifique se o jogador está em um táxi
function ReturnVehicle()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  local model = GetEntityModel(veh)
  local displaytext = GetDisplayNameFromVehicleModel(model)
  local name = GetLabelText(displaytext)
end

--Verifique se o jogador está perto de outro jogador
function IsNearPlayer(player)
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  if(distance <= 5) then
    return true
  end
end

--Enviar mensagem NUI para atualizar
RegisterNetEvent('taxi:updatebandeira')
AddEventHandler('taxi:updatebandeira', function(veh)
  local id = PlayerId()
  local playerName = GetPlayerName(id)
  local _bandeira = DecorGetFloat(veh, "bandeiras")
  local _kilometros = DecorGetFloat(veh, "kilometros")
  local Custobandeira = _bandeira + (_kilometros * DecorGetFloat(veh, "custoporKm"))


	SendNUIMessage({
		updateBalance = true,
		balance = string.format("%.2f", Custobandeira),
    player = string.format("%.2f", _kilometros),
    meterActive = DecorGetBool(veh, "meteractive")
	})
end)
--[[
RegisterNetEvent('vRP_taxi:user_settings')
AddEventHandler('vRP_taxi:user_settings', function(action, value)
  if action ~= nil and NoTaxi() then
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    if GetPedInVehicleSeat(veh, -1) == ped then
      if action == "show" then
        msg = "<b>Current meter values</b></b><br /><b>Initial</b> = $"..CustoBase.."<br /><b>bandeira per mile</b> = $"..custoporKm.."<br /><b>bandeira per minute</b> = $"..Custobandeira*60
      elseif action == "initial" then
        CustoBase = value*1.0
        DecorSetFloat(veh, "bandeiras", CustoBase)
        TriggerEvent('taxi:updatebandeira', veh)
        msg = "<b>Initial bandeira set to </b>$"..value
        DecorSetFloat(veh, "CustoBase", value*1.0)
      elseif action == "mile" then
        custoporKm = value
        msg = "<b>bandeira per mile set to </b>$"..value
        DecorSetFloat(veh, "custoporKm", value)
      elseif action == "minute" then
        Custobandeira = value/60
        msg = "<b>bandeira per minute set to </b>$"..value
        DecorSetFloat(veh, "Custobandeira", value/60)
      end
      if msg ~= nil then
        TriggerEvent("pNotify:SendNotification", {text = msg , type = "success", layout = "centerLeft", queue = "global", theme = "gta", timeout = 5000})
      end
    end
  end
end)]]
