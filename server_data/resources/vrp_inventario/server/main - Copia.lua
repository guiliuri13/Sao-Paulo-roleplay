local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_inventario")
Dclient = Tunnel.getInterface("vrp_inventario")


RegisterServerEvent("vrp_inventario:openGui")
AddEventHandler("vrp_inventario:openGui",function()
        local user_id = vRP.getUserId(source)
        local player = vRP.getUserSource(user_id)
        local data = vRP.getUserDataTable(user_id)
        if data and data.inventory then
            local inventory = {}
            for data_k, data_v in pairs(data.inventory) do
                for items_k, items_v in pairs(items) do
                    if data_k == items_k then
                        local item_name = vRP.getItemName(data_k)
                        local itemWeight = vRP.getItemWeight(data_k)*data_v.amount
                            if item_name then
                            table.insert(inventory,
                                {
                                    name = item_name,
                                    amount = data_v.amount,
                                    item_peso = itemWeight,
                                    idname = data_k,
                                    icon = items_v[5]
                                }
                            )
                        end
                    end
                end
            end
            local weight = vRP.getInventoryWeight(user_id)
            local maxWeight = vRP.getInventoryMaxWeight(user_id)
            TriggerClientEvent("vrp_inventario:updateInventory", source, inventory, weight, maxWeight)
        end
end)

RegisterServerEvent("vrp_inventario:useItem")
AddEventHandler("vrp_inventario:useItem",function(args)
        local data = args
        local user_id = vRP.getUserId(source)
        local player = vRP.getUserSource(user_id)

        if data.idname then
            for k, v in pairs(items) do
                if data.idname == k then
                    useItem(user_id, player, k, v[1], v[2], v[3], v[4], data.amount)
                end
            end
        end
end)

RegisterServerEvent("vrp_inventario:dropItem")
AddEventHandler("vrp_inventario:dropItem",function(data)
        local user_id = vRP.getUserId(source)
        local player = vRP.getUserSource(user_id)
        local amount = parseInt(data.amount)
        local peso = true
        local idname = data.idname
        local px,py,pz = vRPclient.getPosition(source)
        if vRPclient.isInComa(player) then
            vRPclient.notify(player,"Você está em coma.")
        else 
            if idname == "mochila" then		
                peso = vRP.setMochila(user_id,0)
            end
            if peso then
                if idname == "vale" then		
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Não pode ser dropado .")
                	
                elseif vRP.tryGetInventoryItem(user_id, data.idname, amount, false) then
                    TriggerClientEvent("vrp_inventario:closeGui", player)
                    TriggerEvent("DropSystem:create", idname, amount, px,py,pz) 
                    vRPclient.playAnim(player, true, {{"pickup_object", "pickup_low", 1}}, false)
                    TriggerClientEvent('xpk_inventory:test',source,'test')
                    
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Ocorreu um problema.")
                end
            else
                TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Esvazie a mochila primeiro.")
            end	
        end    		
end)


function split(str, sep)
    local array = {}
    local reg = string.format("([^%s]+)", sep)
    for mem in string.gmatch(str, reg) do
        table.insert(array, mem)
    end
    return array
end

local bandagem = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(bandagem) do
			if v > 0 then
				bandagem[k] = v - 1
			end
		end
	end
