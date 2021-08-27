local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = {}
Tunnel.bindInterface("carteiro_coletar",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("encomenda")*2 <= vRP.getInventoryMaxWeight(user_id) then
			vRP.giveInventoryItem(user_id,"encomenda",2)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>2x Encomendas</b>")
			return true
		else
		   TriggerClientEvent("Notify",source,"aviso","<b>Inventario Cheio</b>")
		end
	end
end