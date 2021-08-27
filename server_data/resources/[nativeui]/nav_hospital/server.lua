--[[  vrp/cfg/itens

    ["desfibrilador"] = { "desfibrilador", 0.5 },
	["morfina"] = { "morfina", 0.2 },
	["pills"] = { "remedio", 0.1 },
	["bandagem"] = { "Bandagem",0.3 },
	
	
	BY DON_SPEED
]]



local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


RegisterServerEvent('nav_hospital:permissao')
AddEventHandler('nav_hospital:permissao', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasGroup(user_id,"Paramedico") then
		TriggerClientEvent('nav_hospital:permissao', src)
	end
end)
RegisterServerEvent('nav_hospital:dev')
AddEventHandler('nav_hospital:dev', function()

    local source = source
	local user_id = vRP.getUserId(source)
	
	local ItemA = vRP.getInventoryItemAmount(user_id,"morfina")
	local ItemB = vRP.getInventoryItemAmount(user_id,"desfibrilador")
	local ItemC = vRP.getInventoryItemAmount(user_id,"bandagem")
	local ItemD = vRP.getInventoryItemAmount(user_id,"pills")
	
	local data = vRP.getSData("chest:"..tostring("static:3"))
    local items = json.decode(data) or {}
	
	if vRP.tryGetInventoryItem(user_id,"morfina",ItemA,true)and ItemA ~= 0 then
	    if items["morfina"] == nil then
	        items["morfina"] = { amount = parseInt(ItemA) } 
        else
	        items["morfina"].amount = items["morfina"].amount + ItemA
        end
	end
	if vRP.tryGetInventoryItem(user_id,"desfibrilador",ItemB,true) and ItemB ~= 0 then
	    if items["desfibrilador"] == nil then
	        items["desfibrilador"] = { amount = parseInt(ItemB) } 
        else
	        items["desfibrilador"].amount = items["desfibrilador"].amount + ItemB
        end
	end
	if vRP.tryGetInventoryItem(user_id,"bandagem",ItemC,true)and ItemC ~= 0 then
	    if items["bandagem"] == nil then
	        items["bandagem"] = { amount = parseInt(ItemC) } 
        else
	        items["bandagem"].amount = items["bandagem"].amount + ItemC
        end
	end
	if vRP.tryGetInventoryItem(user_id,"pills",ItemD,true) and ItemD ~= 0 then
	    if items["pills"] == nil then
	        items["pills"] = { amount = parseInt(ItemD) } 
        else
	        items["pills"].amount = items["pills"].amount + ItemD
        end
	end
	vRP.setSData("chest:"..tostring("static:3"),json.encode(items))
	TriggerClientEvent("Notify",source,"sucesso","Itens Guardados com sucesso .")
end)
RegisterServerEvent('nav_hospital:morfina')
AddEventHandler('nav_hospital:morfina', function()

    local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getSData("chest:"..tostring("static:3"))
    local items = json.decode(data) or {}
	TriggerClientEvent('nav_hospital:permissao', source)
    local quantidade = vRP.prompt(source, "Quanto de morfina deseja ? ? EX 1 a 5","")
	local quantidade = parseInt(quantidade)
	if quantidade > 0 and quantidade < 6 then
			
	    if items["morfina"] and parseInt(items["morfina"].amount) >= quantidade then 
            local items = json.decode(data) or {}
	        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("morfina")*quantidade <= vRP.getInventoryMaxWeight(user_id) then
		        vRP.giveInventoryItem(user_id,"morfina",quantidade)
		        TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>"..quantidade.."x Injeção de Morfina</b>")
			
			    items["morfina"].amount = items["morfina"].amount - quantidade
			
			    if items["morfina"].amount < 1 then
			        items["morfina"].amount = nil
			        items["morfina"] = nil
			    end
			    vRP.setSData("chest:"..tostring("static:3"),json.encode(items))
		        return true
	        else
		        TriggerClientEvent("Notify",source,"aviso","<b>Inventario não tem capacidade .</b>")
	        end
	    else
		    TriggerClientEvent("Notify",source,"aviso","<b>Sem item no bau . </b>")
	    end
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Valor invalido .</b>")
	end
end)
RegisterServerEvent('nav_hospital:des')
AddEventHandler('nav_hospital:des', function()
    local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getSData("chest:"..tostring("static:3"))
    local items = json.decode(data) or {}
	TriggerClientEvent('nav_hospital:permissao', source)
    local quantidade = vRP.prompt(source, "Quanto de desfibrilador deseja ? ? EX 1 a 5","")
	local quantidade = parseInt(quantidade)
	if quantidade > 0 and quantidade < 6 then
			
	    if items["desfibrilador"] and parseInt(items["desfibrilador"].amount) >= quantidade then 
            local items = json.decode(data) or {}
	        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("desfibrilador")*quantidade <= vRP.getInventoryMaxWeight(user_id) then
		        vRP.giveInventoryItem(user_id,"desfibrilador",quantidade)
		        TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>"..quantidade.."x Injeção de Desfibrilador</b>")
			
			    items["desfibrilador"].amount = items["desfibrilador"].amount - quantidade
			
			    if items["desfibrilador"].amount < 1 then
			        items["desfibrilador"].amount = nil
			        items["desfibrilador"] = nil
			    end
			    vRP.setSData("chest:"..tostring("static:3"),json.encode(items))
		        return true
	        else
		        TriggerClientEvent("Notify",source,"aviso","<b>Inventario não tem capacidade .</b>")
	        end
	    else
		    TriggerClientEvent("Notify",source,"aviso","<b>Sem item no bau . </b>")
	    end
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Valor invalido .</b>")
	end
end)
RegisterServerEvent('nav_hospital:band')
AddEventHandler('nav_hospital:band', function()

    local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getSData("chest:"..tostring("static:3"))
    local items = json.decode(data) or {}
	TriggerClientEvent('nav_hospital:permissao', source)
    local quantidade = vRP.prompt(source, "Quanto de bandagem deseja ? ? EX 1 a 5","")
	local quantidade = parseInt(quantidade)
	if quantidade > 0 and quantidade < 6 then
			
	    if items["bandagem"] and parseInt(items["bandagem"].amount) >= quantidade then 
            local items = json.decode(data) or {}
	        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("bandagem")*quantidade <= vRP.getInventoryMaxWeight(user_id) then
		        vRP.giveInventoryItem(user_id,"bandagem",quantidade)
		        TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>"..quantidade.."x Injeção de Bandagem</b>")
			
			    items["bandagem"].amount = items["bandagem"].amount - quantidade
			
			    if items["bandagem"].amount < 1 then
			        items["bandagem"].amount = nil
			        items["bandagem"] = nil
			    end
			    vRP.setSData("chest:"..tostring("static:3"),json.encode(items))
		        return true
	        else
		        TriggerClientEvent("Notify",source,"aviso","<b>Inventario não tem capacidade .</b>")
	        end
	    else
		    TriggerClientEvent("Notify",source,"aviso","<b>Sem item no bau . </b>")
	    end
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Valor invalido .</b>")
	end
end)
RegisterServerEvent('nav_hospital:rem')
AddEventHandler('nav_hospital:rem', function()

    local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getSData("chest:"..tostring("static:3"))
    local items = json.decode(data) or {}
	TriggerClientEvent('nav_hospital:permissao', source)
    local quantidade = vRP.prompt(source, "Quanto de remedio deseja ? ? EX 1 a 5","")
	local quantidade = parseInt(quantidade)
	if quantidade > 0 and quantidade < 6 then
			
	    if items["pills"] and parseInt(items["pills"].amount) >= quantidade then 
            local items = json.decode(data) or {}
	        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pills")*quantidade <= vRP.getInventoryMaxWeight(user_id) then
		        vRP.giveInventoryItem(user_id,"pills",quantidade)
		        TriggerClientEvent("Notify",source,"sucesso","Voce recebeu <b>"..quantidade.."x Injeção de Remedio</b>")
			
			    items["pills"].amount = items["pills"].amount - quantidade
			
			    if items["pills"].amount < 1 then
			        items["pills"].amount = nil
			        items["pills"] = nil
			    end
			    vRP.setSData("chest:"..tostring("static:3"),json.encode(items))
		        return true
	        else
		        TriggerClientEvent("Notify",source,"aviso","<b>Inventario não tem capacidade .</b>")
	        end
	    else
		    TriggerClientEvent("Notify",source,"aviso","<b>Sem item no bau . </b>")
	    end
	else
		TriggerClientEvent("Notify",source,"aviso","<b>Valor invalido .</b>")
	end
end)