end)
function useItem(user_id, player, idname, type, varyhealth, varyThirst, varyHunger, amount)
    if vRPclient.isInComa(player) then
        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Você está em coma.")
        
    else
        if type == "weapon" or type == "ammo" or type == "mochila" or type == "crack" or type == "lsd"or type == "maconha" or type == "energetico" or type == "cerveja" or type == "absinto" or type == "tequila" or type == "vodka" or type == "conhaque" or type == "whisky" or type == "bandagem" or type == "cocaina"or type == "metanfetamina" or type == "lockpick" or type == "capuz" or type == "masterpick" then
                      
           
             if type == "weapon" then
            if vRP.tryGetInventoryItem(user_id, idname, tonumber(amount), false) then
                local fullidname = split(idname, "|")
                vRPclient.giveWeapons(
                    player,
                        {
                            [fullidname[2]] = {ammo = 0}
                        },
                        false
                )
            end
        end
        if type == "ammo" then
            local fullidname = split(idname, "|")
            local exists = false
            local weapons = vRPclient.getWeapons(player)
                    for k, v in pairs(weapons) do
                        if k == fullidname[2] then
                            exists = true
                        end
                    end
                    if exists == true then
                        if vRP.tryGetInventoryItem(user_id, idname, tonumber(amount), false) then
                            vRPclient.giveWeapons(
                                player,
                                    {
                                        [fullidname[2]] = {ammo = tonumber(amount)}
                                    },
                                    false
                            )
                        end
                    else
						TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Você não tem a arma para essa munição.")                       
                    end
                
            end
            if type == "mochila" then
                local src = source
					if vRP.tryGetInventoryItem(user_id,"mochila",1) then
						vRP.varyExp(user_id,"physical","strength",650)
						TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Mochila utilizada com sucesso.")
					else
						TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Mochila não encontrada na mochila.")
                    end 
            end                  
            if type == "maconha" or type == "lsd" or type == "crack" then
                if vRP.tryGetInventoryItem(user_id,"maconha",1,false) or vRP.tryGetInventoryItem(user_id,"lsd",1,false) or vRP.tryGetInventoryItem(user_id,"crack",1,false) then
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Fumando.")
                    play_f1(player)

                    SetTimeout(10000,function()
                    vRPclient._stopAnim(player,true)
                    vRPclient._stopAnim(player,false) 
                    Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                    Dclient.playScreenEffect(player, "DMT_flight", 120)                   
                    end)
                    SetTimeout(120000,function()
                    Dclient.resetMovement(player,false)                  
                    end)
                end
            end
            if type == "bandagem" then
                local source = source
                local user_id = vRP.getUserId(source)
                vida = vRPclient.getHealth(source)
                if vida > 100 and vida < 400 then
                    if bandagem[user_id] == 0 or not bandagem[user_id] then
                        if vRP.tryGetInventoryItem(user_id,"bandagem",1) then
                            bandagem[user_id] = 900
                            vRP.varyExp(user_id,"physical","strength",650)
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._CarregarObjeto(source,"amb@world_human_clipboard@male@idle_a","idle_c","v_ret_ta_firstaid",49,60309)
                            TriggerClientEvent('bandagem',source)
                            TriggerClientEvent("progress",source,60000,"curando")
                            SetTimeout(60000,function()
                              TriggerClientEvent('cancelando',source,false)
                              vRPclient._DeletarObjeto(source)
                              TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Bandagem utilizada com sucesso.")
                            end)
                        end
                    end
                end
            end
            if type == "capuz" then
                if vRP.getInventoryItemAmount(user_id,"capuz") >= 1 then
                    local user_id = vRP.getUserId(source)
                    local nplayer = vRPclient.getNearestPlayer(source,2)
                    if nplayer then
                        vRPclient.setCapuz(nplayer)
                        vRP.closeMenu(nplayer)
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Capuz utilizado com sucesso.")
                    else
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Vitima não encotrada.")
                    end
                end
            end
            if type == "cocaina" then
                if vRP.tryGetInventoryItem(user_id,"cocaina",1,false) then
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Cheirando Cocaina.")
                    play_f2(player)
                    SetTimeout(10000,function()
                      Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                      Dclient.playScreenEffect(player, "DrugsTrevorClownsFight", 120)                
                    end)
                    SetTimeout(120000,function()
                    Dclient.resetMovement(player,false)
                    end)
                end
            end
            if type == "metanfetamina" then
                if vRP.tryGetInventoryItem(user_id,"metanfetamina",1,false) then
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Injetando Metanfetamina.")
                    play_drink(player)
                    SetTimeout(10000,function()
                      Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                      Dclient.playScreenEffect(player, "DMT_flight", 120)                    
                    end)
                    SetTimeout(120000,function()
                    Dclient.resetMovement(player,{false})
                    end)
                end
            end                     
            if type == "lockpick" then 
                local src = source
			    local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(src,7)
		        local mPlacaUser = vRP.getUserByRegistration(mPlaca)
                if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1 and mName then
                 vRP.tryGetInventoryItem(user_id,"lockpick",1,false)
			    if vRP.hasPermission(user_id,"policia.permissao") then
				TriggerClientEvent("syncLock",-1,mNet)
				return
			    end

		      	TriggerClientEvent('cancelando',src,true)
		    	vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
			    TriggerClientEvent("progress",src,30000,"roubando")
		    	SetTimeout(30000,function()
				TriggerClientEvent('cancelando',src,false)
				vRPclient._stopAnim(src,false)

                        if not mPlacaUser then
                            TriggerClientEvent("syncLock",-1,mNet)
                            TriggerClientEvent("vrp_sound:source",src,'lock',0.1)
                        else
                            if math.random(100) >= 80 then
                                TriggerClientEvent("syncLock",-1,mNet)
                                TriggerClientEvent("vrp_sound:source",src,'lock',0.1)
                            else
                                TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Roubo do veículo falhou e as autoridades foram acionadas.")
                                local policia = vRP.getUsersByPermission("policia.permissao")
                                local x,y,z = vRPclient.getPosition(src)
                                for k,v in pairs(policia) do
                                    local player = vRP.getUserSource(parseInt(v))
                                    if player then
                                        async(function()
                                            local id = idgens:gen()
                                            TriggerClientEvent('chatMessage',player,"911",{65,130,255},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
                                            pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
                                            SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
                                        end)
                                    end
                                end
                            end
                        end
                    end)
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Precisa de uma ^1Lockpick^0 para iniciar o roubo do veículo.")
                end
            end
            if type == "masterpick" then 
                local src = source
                local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(src,7)
                local mPlacaUser = vRP.getUserByRegistration(mPlaca)
                if vRP.getInventoryItemAmount(user_id,"masterpick") >= 1 and mName then                    
                    if vRP.hasPermission(user_id,"policia.permissao") then
                        TriggerClientEvent("syncLock",-1,mNet)
                        return
                    end

                    TriggerClientEvent('cancelando',src,true)
                    vRPclient._playAnim(src,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
                    TriggerClientEvent("progress",src,60000,"roubando")

                    SetTimeout(60000,function()
                        TriggerClientEvent("vrp_sound:source",src,'lock',0.1)
                        TriggerClientEvent('cancelando',src,false)
                        TriggerClientEvent("syncLock",-1,mNet)
                        vRPclient._stopAnim(src,false)

                        local policia = vRP.getUsersByPermission("policia.permissao")
                        local x,y,z = vRPclient.getPosition(src)
                        for k,v in pairs(policia) do
                            local player = vRP.getUserSource(parseInt(v))
                            if player then
                                async(function()
                                    local id = idgens:gen()
                                    TriggerClientEvent('chatMessage',player,"911",{65,130,255},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
                                    pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
                                    SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
                                end)
                            end
                        end
                    end)
				else
			        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Precisa de uma ^1Masterpick^0 para iniciar o roubo do veículo.")
                end
            end
            if type == "energetico" then 
                local src = source
					if vRP.tryGetInventoryItem(user_id,"energetico",1) then
						TriggerClientEvent('cancelando',src,true)
			            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
			            TriggerClientEvent("progress",src,10000,"bebendo")
			            SetTimeout(10000,function()
				        TriggerClientEvent('energeticos',src,true)
				        TriggerClientEvent('cancelando',src,false)
				        vRPclient._DeletarObjeto(src)
				        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Energético utilizado com sucesso.")
					end)
					SetTimeout(60000,function()
			       	TriggerClientEvent('energeticos',src,false)
				    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"O efeito do energético passou e o coração voltou a bater normalmente.")
			        end)
					else
						TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Energético não encontrada na mochila.")
					end
            end           
            if type == "whisky" then 
                if vRP.tryGetInventoryItem(user_id,"whisky",1) then
                    TriggerClientEvent('cancelando',source,true)
                    vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                    TriggerClientEvent("progress",source,10000,"bebendo")
                    SetTimeout(10000,function()
                        Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                        Dclient.playScreenEffect(player, "DrugsTrevorClownsFight", 120) 
                        TriggerClientEvent('cancelando',source,false)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"whisky utilizada com sucesso.")
                    end)
                    SetTimeout(120000,function()
                        Dclient.resetMovement(player,false)
                    end)
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Vodka não encontrada na mochila.")
                end
            end
             if type == "abisinto" then 
                if vRP.tryGetInventoryItem(user_id,"abisinto",1) then
                    TriggerClientEvent('cancelando',source,true)
                    vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                    TriggerClientEvent("progress",source,10000,"bebendo")
                    SetTimeout(10000,function()
                        Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                        Dclient.playScreenEffect(player, "DrugsTrevorClownsFight", 120) 
                        TriggerClientEvent('cancelando',source,false)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Abisinto utilizada com sucesso.")
                    end)
                    SetTimeout(120000,function()
                        Dclient.resetMovement(player,false)
                    end)
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Vodka não encontrada na mochila.")
                end
            end
             if type == "tequila" then 
                if vRP.tryGetInventoryItem(user_id,"tequila",1) then
                    TriggerClientEvent('cancelando',source,true)
                    vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                    TriggerClientEvent("progress",source,10000,"bebendo")
                    SetTimeout(10000,function()
                        Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                        Dclient.playScreenEffect(player, "DrugsTrevorClownsFight", 120) 
                        TriggerClientEvent('cancelando',source,false)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Tequila utilizada com sucesso.")
                    end)
                    SetTimeout(120000,function()
                        Dclient.resetMovement(player,false)
                    end)
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Vodka não encontrada na mochila.")
                end
            end
             if type == "conhaque" then 
                if vRP.tryGetInventoryItem(user_id,"conhaque",1) then
                    TriggerClientEvent('cancelando',source,true)
                    vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
                    TriggerClientEvent("progress",source,10000,"bebendo")
                    SetTimeout(10000,function()
                        Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                        Dclient.playScreenEffect(player, "DrugsTrevorClownsFight", 120) 
                        TriggerClientEvent('cancelando',source,false)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Conhaque utilizada com sucesso.")
                    end)
                    SetTimeout(120000,function()
                        Dclient.resetMovement(player,false)
                    end)
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Vodka não encontrada na mochila.")
                end
            end
            if type == "cerverja" then 
                if vRP.tryGetInventoryItem(user_id,"cerverja",1) then
                    TriggerClientEvent('cancelando',source,true)
                    vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                    TriggerClientEvent("progress",source,10000,"bebendo")
                    SetTimeout(10000,function()
                        Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                        Dclient.playScreenEffect(player, "DrugsTrevorClownsFight", 120) 
                        TriggerClientEvent('cancelando',source,false)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Cervrja utilizada com sucesso.")
                    end)
                    SetTimeout(120000,function()
                        Dclient.resetMovement(player,false)
                    end)
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Vodka não encontrada na mochila.")
                end
            end
            if type == "vodka" then 
                if vRP.tryGetInventoryItem(user_id,"vodka",1) then
                    TriggerClientEvent('cancelando',source,true)
                    vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                    TriggerClientEvent("progress",source,10000,"bebendo")
                    SetTimeout(10000,function()
                        Dclient.playMovement(player,"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false)
                        Dclient.playScreenEffect(player, "DrugsTrevorClownsFight", 90) 
                        TriggerClientEvent('cancelando',source,false)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Bebenco utilizada com sucesso.")
                    end)
                    SetTimeout(120000,function()
                        Dclient.resetMovement(player,false)
                    end)
                else
                    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Vodka não encontrada na mochila.")
                end
             end
        end
        if type == "colete" then  
		    if vRP.tryGetInventoryItem(user_id,"colete1",1) then
		        local colete = 100
                vRPclient.setArmour(player,100)
		        vRP.setUData(player,"vRP:colete", json.encode(colete))	
                TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Colete equipado.")  
			end
		end
		if type == "coleteme" then  
		    if vRP.tryGetInventoryItem(user_id,"colete2",1) then
		        local colete = 50
                vRPclient.setArmour(player,50)
		        vRP.setUData(player,"vRP:colete", json.encode(colete))	
                TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Colete equipado.")  
			end
		end
		if type == "coleteus" then  
            if vRP.tryGetInventoryItem(user_id,"colete3",1) then		
		        local colete = 20
                vRPclient.setArmour(player,20)
		        vRP.setUData(player,"vRP:colete", json.encode(colete))	
                TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Colete equipado.")  
            end 
		end
        if type == "none" then
            TriggerClientEvent("Notify", "negado","Este item não pode ser usado.")            
        end
    end    
end


RegisterServerEvent("vrp_inventario:giveItem")
AddEventHandler("vrp_inventario:giveItem",function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local nplayer = vRPclient.getNearestPlayer(source,2)
        if nplayer then
            local nuser_id = vRP.getUserId(nplayer)
            if nuser_id then
                local amount = parseInt(data.amount)
                if amount > 0 then
				    if data.idname == "vale" then
					    TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Não pode ser enviado .")
                    end 
                    if vRP.getInventoryWeight(nuser_id)+vRP.getItemWeight(data.idname)*amount <= vRP.getInventoryMaxWeight(nuser_id) then
                        if vRP.tryGetInventoryItem(user_id,data.idname,amount,true) then
                            vRP.giveInventoryItem(nuser_id,data.idname,amount,true)
                            vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
                            TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Enviou ^1"..data.idname.." x"..amount.."^0.")
                            TriggerClientEvent("chatMessage",source,"ALERTA",{255,70,50},"Recebeu ^1"..data.idname.." x"..amount.."^0.")
                        end
                    else
                        TriggerClientEvent("chatMessage",player,"ALERTA",{255,70,50},"Inventário cheio.")
                        TriggerClientEvent("chatMessage",source,"ALERTA",{255,70,50},"Inventário cheio.")
                    end
                end
            end
        end
    end   
end)


function play_f1(player)
    vRPclient._playAnim(player, true, {task="WORLD_HUMAN_SMOKING_POT"}, false)
end
function play_f2(player)
vRPclient._playAnim(player,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},false)
end 


