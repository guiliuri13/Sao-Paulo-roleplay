-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA É 100% GRATUITO E OPEN SOURCE, SUA VENDA É PROIBIDA ] --
-- [ VISITE NOSSA LOJA E SAIBA MAIS SOBRE NOSSO TRABALHO - discord.gg/bABGBEX ] --
-- [ VISITE NOSSO GITHUB PARA TER ACESSO A MAIS SCRIPTS GRATUITOS COMO ESSE AQUI ] --
-- [ PARA CONSEGUIR AJUDA COM ESSE OU OUTRO DE NOSSOS SISTEMAS GRATUITOS, ACESSE NOSSO DISCORD ] --

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPex = {}
Tunnel.bindInterface("bdl_pdsystem",vRPex)

local webhookarsenal = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

function vRPex.checkPermission(permission)
	local src = source
    local user_id = vRP.getUserId(src)
    if user_id then
        return vRP.hasPermission(user_id,permission)
    end
end

function vRPex.checkOfficer()
	local src = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		return true
	end
end

RegisterNetEvent('bdl:onarmor')
AddEventHandler('bdl:onarmor',function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.setArmour(source,100)
			return true
		end
	end
end)

RegisterNetEvent('bdl:offarmor')
AddEventHandler('bdl:offarmor',function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.setArmour(source,0)
			return true
		end
	end
end)

function vRPex.remEquip()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRPclient.setArmour(source,0)
		vRPclient._replaceWeapons(source,{["WEAPON_UNARMED"] = { ammo = 0 }})
	end
end

RegisterServerEvent("bdl:onduty")
AddEventHandler("bdl:onduty",function()
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"oos-policia.permissao") then
        vRP.addUserGroup(user_id,"policia")
        TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.",5000)
        
    else
        TriggerClientEvent("Notify",source,"negado","Você já está em serviço.",5000)
    end
end)

RegisterServerEvent("bdl:offduty")
AddEventHandler("bdl:offduty",function()
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
        vRP.addUserGroup(user_id,"oos-policia")
		vRPex.remEquip()
        TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.",5000)
		TriggerClientEvent("Notify",source,"aviso","Seus equipamentos foram automáticamente guardados de volta no arsenal.",5000) 
    else
        TriggerClientEvent("Notify",source,"negado","Você já está fora de serviço.",5000)
    end
end)