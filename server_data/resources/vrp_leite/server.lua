-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- RESOURCE TUNNEL/PROXY
vRPl = {}
Tunnel.bindInterface("vrp_leite",vRPl)
Proxy.addInterface("vrp_leite",vRPl)
Lclient = Tunnel.getInterface("vrp_leite")

cfg = module("vrp_leite", "cfg/config")

Citizen.CreateThread(function()
	for k,v in pairs(cfg.leite) do
		vRP.defInventoryItem(k,v.name,v.desc,v.choices,v.weight)
	end
end)

local units = {}

Citizen.CreateThread(function()
	while true do
		for k,v in pairs(cfg.vacas) do
			units[k] = cfg.max_leite
		end
		Citizen.Wait(1000*cfg.cooldown_timer)
	end
end)


local coletar = true

function vRPl.coletarLeite(coletarP,k)
	coletar = coletarP
	local source = source
	local user_id = vRP.getUserId(source)
	local InventoryWeight = {}
	local ItemWeight = {}
	local InventoryMaxWeight = {}
	InventoryWeight[user_id] = vRP.getInventoryWeight(user_id)
	ItemWeight[user_id] = vRP.getItemWeight("leite")
	InventoryMaxWeight[user_id] = vRP.getInventoryMaxWeight(user_id)
	if vRP.hasPermission(user_id,cfg.permission) then
		if coletar then
			vRPclient._setProgressBar(source,"vRP:leite","center","...",255,255,255,0)
			TriggerClientEvent("leite:anim",source)
			TriggerClientEvent("leite:prop",source)
		end
		while coletar do
			Citizen.Wait(1000)
			vRPclient._setProgressBarValue(source,"vRP:leite",math.floor(units[k]/cfg.max_leite*100.0))
			if units[k] > 0 then
				vRPclient._setProgressBarText(source,"vRP:leite","Tirando leite: "..units[k].."/"..cfg.max_leite)
				if ((InventoryWeight[user_id]+ItemWeight[user_id]) <= InventoryMaxWeight[user_id]) then
					vRP._giveInventoryItem(user_id,"leite",1,true)
					units[k] = units[k] - 1
					InventoryWeight[user_id] = InventoryWeight[user_id] + 1
				else
					vRPclient._notify(source, "~r~Seu inventário está cheio.")
				end
			else
				vRPclient._setProgressBarText(source,"vRP:leite","Vazio")
			end
		end
		vRPclient._removeProgressBar(source,"vRP:leite")
	else
		vRPclient._notify(source, "~r~Você não possui permissão.")
	end
end

function vRPl.abater()
	local user_id = vRP.getUserId(source)
	local amount = math.random(cfg.min_carne,cfg.max_carne)
	if ((vRP.getInventoryWeight(user_id)+(vRP.getItemWeight("carne"))*amount) <= vRP.getInventoryMaxWeight(user_id)) then
		vRP._giveInventoryItem(user_id,"carne",amount,true)
	else
		vRPclient.notify(source, "~r~Seu inventário está cheio.")
	end
end

function vRPl.conduzir(k)
	local user_id = vRP.getUserId(source)
	local amount = math.random(cfg.min_carne,cfg.max_carne)
	if vRP.hasPermission(user_id,cfg.permission) then
		TriggerClientEvent("vrp:abater",source,k)
	else
		vRPclient.notify(source,"~r~Não possui permissão.")
	end
end

RegisterNetEvent('vrp:perm')
AddEventHandler("vrp:perm", function(user_id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and vRP.hasPermission(user_id,cfg.permission) then
		TriggerClientEvent("vrp:perm",source,true)
	else
		TriggerClientEvent("vrp:perm",source,false)
	end
end)

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
	TriggerClientEvent("vrp:spawnped",source)
end)