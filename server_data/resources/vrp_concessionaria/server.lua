local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")

vRPclient = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")

func = {}
Tunnel.bindInterface("vrp_concessionaria", func)

vRP._prepare("vRP/add_vehicle",
             "INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")
vRP._prepare("vRP/remove_vehicle",
             "DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/remove_vrp_srv_data",
             "DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP._prepare("vRP/get_vehicles",
             "SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/get_vehicle",
             "SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/count_vehicle",
             "SELECT COUNT(*) as qtd FROM vrp_user_vehicles WHERE vehicle = @vehicle")
vRP._prepare("vRP/get_maxcars",
             "SELECT COUNT(vehicle) as quantidade FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/get_total_carros_tipo",
             "SELECT vehicle, count(1) total FROM vrp_user_vehicles GROUP BY vehicle")

-- function func.init() 
--     vRPclient._addMarker(source,23,-31.81,-1113.83,25.45,2,2,0.5,0,95,140,80,100)
-- end
local webcompra = ""
function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end


function func.getTotalVeiculorTipo()
    return vRP.query("vRP/get_total_carros_tipo")
end

function func.abertoTodos() 
    local totalConcessionaria = vRP.getUsersByPermission("concessionaria.permissao")
    if #totalConcessionaria == 0 then
        return true
    end
    return Config.AbertoAll
end

function func.getPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id, "concessionaria.permissao")
end

function func.getVeiculos()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.query("vRP/get_vehicles", {user_id = user_id})
end

