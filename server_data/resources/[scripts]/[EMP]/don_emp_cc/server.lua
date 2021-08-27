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

cc = {}
Tunnel.bindInterface("don_emp_cc",cc)


local lperg = false
local pergp = false
RegisterServerEvent('Don_Speed:CCPegar')
AddEventHandler('Don_Speed:CCPegar', function()
	local source = source
	local user_id = vRP.getUserId(source)
	
	if pergp == false then
	    pergp = true
	    local ppccd = vRP.request(source,"<b>Deseja pegar 10 Cartões Clonados ???</b>",5)
        if ppccd then
		    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cc")*10 <= vRP.getInventoryMaxWeight(user_id) then
		        pergp = false
				TriggerClientEvent("Notify", source,"aviso","Item adquirido com sucesso.")
				vRP.giveInventoryItem(user_id,"cc", 10,false)
			else
                TriggerClientEvent("Notify", source,"aviso","Sem espaço.")
				pergp = false
            end				
		else
		   pergp = false
		end
	end
end)	
RegisterServerEvent('Don_Speed:CCEntrega')
AddEventHandler('Don_Speed:CCEntrega', function(a2)
	local source = source
	local user_id = vRP.getUserId(source)
	
	if lperg == false then
	    lperg = true
	    local ccd = vRP.request(source,"<b>Deseja entregar 1 Cartões Clonados ??? R$ "..a2..",00</b>",20)
        if ccd then
	        if vRP.tryGetInventoryItem(user_id,"cc", 1, false) then
			
	    	    lperg = false
				
				vRP.giveInventoryItem(user_id, "dinheirosujo", parseInt(a2))
				
	    		TriggerClientEvent("Notify", source,"aviso","Venda efetuada .")
	    		TriggerClientEvent('Don_Speed:StartCC', source)
				
	    	else
	    	    TriggerClientEvent("Notify",source,"aviso","Sem quantidade de garrafas .")
	    		lperg = false
	    	end
    	else
	    	lperg = false
    	end
    end
end)

function cc.checkPermission()
local source = source
local user_id = vRP.getUserId(source)
return vRP.hasPermission(user_id,"cc.permissao")
end