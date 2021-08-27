local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = {}
Tunnel.bindInterface("vrp_trafico",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end

local src = {
	[1] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "adubo", ['itemqtd'] = 2 },
	[2] = { ['re'] = "adubo", ['reqtd'] = 2, ['item'] = "fertilizante", ['itemqtd'] = 2 },
	[3] = { ['re'] = "fertilizante", ['reqtd'] = 2, ['item'] = "maconha", ['itemqtd'] = 1 },

	[10] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "folhacocamoida", ['itemqtd'] = 2 },
	[11] = { ['re'] = "folhacocamoida", ['reqtd'] = 2, ['item'] = "cocaina", ['itemqtd'] = 1 },


	[14] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "anfetamina", ['itemqtd'] = 2 },
	[15] = { ['re'] = "anfetamina", ['reqtd'] = 2, ['item'] = "metanfetamina", ['itemqtd'] = 1 },
	
	
	[17] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "bicarbonato", ['itemqtd'] = 2 },
	[18] = { ['re'] = "bicarbonato", ['reqtd'] = 2, ['item'] = "cloridrato", ['itemqtd'] = 2 },
	[19] = { ['re'] = "cloridrato", ['reqtd'] = 2, ['item'] = "crack", ['itemqtd'] = 1 },

	[20] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "acido", ['itemqtd'] = 2 },
	[21] = { ['re'] = "acido", ['reqtd'] = 2, ['item'] = "lsd", ['itemqtd'] = 1 },
	
	[30] = { ['re'] = "dinheirosujo", ['reqtd'] = 5000, ['item'] = "tecidobalistico", ['itemqtd'] = 3 },
	[31] = { ['re'] = "tecidobalistico", ['reqtd'] = 3, ['item'] = "colete1", ['itemqtd'] = 1 },
	
	[34] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "recipientemacarico", ['itemqtd'] = 1 },
	[35] = { ['re'] = "recipientemacarico", ['reqtd'] = 1, ['item'] = "macarico", ['itemqtd'] = 1 },
}

function func.checkPayment(id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if src[id].re ~= nil then
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryGetInventoryItem(user_id,src[id].re,src[id].reqtd,false) then
					vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
					return true
				else
				    TriggerClientEvent("Notify",source,"sucesso","Falta algum item.")
				end
			else
			    TriggerClientEvent("Notify",source,"sucesso","Sem espaço no inventario.")
			end
		else
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
				vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
				return true
			else
			    TriggerClientEvent("Notify",source,"sucesso","Sem espaço no inventario.")
			end
		end
	end
end