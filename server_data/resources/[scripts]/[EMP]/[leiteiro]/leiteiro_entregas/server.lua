-- By Don_Speed    -      Don_Speed#6282
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local lperg = false

RegisterServerEvent('Don_Speed:LeiteEntrega')
AddEventHandler('Don_Speed:LeiteEntrega', function(a1,a2)
	local source = source
	local user_id = vRP.getUserId(source)
	
	local valorpagar = a1*a2
	if lperg == false then
	    lperg = true
	    local LeiteP = vRP.request(source,"<b>Deseja entregar "..a1.."x Garrafas de Leite ??? R$ "..valorpagar..",00</b>",20)
        if LeiteP then
	        if vRP.tryGetInventoryItem(user_id,"garrafadeleite", a1, false) then
	    	    lperg = false
	    		vRP.giveMoney(user_id, valorpagar)
	    		TriggerClientEvent("Notify",source,"aviso","Venda efetuada .")
	    		TriggerClientEvent('Don_Speed:StartLeite', source)
	    	else
	    	    TriggerClientEvent("Notify",source,"aviso","Sem quantidade de garrafas .")
	    		lperg = false
	    	end
    	else
	    	lperg = false
    	end
    end
end)