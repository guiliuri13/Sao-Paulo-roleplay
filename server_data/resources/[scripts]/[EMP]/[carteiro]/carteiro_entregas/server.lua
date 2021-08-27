local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emp = {}
Tunnel.bindInterface("carteiro_entregas",emp)
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('unix_carteiro:start')
AddEventHandler('unix_carteiro:start',function()
	local source = source
	TriggerClientEvent('unix_carteiro:iniciar',source)
end)

local quantidade = {}
function emp.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(2,3)
	end
	return quantidade[source]
end

function emp.EntregarItens()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local pagamento = math.random(100,500)
		if vRP.tryGetInventoryItem(user_id,"encomenda",quantidade[source]) then
		vRP.giveMoney(user_id,parseInt(pagamento*quantidade[source]))
		TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>R$"..pagamento*quantidade[source].."</b>.")
		TriggerClientEvent("vrp_sound:source",source,'dinheiro',0.3)
		quantidade[source] = nil
	  else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..quantidade[source].."x Encomendas</b>.")
	  end
   end
end