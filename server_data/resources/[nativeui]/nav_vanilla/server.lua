local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


RegisterServerEvent('crz_vanilla:permissao')
AddEventHandler('crz_vanilla:permissao', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasGroup(user_id,"Vanilla") then
		TriggerClientEvent('crz_vanilla:permissao', src)
	end
end)

RegisterServerEvent('crz_vanilla:AA1')
AddEventHandler('crz_vanilla:AA1', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("algemas")*1 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id, 200) then
		   vRP.giveInventoryItem(user_id,"algemas",1)
		   TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>1x Algemas</b>.")
		else
		   TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		end
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_vanilla:AA2')
AddEventHandler('crz_vanilla:AA2', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("capuz")*1 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id, 100) then
		   vRP.giveInventoryItem(user_id,"capuz",1)
		   TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>1x Capuz</b>.")
		else
		   TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		end
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_vanilla:AA3')
AddEventHandler('crz_vanilla:AA3', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pendrive")*1 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id, 500) then
		   vRP.giveInventoryItem(user_id,"pendrive",1)
		   TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>1x pendrive</b>.")
		else
		   TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		end
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_vanilla:AA4')
AddEventHandler('crz_vanilla:AA4', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("laptop")*1 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id, 5000) then
		   vRP.giveInventoryItem(user_id,"laptop",1)
		   TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>1x laptop</b>.")
		else
		   TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		end
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)
RegisterServerEvent('crz_vanilla:AA5')
AddEventHandler('crz_vanilla:AA5', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("c4")*1 <= vRP.getInventoryMaxWeight(user_id) then
	    if vRP.tryPayment(user_id, 10000) then
		   vRP.giveInventoryItem(user_id,"c4",1)
		   TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>1x c4</b>.")
		else
		   TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		end
		return true
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
	end
end)