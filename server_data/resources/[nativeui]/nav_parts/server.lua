local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


RegisterServerEvent('crz_parts:permissao')
AddEventHandler('crz_parts:permissao', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasGroup(user_id,"Mecanico") or vRP.hasGroup(user_id,"Bennys") then
		TriggerClientEvent('crz_parts:permissao', src)
	end
end)

RegisterServerEvent('crz_parts:AA1')
AddEventHandler('crz_parts:AA1', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("tinta")*2 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id,100) then
		    vRP.giveInventoryItem(user_id,"tinta",2)
		    TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>2x tintas</b>, R$ 100 .")
		else
		    TriggerClientEvent("Notify",source,"aviso","Dinheiro <b>insuficiente</b>")
	    end
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_parts:AA2')
AddEventHandler('crz_parts:AA2', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("parts")*2 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id,150) then
		    vRP.giveInventoryItem(user_id,"parts",2)
		    TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>2x Peças</b>, R$ 150 .")
		else
		    TriggerClientEvent("Notify",source,"aviso","Dinheiro <b>insuficiente</b>")
	    end
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_parts:AA3')
AddEventHandler('crz_parts:AA3', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("parts")*10 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id,500) then
		    vRP.giveInventoryItem(user_id,"parts",10)
		    TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>10x Peças</b>, R$ 500 .")
		else
		    TriggerClientEvent("Notify",source,"aviso","Dinheiro <b>insuficiente</b>")
	    end
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)