function func.comprarVeiculo(categoria, modelo)
    local source = source
    local user_id = vRP.getUserId(source)
    local isVendedor = func.getPermissao()
    if func.abertoTodos() or (Config.AbertoAll == false and isVendedor) then

        categoria = categoria + 1
        modelo = modelo + 1
        local veiculo = Config.Veiculos[categoria].veiculos[modelo]
		
		if categoria == 2 or categoria == 3 then
        if veiculo then
            local getVeiculo = vRP.query("vRP/get_vehicle", {
                user_id = user_id,
                vehicle = veiculo.model
            })

            if #getVeiculo == 0 then
                local rows = vRP.query("vRP/count_vehicle",
                                       {vehicle = veiculo.model})
                if parseInt(rows[1].qtd) >= veiculo.estoque then
                    TriggerClientEvent("vrp_concessionaria:notify", source,
                                       "Ops!", "Estoque indisponivel.", "error")
                    return
                else
                    local totalv = vRP.query("vRP/get_maxcars",
                                             {user_id = user_id})
                    local totalGaragens = 1
					
					if vRP.hasGroup(user_id,"2") then
						totalGaragens = totalGaragens +1
					end
					if vRP.hasGroup(user_id,"3") then
						totalGaragens = totalGaragens +2
					end
				    if vRP.hasGroup(user_id,"4") then
				        totalGaragens = totalGaragens +3
					end
					if vRP.hasGroup(user_id,"5") then
						totalGaragens = totalGaragens +4
					end
					if vRP.hasGroup(user_id,"6") then
					    totalGaragens = totalGaragens +1
					end
					if vRP.hasGroup(user_id,"7") then
						totalGaragens = totalGaragens +2
					end
					if vRP.hasGroup(user_id,"8") then
						totalGaragens = totalGaragens +3
					end
					if vRP.hasGroup(user_id,"9") then
					    totalGaragens = totalGaragens +4
					end
					if vRP.hasGroup(user_id,"10") then
						totalGaragens = totalGaragens +5
					end
					if vRP.hasGroup(user_id,"11") then
						totalGaragens = totalGaragens +6
					end
					if vRP.hasGroup(user_id,"12") then
						totalGaragens = totalGaragens +7
					end
					if vRP.hasGroup(user_id,"13") then
						totalGaragens = totalGaragens +8
					end
					if vRP.hasGroup(user_id,"14") then
						totalGaragens = totalGaragens +9
					end
					if vRP.hasGroup(user_id,"15") then
						totalGaragens = totalGaragens +10
					end

                    if parseInt(totalv[1].quantidade) >= totalGaragens then
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Ops!",
                                           "Atingiu o número máximo de veículos em sua garagem.",
                                           "error")
                        return
                    end

                    local valor = veiculo.preco
                    if isVendedor then valor = valor * 0.8 end

                    if vRP.tryFullPayment(user_id, valor) then
                        vRP.execute("vRP/add_vehicle", {
                            user_id = user_id,
                            vehicle = veiculo.model
                        })
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Oba!", "Pagou <b>R$" ..
                                               vRP.format(parseInt(valor)) ..
                                               "</b>.", "success")
											   
						local user_id = vRP.getUserId(source)
                        local identity = vRP.getUserIdentity(user_id)
			            local msg = "```["..source.."]["..user_id.."] "..identity.name.." "..identity.firstname.." comprou "..veiculo.model..".```"
                        SendWebhookMessage(webcompra,msg)
                        return true
                    else
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Ops!", "Dinheiro insuficiente.",
                                           "error")
                        return
                    end
                end
            else
                TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                                   "Você já possui este veículo!", "error")
                return
            end
        else
            TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                               "Veículo inválido!", "error")
            return
        end
		
		
	    elseif categoria == 1 then
        if veiculo then
            local getVeiculo = vRP.query("vRP/get_vehicle", {
                user_id = user_id,
                vehicle = veiculo.model
            })

            if #getVeiculo == 0 then
                local rows = vRP.query("vRP/count_vehicle",
                                       {vehicle = veiculo.model})
                if parseInt(rows[1].qtd) >= veiculo.estoque then
                    TriggerClientEvent("vrp_concessionaria:notify", source,
                                       "Ops!", "Estoque indisponivel.", "error")
                    return
                else
                    local totalv = vRP.query("vRP/get_maxcars",
                                             {user_id = user_id})
                    local totalGaragens = 1
					
					if vRP.hasGroup(user_id,"2") then
						totalGaragens = totalGaragens +1
					end
					if vRP.hasGroup(user_id,"3") then
						totalGaragens = totalGaragens +2
					end
				    if vRP.hasGroup(user_id,"4") then
				        totalGaragens = totalGaragens +3
					end
					if vRP.hasGroup(user_id,"5") then
						totalGaragens = totalGaragens +4
					end
					if vRP.hasGroup(user_id,"6") then
					    totalGaragens = totalGaragens +1
					end
					if vRP.hasGroup(user_id,"7") then
						totalGaragens = totalGaragens +2
					end
					if vRP.hasGroup(user_id,"8") then
						totalGaragens = totalGaragens +3
					end
					if vRP.hasGroup(user_id,"9") then
					    totalGaragens = totalGaragens +4
					end
					if vRP.hasGroup(user_id,"10") then
						totalGaragens = totalGaragens +5
					end
					if vRP.hasGroup(user_id,"11") then
						totalGaragens = totalGaragens +6
					end
					if vRP.hasGroup(user_id,"12") then
						totalGaragens = totalGaragens +7
					end
					if vRP.hasGroup(user_id,"13") then
						totalGaragens = totalGaragens +8
					end
					if vRP.hasGroup(user_id,"14") then
						totalGaragens = totalGaragens +9
					end
					if vRP.hasGroup(user_id,"15") then
						totalGaragens = totalGaragens +10
					end

                    if parseInt(totalv[1].quantidade) >= totalGaragens then
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Ops!",
                                           "Atingiu o número máximo de veículos em sua garagem.",
                                           "error")
                        return
                    end

                    local valor = veiculo.preco
                    if isVendedor then valor = valor * 0.8 end

					if vRP.tryGetInventoryItem(user_id,"vale",valor,true) then
                        vRP.execute("vRP/add_vehicle", {
                            user_id = user_id,
                            vehicle = veiculo.model
                        })
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Oba!", "Pagou <b>R$" ..
                                               vRP.format(parseInt(valor)) ..
                                               "</b>.", "success")
						local user_id = vRP.getUserId(source)
                        local identity = vRP.getUserIdentity(user_id)
			            local msg = "```["..source.."]["..user_id.."] "..identity.name.." "..identity.firstname.." comprou "..veiculo.model..".```"
                        SendWebhookMessage(webcompra,msg)
                        return true
                    else
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Ops!", "Vales insuficiente.",
                                           "error")
                        return
                    end
                end
            else
                TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                                   "Você já possui este veículo!", "error")
                return
            end
        else
            TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                               "Veículo inválido!", "error")
            return
        end
		end
		
    else
        TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                           "Somente o dono da concessionária pode executar está ação!",
                           "error")
        return
    end

