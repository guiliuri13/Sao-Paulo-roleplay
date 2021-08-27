local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('emp_ubereats:permissao')
AddEventHandler('emp_ubereats:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	TriggerClientEvent('emp_ubereats:permissao',player)
end)

RegisterServerEvent('emp_ubereats:receber')
AddEventHandler('emp_ubereats:receber', function(pagamento)
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then
		vRP.giveMoney(user_id,parseInt(pagamento))
		TriggerClientEvent("vrp_sound:source",source,'dinheiro',0.3)
		TriggerClientEvent("Notify",source,"sucesso","Dinheiro recebido R$"..parseInt(pagamento).."")
	end
end)