local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


RegisterServerEvent('crz_mecanico:permissao')
AddEventHandler('crz_mecanico:permissao', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasGroup(user_id,"Mecanico") or vRP.hasGroup(user_id,"Bennys") then
		TriggerClientEvent('crz_mecanico:permissao', src)
	end
end)

RegisterServerEvent('crz_mecanico:AA1')
AddEventHandler('crz_mecanico:AA1', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("ferramenta")*2 <= vRP.getInventoryMaxWeight(user_id) then
		vRP.giveInventoryItem(user_id,"ferramenta",2)
		TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>2x Ferramentas</b>, sem custos.")
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_mecanico:AA2')
AddEventHandler('crz_mecanico:AA2', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("repairkit")*2 <= vRP.getInventoryMaxWeight(user_id) then
		vRP.giveInventoryItem(user_id,"repairkit",2)
		TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>2x repairkit</b>, sem custos.")
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_mecanico:AA3')
AddEventHandler('crz_mecanico:AA3', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("militec")*2 <= vRP.getInventoryMaxWeight(user_id) then
		vRP.giveInventoryItem(user_id,"militec",2)
		TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>2x militec</b>, sem custos.")
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)