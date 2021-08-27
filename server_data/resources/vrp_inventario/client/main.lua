vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_inventario")


local show = false
local temp_inventory = nil
local temp_weight = nil
local temp_maxWeight = nil
local cooldown = 0

function openGui(inventory, weight, maxWeight)
  if show == false then
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        inventory = inventory,
        weight = weight,
        maxWeight = maxWeight
      }
    )
  end
end

function closeGui()

  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterNetEvent("vrp_inventario:openGui")
AddEventHandler("vrp_inventario:openGui",function()
    if cooldown > 0 and temp_inventory ~= nil and temp_weight ~= nil and temp_maxWeight ~= nil then
      openGui(temp_inventory, temp_weight, temp_maxWeight)
    else
      TriggerServerEvent("vrp_inventario:openGui")
    end
  end
)

RegisterNetEvent("vrp_inventario:updateInventory")
AddEventHandler("vrp_inventario:updateInventory",function(inventory, weight, maxWeight)
    cooldown = Config.AntiSpamCooldown
    temp_inventory = inventory
    temp_weight = weight
    temp_maxWeight = maxWeight
    openGui(temp_inventory, temp_weight, temp_maxWeight)
  end
)

RegisterNetEvent("vrp_inventario:UINotification")
AddEventHandler("vrp_inventario:UINotification",function(type, title, message)
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        notification = true,
        type = type,
        title = title,
        message = message
      }
    )
  end
)

RegisterNetEvent("vrp_inventario:closeGui")
AddEventHandler("vrp_inventario:closeGui",function()
  closeGui()
end)

RegisterNetEvent("vrp_inventario:objectForAnimation")
AddEventHandler("vrp_inventario:objectForAnimation",function(type)
    local ped = PlayerPedId()
    DeleteObject(object)
    bone = GetPedBoneIndex(ped, 60309)
    coords = GetEntityCoords(ped)
    modelHash = GetHashKey(type)

    RequestModel(modelHash)
    object = CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, false)
    AttachEntityToEntity(object, ped, bone, 0.1, 0.0, 0.0, 1.0, 1.0, 1.0, 1, 1, 0, 0, 2, 1)
    Citizen.Wait(2500)
    DeleteObject(object)
  end
)

RegisterNUICallback("close",function(data)
    closeGui()
  end
)

RegisterNUICallback("useItem",function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("vrp_inventario:useItem", data)
  end
)

RegisterNUICallback("dropItem",function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("vrp_inventario:dropItem", data)
  end
)

RegisterNUICallback("giveItem",function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("vrp_inventario:giveItem", data)
  end
)

RegisterCommand("inventory",function(source, args)
    TriggerEvent("vrp_inventario:openGui")
  end
)

Citizen.CreateThread(
  function()
    while true do
      Citizen.Wait(0)
      if IsControlPressed(0, Config.OpenMenu) then
        TriggerEvent("vrp_inventario:openGui")
      end
    end
  end
)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    if cooldown > 0 then 
      cooldown = cooldown - 1
    end
  end
end)

AddEventHandler("onResourceStop",function(resource)
    if resource == GetCurrentResourceName() then
      closeGui()
    end
  end
)

local cancelando = false
RegisterNetEvent('cancelando')
AddEventHandler('cancelando',function(status)
    cancelando = status
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if cancelando then
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
			DisableControlAction(0,57,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,245,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,38,true)
		end
	end
end)