--=====================================================================================================================================

RegisterServerEvent("reanimar:jogador")
AddEventHandler("reanimar:jogador",function()
    local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"paramedico.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isInComa(nplayer) and vRP.tryGetInventoryItem(user_id,"desfibrilador",1) then
			
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
			    TriggerClientEvent("progress",source,30000,"reanimando")
				TriggerClientEvent('eventomsg',user_id,true)
				SetTimeout(30000,function()
					vRPclient.killGod(nplayer)
				    vRPclient.setHealth(nplayer,110)
					vRPclient._stopAnim(source,false)
			        vRPclient._stopAnim(nplayer,false)
					
					vRP.giveMoney(user_id,300)
					
					TriggerClientEvent('cancelando',source,false)
			        TriggerClientEvent('setart',source)
				end)
			else
   			    if vRPclient.getHealth(nplayer) <= 150 and vRP.tryGetInventoryItem(user_id,"morfina",1)  then
			        local sssdok = vRP.request(nplayer,"<b>Deseja aceitar uma injeção de morfina?</b> ",10)
		            if sssdok then
			            TriggerClientEvent('tratamentomorfina',nplayer)
			            TriggerClientEvent("Notify",nplayer,"sucesso","Tratamento iniciado, aguarde a liberação do paramédico.")
			            TriggerClientEvent("Notify",source,"sucesso","Tratamento no paciente iniciado com sucesso.")
				    end
				end
			    if vRPclient.getHealth(nplayer) >= 151 and vRP.tryGetInventoryItem(user_id,"pills",1) then
			        local sssdok = vRP.request(nplayer,"<b>Deseja aceitar um remedio ?</b> ",10)
		            if sssdok then
			            TriggerClientEvent('tratamentoremedio',nplayer)
			            TriggerClientEvent("Notify",nplayer,"sucesso","Tratamento iniciado, aguarde a liberação do paramédico.")
			            TriggerClientEvent("Notify",source,"sucesso","Tratamento no paciente iniciado com sucesso.")
				    end
				end
			end
		end
	end
end)