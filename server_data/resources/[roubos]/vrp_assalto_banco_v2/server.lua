
--===============================================================--
--========================== NÃO MEXER ==========================--
--===============================================================--


local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local lastrobbed = 0 -- don't change this
local info = {stage = 0, style = nil, locked = false}
local totalcash = 0
local PoliceDoors = {
    {loc = vector3(257.10, 220.30, 106.28), txtloc = vector3(257.10, 220.30, 106.28), model = "hei_v_ilev_bk_gate_pris", model2 = "hei_v_ilev_bk_gate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(236.91, 227.50, 106.29), txtloc = vector3(236.91, 227.50, 106.29), model = "v_ilev_bk_door", model2 = "v_ilev_bk_door", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(262.35, 223.00, 107.05), txtloc = vector3(262.35, 223.00, 107.05), model = "hei_v_ilev_bk_gate2_pris", model2 = "hei_v_ilev_bk_gate2_pris", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(252.72, 220.95, 101.68), txtloc = vector3(252.72, 220.95, 101.68), model = "hei_v_ilev_bk_safegate_pris", model2 = "hei_v_ilev_bk_safegate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(261.01, 215.01, 101.68), txtloc = vector3(261.01, 215.01, 101.68), model = "hei_v_ilev_bk_safegate_pris", model2 = "hei_v_ilev_bk_safegate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(253.92, 224.56, 101.88), txtloc = vector3(253.92, 224.56, 101.88), model = "v_ilev_bk_vaultdoor", model2 = "v_ilev_bk_vaultdoor", obj = nil, obj2 = nil, locked = true}
}
RegisterServerEvent('lixeiroHeist:GetData')
AddEventHandler('lixeiroHeist:GetData', function()
    TriggerClientEvent('lixeiroHeist:GetData', source, info)
end)
RegisterServerEvent('lixeiroHeist:GetDoors')
AddEventHandler('lixeiroHeist:GetDoors', function()
    TriggerClientEvent('lixeiroHeist:GetDoors', source, PoliceDoors)
end)

RegisterServerEvent('lixeiroHeist:startevent')
AddEventHandler('lixeiroHeist:startevent', function(method)
    local copcount = 0
	local user_id = vRP.getUserId(source)

    if not info.locked then
        if (os.time() - Config.cooldown) > lastrobbed then
            local cops = vRP.getUsersByPermission(Config.PermCops)
			copcount = #cops
            if copcount >= Config.MinCops then
                if method == 1 then
					if vRP.tryGetInventoryItem(user_id,Config.items.thermal,1,false) then
                        TriggerClientEvent('lixeiroHeist:startevent', source, true)
                        info.stage = 1
                        info.style = 1
                        info.locked = true
                    else
                        TriggerClientEvent('lixeiroHeist:startevent', source, Config.text.nothermal)
                    end
                elseif method == 2 then
                    if vRP.tryGetInventoryItem(user_id,Config.items.lockpick,1,false) then
                        info.stage = 1
                        info.style = 2
                        info.locked = true
                        TriggerClientEvent('lixeiroHeist:startevent', source, true)
                    else
                        TriggerClientEvent('lixeiroHeist:startevent', source, Config.text.nolockpick)
                    end
                end
            else
                TriggerClientEvent('lixeiroHeist:startevent', source, Config.text.mincops)
            end
        else
            TriggerClientEvent('lixeiroHeist:startevent', source, math.floor((Config.cooldown - (os.time() - lastrobbed)) / 60)..":"..math.fmod((Config.cooldown - (os.time() - lastrobbed)), 60).." "..Config.text.timeleft)
        end
    else
        TriggerClientEvent('lixeiroHeist:startevent', source, Config.text.alreadyrobbed)
    end
end)

RegisterServerEvent('lixeiroHeist:checkItem')
AddEventHandler('lixeiroHeist:checkItem', function(itemname)
	local user_id = vRP.getUserId(source)
    if vRP.tryGetInventoryItem(user_id,itemname,1,false) then
        TriggerClientEvent('lixeiroHeist:checkItem', source, true)
    else
        TriggerClientEvent('lixeiroHeist:checkItem', source, false)
    end
end)

RegisterServerEvent('lixeiroHeist:gettotalcash')
AddEventHandler('lixeiroHeist:gettotalcash', function()
    TriggerClientEvent('lixeiroHeist:gettotalcash', source, totalcash)
end)

RegisterServerEvent("lixeiroHeist:updatecheck")
AddEventHandler("lixeiroHeist:updatecheck", function(var, status)
    TriggerClientEvent("lixeiroHeist:updatecheck_c", -1, var, status)
end)
--[[RegisterServerEvent("lixeiroHeist:toggleDoor")
AddEventHandler("lixeiroHeist:toggleDoor", function(door, coords, status)
    TriggerClientEvent("lixeiroHeist:toggleDoor_c", -1, door, coords, status)
end)]]
RegisterServerEvent("lixeiroHeist:policeDoor")
AddEventHandler("lixeiroHeist:policeDoor", function(doornum, status)
    PoliceDoors[doornum].locked = status
    TriggerClientEvent("lixeiroHeist:policeDoor_c", -1, doornum, status)
end)
RegisterServerEvent("lixeiroHeist:moltgate")
AddEventHandler("lixeiroHeist:moltgate", function(x, y, z, oldmodel, newmodel, method)
    TriggerClientEvent("lixeiroHeist:moltgate_c", -1, x, y, z, oldmodel, newmodel, method)
end)
RegisterServerEvent("lixeiroHeist:fixdoor")
AddEventHandler("lixeiroHeist:fixdoor", function(hash, coords, heading)
    TriggerClientEvent("lixeiroHeist:fixdoor_c", -1, hash, coords, heading)
end)
RegisterServerEvent("lixeiroHeist:openvault")
AddEventHandler("lixeiroHeist:openvault", function(method)
    TriggerClientEvent("lixeiroHeist:openvault_c", -1, method)
end)
RegisterServerEvent("lixeiroHeist:startloot")
AddEventHandler("lixeiroHeist:startloot", function()
    TriggerClientEvent("lixeiroHeist:startloot_c", -1)
end)
RegisterServerEvent("lixeiroHeist:rewardCash")
AddEventHandler("lixeiroHeist:rewardCash", function()
	local user_id = vRP.getUserId(source)
    local reward = math.random(Config.mincash, Config.maxcash)

	vRP.giveInventoryItem(user_id, Config.items.dirty_money, reward, true)
    totalcash = totalcash + reward
	
end)
RegisterServerEvent("lixeiroHeist:rewardGold")
AddEventHandler("lixeiroHeist:rewardGold", function()
    local user_id = vRP.getUserId(source)

	vRP.giveInventoryItem(user_id, Config.items.gold, 1, true)
end)
RegisterServerEvent("lixeiroHeist:rewardDia")
AddEventHandler("lixeiroHeist:rewardDia", function()
	local user_id = vRP.getUserId(source)

	vRP.giveInventoryItem(user_id, Config.items.diamond, 1, true)
end)
RegisterServerEvent("lixeiroHeist:giveidcard")
AddEventHandler("lixeiroHeist:giveidcard", function()
    local src = source
    local user_id = vRP.getUserId(src)

	vRP.giveInventoryItem(user_id, Config.items.id_card, 1, true)
end)
RegisterServerEvent("lixeiroHeist:ostimer")
AddEventHandler("lixeiroHeist:ostimer", function()
    lastrobbed = os.time()
    info.stage, info.style, info.locked = 0, nil, false
    Citizen.Wait(300000)
    totalcash = 0
    TriggerClientEvent("lixeiroHeist:reset", -1)
end)
RegisterServerEvent("lixeiroHeist:gas")
AddEventHandler("lixeiroHeist:gas", function()
    TriggerClientEvent("lixeiroHeist:gas_c", -1)
end)
RegisterServerEvent("lixeiroHeist:ptfx")
AddEventHandler("lixeiroHeist:ptfx", function(method)
    local xPlayers = vRP.getUsers()

	for k,v in pairs(xPlayers) do
        if v ~= source then
            TriggerClientEvent("lixeiroHeist:ptfx_c", v, method)
        end
    end
end)
RegisterServerEvent("lixeiroHeist:alarm_s")
AddEventHandler("lixeiroHeist:alarm_s", function(toggle)
    if Config.enablesound then
        TriggerClientEvent("lixeiroHeist:alarm", -1, toggle)
    end
    TriggerClientEvent("lixeiroHeist:policenotify", -1, toggle)
end)
