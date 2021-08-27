local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","emp_lavagem")


RegisterServerEvent('Don_Speed:Permissao')
AddEventHandler('Don_Speed:Permissao', function(permissao)
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, permissao) then
	    local qtdsujo = vRP.getInventoryItemAmount(user_id,"dinheirosujo")
		if qtdsujo ~= 0 then 
		    local teste = qtdsujo*95/100
		    local Aben = vRP.request(source,"Deseja lavar o dinheiro? LUCRO DE R$ "..teste.."",10)
			if Aben then
	            TriggerClientEvent('Don_Speed:Animacao', source)
			   -- if vRP.tryGetInventoryItem(user_id,"dinheirosujo",qtdsujo,true) and qtdsujo ~= 0 then
                  
	            --    TriggerClientEvent("Notify",source,"sucesso","Limpando dinheiro")
				--	Citizen.Wait(5000)
				--	TriggerClientEvent("Notify",source,"sucesso","Recebido R$ "..teste.."")
				--	vRP.giveMoney(user_id, teste)
               -- end
			end
		else
            TriggerClientEvent("Notify",source,"sucesso","Não tem dinheiro sujo .")
	    end
    else
        TriggerClientEvent("Notify",source,"sucesso","Não tem permissao .")
	end
end)

RegisterServerEvent('Don_Speed:Pagamento')
AddEventHandler('Don_Speed:Pagamento', function()
    local user_id = vRP.getUserId(source)
    local player = vRP.getUserSource(user_id)
	
    local qtdsujo = vRP.getInventoryItemAmount(user_id,"dinheirosujo")
    if vRP.tryGetInventoryItem(user_id,"dinheirosujo",qtdsujo,true) and qtdsujo ~= 0 then
        vRP.giveMoney(user_id,qtdsujo*95/100)
	    local teste = qtdsujo*95/100
	     TriggerClientEvent("Notify",source,"sucesso","Recebido R$ "..teste.."")
    end
end)