end
function func.valecomprarVeiculo(categoria, modelo)
    local source = source
    local user_id = vRP.getUserId(source)
    local isVendedor = func.getPermissao()
	TriggerClientEvent("Notify",source,"aviso","VALEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
    if func.abertoTodos() or (Config.AbertoAll == false and isVendedor) then

        categoria = categoria + 1
        modelo = modelo + 1

        local veiculo = Config.Veiculos[categoria].veiculos[modelo]
        if categoria == 2 then
        if veiculo then
            local getVeiculo = vRP.query("vRP/get_vehicle", {
                user_id = user_id,
                vehicle = veiculo.model
            })

            if #getVeiculo == 0 then
                local rows = vRP.query("vRP/count_vehicle",
                                       {vehicle = veiculo.model})
                if parseInt(rows[1].qtd) >= veiculo.estoque then
                    TriggerClientEvent("vrp_concessionaria:notify", source,
                                       "Ops!", "Estoque indisponivel.", "error")
                    return
                else
                    local totalv = vRP.query("vRP/get_maxcars",
                                             {user_id = user_id})
                    local totalGaragens = 1
					
					if vRP.hasGroup(user_id,"2") then
						totalGaragens = totalGaragens +1
					end
					if vRP.hasGroup(user_id,"3") then
						totalGaragens = totalGaragens +2
					end
				    if vRP.hasGroup(user_id,"4") then
				        totalGaragens = totalGaragens +3
					end
					if vRP.hasGroup(user_id,"5") then
						totalGaragens = totalGaragens +4
					end
					if vRP.hasGroup(user_id,"6") then
					    totalGaragens = totalGaragens +1
					end
					if vRP.hasGroup(user_id,"7") then
						totalGaragens = totalGaragens +2
					end
					if vRP.hasGroup(user_id,"8") then
						totalGaragens = totalGaragens +3
					end
					if vRP.hasGroup(user_id,"9") then
					    totalGaragens = totalGaragens +4
					end
					if vRP.hasGroup(user_id,"10") then
						totalGaragens = totalGaragens +5
					end
					if vRP.hasGroup(user_id,"11") then
						totalGaragens = totalGaragens +6
					end
					if vRP.hasGroup(user_id,"12") then
						totalGaragens = totalGaragens +7
					end
					if vRP.hasGroup(user_id,"13") then
						totalGaragens = totalGaragens +8
					end
					if vRP.hasGroup(user_id,"14") then
						totalGaragens = totalGaragens +9
					end
					if vRP.hasGroup(user_id,"15") then
						totalGaragens = totalGaragens +10
					end

                    if parseInt(totalv[1].quantidade) >= totalGaragens then
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Ops!",
                                           "Atingiu o número máximo de veículos em sua garagem.",
                                           "error")
                        return
                    end

                    local valor = veiculo.preco
                    if isVendedor then valor = valor * 0.8 end

					if vRP.tryGetInventoryItem(user_id,"vale",valor,true) then
                        vRP.execute("vRP/add_vehicle", {
                            user_id = user_id,
                            vehicle = veiculo.model
                        })
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Oba!", "Pagou <b>R$" ..
                                               vRP.format(parseInt(valor)) ..
                                               "</b>.", "success")
						local user_id = vRP.getUserId(source)
                        local identity = vRP.getUserIdentity(user_id)
			            local msg = "```["..source.."]["..user_id.."] "..identity.name.." "..identity.firstname.." comprou "..veiculo.model..".```"
                        SendWebhookMessage(webcompra,msg)
                        return true
                    else
                        TriggerClientEvent("vrp_concessionaria:notify", source,
                                           "Ops!", "Vales insuficiente.",
                                           "error")
                        return
                    end
                end
            else
                TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                                   "Você já possui este veículo!", "error")
                return
            end
        else
            TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                               "Veículo inválido!", "error")
            return
        end
		end --
    else
        TriggerClientEvent("vrp_concessionaria:notify", source, "Ops!",
                           "Somente o dono da concessionária pode executar está ação!",
                           "error")
        return
    end

end

function func.getNomeVeiculo() return
    vRP.prompt(source, "Nome do veículo:", "") end
