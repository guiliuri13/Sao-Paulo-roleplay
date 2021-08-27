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

vRPclient = Tunnel.getInterface("vRP","don_emp_weapon")


RegisterServerEvent('Don_Speed:PermissaoWeapon')
AddEventHandler('Don_Speed:PermissaoWeapon', function(permissao)
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, permissao) then
	    TriggerClientEvent('Don_Speed:ContinuaWeapon', source)
	else
	    TriggerClientEvent("Notify",source,"aviso","Você não possui permissão .")
	end
end)
local t = false

RegisterServerEvent('Don_Speed:WeacomComprar')
AddEventHandler('Don_Speed:WeacomComprar', function(quant, valor, pecas)
	local source = source
	local user_id = vRP.getUserId(source)
	if t == false then 
	    local calcular = quant * valor
	    if vRP.tryGetInventoryItem(user_id,"dinheirosujo", calcular, true)then
		    t = true
	        local dsWe = vRP.request(source,"<b>Deseja comprar "..pecas.." x"..quant.." , por R$ "..calcular..",00 ?</b>",20)
	        if dsWe then
	            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(pecas)*quant <= vRP.getInventoryMaxWeight(user_id) then
			        t = false
	                vRP.giveInventoryItem(user_id, pecas, parseInt(quant))
				    TriggerClientEvent("Notify",source,"aviso","Compra efetuada com sucesso .")
				    TriggerClientEvent('Don_Speed:ContinuaWeapon', source)
	            else
			        TriggerClientEvent("Notify",source,"aviso","Você não possui espaço no inventario .")
				    --vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(calcular))
			        t = false
			    end
	        end
	    else
	        TriggerClientEvent("Notify",source,"aviso","Você não possui dinheiro sujo para comprar .")
	    end
	end
end)
RegisterServerEvent('Don_Speed:MontagemWeapon')
AddEventHandler('Don_Speed:MontagemWeapon', function(permissao)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, permissao) then
	
        if vRP.tryGetInventoryItem(user_id,"partspistol", 10, true)then
	        local dsMontagem = vRP.request(source,"<b>Deseja montar uma pistola com 10 peças (1 Arma)?",10)
	        if dsMontagem then
		        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_COMBATPISTOL")*1 <= vRP.getInventoryMaxWeight(user_id) then
			        vRP.giveInventoryItem(user_id, "wbody|WEAPON_COMBATPISTOL", parseInt(1))
				    TriggerClientEvent("Notify",source,"aviso","Transformado com sucesso .")
		        else
			        TriggerClientEvent("Notify",source,"aviso","Você não possui espaço no inventario .")
			    end
		    end
	    elseif vRP.tryGetInventoryItem(user_id,"wammopistol", 300, true)then
	        local dsMontagem = vRP.request(source,"<b>Deseja montar uma munição de pistola com 300 peças (150 muniçoes)?",10)
	        if dsMontagem then
		        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_COMBATPISTOL")*150 <= vRP.getInventoryMaxWeight(user_id) then
			        vRP.giveInventoryItem(user_id, "wammo|WEAPON_COMBATPISTOL", parseInt(150))
			    	TriggerClientEvent("Notify",source,"aviso","Transformado com sucesso .")
		        else
			        TriggerClientEvent("Notify",source,"aviso","Você não possui espaço no inventario .")
			    end
		    end
	    elseif vRP.tryGetInventoryItem(user_id,"partsminismg", 10, true)then
	        local dsMontagem = vRP.request(source,"<b>Deseja montar uma SMG com 10 peças (1 Arma)?",10)
	        if dsMontagem then
		        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_MICROSMG")*1 <= vRP.getInventoryMaxWeight(user_id) then
			        vRP.giveInventoryItem(user_id, "wbody|WEAPON_MICROSMG", parseInt(1))
			    	TriggerClientEvent("Notify",source,"aviso","Transformado com sucesso .")
		        else
			        TriggerClientEvent("Notify",source,"aviso","Você não possui espaço no inventario .")
			    end
		    end
	    elseif vRP.tryGetInventoryItem(user_id,"wammominismg", 300, true)then
	        local dsMontagem = vRP.request(source,"<b>Deseja montar uma munição de SMG com 300 peças (150 muniçoes)?",10)
	        if dsMontagem then
		        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_MICROSMG")*150 <= vRP.getInventoryMaxWeight(user_id) then
			        vRP.giveInventoryItem(user_id, "wammo|WEAPON_MICROSMG", parseInt(150))
			    	TriggerClientEvent("Notify",source,"aviso","Transformado com sucesso .")
		        else
			        TriggerClientEvent("Notify",source,"aviso","Você não possui espaço no inventario .")
			    end
		    end
	    elseif vRP.tryGetInventoryItem(user_id,"partsassault", 10, true)then
	        local dsMontagem = vRP.request(source,"<b>Deseja montar uma Assault com 10 peças (1 Arma)?",10)
	        if dsMontagem then
		        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_ASSAULTRIFLE")*1 <= vRP.getInventoryMaxWeight(user_id) then
		    	    vRP.giveInventoryItem(user_id, "wbody|WEAPON_ASSAULTRIFLE", parseInt(1))
		    		TriggerClientEvent("Notify",source,"aviso","Transformado com sucesso .")
		        else
		    	    TriggerClientEvent("Notify",source,"aviso","Você não possui espaço no inventario .")
		    	end
		    end
	    elseif vRP.tryGetInventoryItem(user_id,"wammoassault", 300, true)then
	        local dsMontagem = vRP.request(source,"<b>Deseja montar uma munição de Assault com 300 peças (150 muniçoes)?",10)
	        if dsMontagem then
		        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_ASSAULTRIFLE")*150 <= vRP.getInventoryMaxWeight(user_id) then
			        vRP.giveInventoryItem(user_id, "wammo|WEAPON_ASSAULTRIFLE", parseInt(150))
			    	TriggerClientEvent("Notify",source,"aviso","Transformado com sucesso .")
		        else
			        TriggerClientEvent("Notify",source,"aviso","Você não possui espaço no inventario .")
			    end
		    end
	    else
	        TriggerClientEvent("Notify",source,"aviso","Você não tem itens.")
	    end
	else
	    TriggerClientEvent("Notify",source,"aviso","Você não possui permissão .")
	end
end)
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