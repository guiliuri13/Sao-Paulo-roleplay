local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent('Verificar')
AddEventHandler('Verificar', function()
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasGroup(user_id,"Ouro") or vRP.hasGroup(user_id,"Prata") or vRP.hasGroup(user_id,"Bronze") or vRP.hasGroup(user_id,"Diamante") or vRP.hasGroup(user_id,"Ruby") or vRP.hasGroup(user_id,"Supremo")then
	    if vRP.tryGetInventoryItem(user_id,"minutos", 1, true) then 
	       --
	    else
	        if vRP.tryGetInventoryItem(user_id,"horas", 1, true) then 
		        vRP.giveInventoryItem(user_id,"minutos", 60)
		    else
		        if vRP.tryGetInventoryItem(user_id,"dias", 1, true) then 
	                vRP.giveInventoryItem(user_id,"horas", 24)
					vRP.giveInventoryItem(user_id,"minutos", 60)
			    else
			        vRP.removeUserGroup(user_id,"Ouro")
				    vRP.removeUserGroup(user_id,"Prata")
					vRP.removeUserGroup(user_id,"Bronze")
					vRP.removeUserGroup(user_id,"Diamante") -- ADD Douglas
					vRP.removeUserGroup(user_id,"Ruby") -- ADD Douglas
					vRP.removeUserGroup(user_id,"Supremo") -- ADD Douglas
			       -- TriggerClientEvent("Notify",source,"sucesso","Acabou seu vip")
				end
			end
		end
	end
end)