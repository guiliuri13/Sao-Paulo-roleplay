local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_mecanico",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"mecanico.permissao")
end

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,"ferramenta",1) then
			vRP.giveMoney(user_id,math.random(80,1500))
			TriggerClientEvent("Notify",source,"aviso","Você ganhou R$"..math.random(80,1500).."")
			return true
		else
			TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>1x Ferramenta</b>.")
		end
	end
end
RegisterServerEvent('vrp_mec:servicos')
AddEventHandler('vrp_mec:servicos',function()
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasGroup(user_id,"Lider") then
	    TriggerClientEvent("Notify",source,"sucesso","Você e lider não pode.")
	else
	
	    vRP.addUserGroup(user_id,"Mecanico")
	    TriggerClientEvent("Notify",source,"sucesso","Você pegou serviço.")
	end
end)