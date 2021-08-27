local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
--ALTER TABLE `vrp_user_vehicles` ADD `preso` int(1) unsigned NOT NULL DEFAULT 0;

local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookpolicia = "https://discordapp.com/api/webhooks/738493438110204044/UqYKrNeXQQjM1cnBLURJZaUkpLvefSfxCfhoU_8lVXpYoDEJn04y_HO5hZYV6DTYJCXG"
local webhookponto = "https://discord.com/api/webhooks/783108217022447706/VJXH5ZeXVfkDnw3PPM4arkCyRq9A-UHSxizDPKgGR5ByezlPQ4AYz-YfDzrQcvlDs9Qb"
local webhookvindo = "https://discord.com/api/webhooks/795184628612071484/zD_0MEbxpgEylTVwLoZJkG0mhOP9TBPabyv7gPl3c-Ib64187W38Jp8eKmhtKIAYsoke"

local webhooksamuvindo = "https://discord.com/api/webhooks/795540055031939104/hv3QSw-F8CIG086rmpLkFp_dlHKlfe1Cl8cqEhxbCR__CfflXc4jhVA86D1LGobQIilI"
local webhooksamuprov = "https://discord.com/api/webhooks/795539165588226071/I2Xut75V6c1ThxllXRp3KKIDamTN5LG0F2OxtSD2MpTWK90MJog8gEQopS9tQpMQKlX7"
local webhooksamuponto = "https://discord.com/api/webhooks/795545542897434636/WsqnDMc_jbmhVDcDnEbevT4_UXBibv5vWBM6mw0FRSAl-Sqdgqq0Zl-5DtAIeatMqdPV"


local webhookmedico = "https://discordapp.com/api/webhooks/738493892235886702/eo3rN6wdLj7tJR3FUh1IKjQuS7PpE3D6tM673mJjzo8k6sw7S-eWJZ9YiBsv9ccpeM5s"

local webhookmecvindo = "https://discord.com/api/webhooks/795752118219964417/o8LmbtouKcBRD09RZoVDp0sSnBz9n4sthJqC58ot9tXr_NguCqWuTrGFS0nkTN3A-w9Q"
local webhookmecanicoponto = "https://discord.com/api/webhooks/795748536900649001/p2kniKMHbCSIXKTr6INVqGmnLIJEBJwCetDa8wr2T3YWSXUezVawKISsUYu2g14M79-s"
local webhookdetido = "https://discord.com/api/webhooks/795740379764490332/HkyJKHAMpNp5LAUBKPuUh8N8fMgZycIs9_k5J4QmXU9G4yq_ibnCy0NJQ_UDdUpORgwz"
local webhookficha = "https://discord.com/api/webhooks/795740136204664874/FfXrrf_36Gl95cBgDvbGL77wqLFBuOk-PfuMKWJ-sG6Xnlqb7mimYOoMaCgeLXNOeuAb" 

function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- GPS ON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gps',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local soldado = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player and player ~= uplayer then
				async(function()
					--TriggerClientEvent('gpsactivetoall', player, player)
					-- police map gps
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLACA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('placa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		if args[1] then
			local user_id = vRP.getUserByRegistration(args[1])
			if user_id then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
					TriggerClientEvent('chatMessage',source,"COPOM",{245,0,0},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
				end
			else
				TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
			end
		else
			local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
			local placa_user = vRP.getUserByRegistration(mPlaca)
			if mPlaca then
				if placa_user then
					local identity = vRP.getUserIdentity(placa_user)
					if identity then
						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent('chatMessage',source,"COPOM",{245,0,0},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
					end
				else
					TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('paytow',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				vRP.giveMoney(nuser_id,500)
				vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
				TriggerClientEvent("Notify",source,"sucesso","Efetuou o pagamento pelo serviço do mecânico.")
				TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$500 </b> pelo serviço de mecânico.")
				vRP.logs("savedata/paytow.txt","[ID]: "..user_id.." / [NID]: "..nuser_id.." / [FUNÇÃO]: Paytow")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MULTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('multar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local valor = vRP.prompt(source,"Valor:","")
		if id == "" or valor == "" then
			return
		end
		local value = vRP.getUData(parseInt(id),"vRP:multas")
		local multas = json.decode(value) or 0
		vRP.setUData(parseInt(id),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))

		TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:servicos")
AddEventHandler("vrp_policia:servicos",function()
    local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)


	if vRP.hasGroup(user_id, "coronel") then
	    vRP.addUserGroup(user_id,"paisanacoronel")
		vRP.removeUserGroup(user_id,"coronel")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanacoronel") then
	    vRP.addUserGroup(user_id,"coronel")
		vRP.removeUserGroup(user_id,"paisanacoronel")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "major") then
	    vRP.addUserGroup(user_id,"paisanamajor")
		vRP.removeUserGroup(user_id,"major")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanamajor") then
	    vRP.addUserGroup(user_id,"major")
		vRP.removeUserGroup(user_id,"paisanamajor")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "capitao") then
	    vRP.addUserGroup(user_id,"paisanacapitao")
		vRP.removeUserGroup(user_id,"capitao")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanacapitao") then
	    vRP.addUserGroup(user_id,"capitao")
		vRP.removeUserGroup(user_id,"paisanacapitao")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "tenente") then
	    vRP.addUserGroup(user_id,"paisanatenente")
		vRP.removeUserGroup(user_id,"tenente")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanatenente") then
	    vRP.addUserGroup(user_id,"tenente")
		vRP.removeUserGroup(user_id,"paisanatenente")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end	
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "sargento") then
	    vRP.addUserGroup(user_id,"paisanasargento")
		vRP.removeUserGroup(user_id,"sargento")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "suportepaisana") then
	    vRP.addUserGroup(user_id,"sargento")
		vRP.removeUserGroup(user_id,"suportepaisana")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end	
	-------------------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "cabo") then
	    vRP.addUserGroup(user_id,"paisanacabo")
		vRP.removeUserGroup(user_id,"cabo")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanacabo") then
	    vRP.addUserGroup(user_id,"cabo")
		vRP.removeUserGroup(user_id,"paisanacabo")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "soldado") then
	    vRP.addUserGroup(user_id,"paisanasoldado")
		vRP.removeUserGroup(user_id,"soldado")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanasoldado") then
	    vRP.addUserGroup(user_id,"soldado")
		vRP.removeUserGroup(user_id,"paisanasoldado")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "recruta") then
	    vRP.addUserGroup(user_id,"paisanarecruta")
		vRP.removeUserGroup(user_id,"recruta")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanarecruta") then
	    vRP.addUserGroup(user_id,"recruta")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 Policial ^1^7 entrou em patrulhamento . "..#policia.." PM em serviço")
	end
end)
	-----------------------------------------------------------------------------------------------------------------------------------------
	


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

		--[[
	elseif vRP.hasPermission(user_id,"forcanacional.permissao") then

		vRP.addUserGroup(user_id,"PaisanaForca")
		vRP.removeUserGroup(user_id,"Forca")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("forcanacional.permissao")
		local msg = "```[Força Nacional] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento . ```"
		SendWebhookMessage(webhookpolicia,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7Policial ^1"..identity.name.." "..identity.firstname.."^7 saiu de patrulhamento . "..#policia.." PM em serviço")
		
	elseif vRP.hasPermission(user_id,"paisanaforcanacional.permissao") then

		vRP.addUserGroup(user_id,"Forca")
		vRP.removeUserGroup(user_id,"PaisanaForca")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		local policia = vRP.getUsersByPermission("forcanacional.permissao")
		local msg = "```[Força Nacional] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento .```"
		SendWebhookMessage(webhookpolicia,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7Policial ^1"..identity.name.." "..identity.firstname.."^7 entrou em patrulhamento . "..#policia.." PM em serviço")
		
	end
	--
end) ]]




RegisterServerEvent("vrp_rota:servicos")
AddEventHandler("vrp_rota:servicos",function()
    local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"rota.permissao") then

		vRP.addUserGroup(user_id,"PaisanaROTA")
		vRP.removeUserGroup(user_id,"ROTA")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("rota.permissao")
		local msg = "```[ROTA] Policial "..identity.name.." "..identity.firstname.." saiu de patrulhamento .```"
		SendWebhookMessage(webhookpolicia,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7Policial ^1"..identity.name.." "..identity.firstname.."^7 saiu de patrulhamento ."..#policia.." ROTA em serviço")
		
	elseif vRP.hasPermission(user_id,"paisanarota.permissao") then

		vRP.addUserGroup(user_id,"ROTA")
		vRP.removeUserGroup(user_id,"PaisanaROTA")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		local policia = vRP.getUsersByPermission("rota.permissao")
		local msg = "```[ROTA] Policial "..identity.name.." "..identity.firstname.." entrou em patrulhamento .```"
		SendWebhookMessage(webhookpolicia,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7Policial ^1"..identity.name.." "..identity.firstname.."^7 entrou em patrulhamento ."..#policia.." ROTA em serviço")
		
	end
end)



RegisterServerEvent("vrp_medico:servicos")
AddEventHandler("vrp_medico:servicos",function()
    local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
  
	if vRP.hasGroup(user_id, "diretor") then
	    vRP.addUserGroup(user_id,"paisanadiretor")
		vRP.removeUserGroup(user_id,"diretor")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 saiu de serviço . "..#policia.." SAMUs em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanadiretor") then
	    vRP.addUserGroup(user_id,"diretor")
		vRP.removeUserGroup(user_id,"paisanadiretor")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMu ^1^7 entrou em serviço . "..#policia.." SAMUs em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "cirurgiao") then
	    vRP.addUserGroup(user_id,"paisanacirurgiao")
		vRP.removeUserGroup(user_id,"cirurgiao")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 saiu de serviço . "..#policia.." SAMUs em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanacirurgiao") then
	    vRP.addUserGroup(user_id,"cirurgiao")
		vRP.removeUserGroup(user_id,"paisanacirurgiao")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 entrou em serviço . "..#policia.." SAMUs em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "medicogeral") then
	    vRP.addUserGroup(user_id,"paisanamedicogeral")
		vRP.removeUserGroup(user_id,"medicogeral")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 saiu de serviço . "..#policia.." SAMUs em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanamedicogeral") then
	    vRP.addUserGroup(user_id,"medicogeral")
		vRP.removeUserGroup(user_id,"paisanamedicogeral")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 entrou em serviço . "..#policia.." SAMUs em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "enfermeiro") then
	    vRP.addUserGroup(user_id,"paisanaenfermeiro")
		vRP.removeUserGroup(user_id,"enfermeiro")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 saiu de serviço . "..#policia.." SAMUs em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanaenfermeiro") then
	    vRP.addUserGroup(user_id,"enfermeiro")
		vRP.removeUserGroup(user_id,"paisanaenfermeiro")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 entrou em serviço . "..#policia.." SAMUs em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "paramedicoo") then
	    vRP.addUserGroup(user_id,"paisanaparamedico")
		vRP.removeUserGroup(user_id,"paramedicoo")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 saiu de serviço . "..#policia.." SAMUs em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanaparamedico") then
	    vRP.addUserGroup(user_id,"paramedicoo")
		vRP.removeUserGroup(user_id,"paisanaparamedico")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg = "```[SAMU] Médico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhooksamuponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 SAMU ^1^7 entrou em serviço . "..#policia.." SAMUs em serviço")
	end
	-------------------------------------------------------------------------------------------------------------------------------------------------
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("vrp_mecanico:servicos")
AddEventHandler("vrp_mecanico:servicos",function()
    local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
  
	if vRP.hasGroup(user_id, "engenheiro") then
	    vRP.addUserGroup(user_id,"paisanaengenheiro")
		vRP.removeUserGroup(user_id,"engenheiro")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("mecanico.permissao")
		local msg = "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 saiu de serviço . "..#policia.." Mecânicos em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanaengenheiro") then
	    vRP.addUserGroup(user_id,"engenheiro")
		vRP.removeUserGroup(user_id,"paisanaengenheiro")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("mecanico.permissao")
		local msg = "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 entrou em serviço . "..#policia.." Mecânicos em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "mecanicoo") then
	    vRP.addUserGroup(user_id,"paisanamecanicoo")
		vRP.removeUserGroup(user_id,"mecanicoo")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("mecanico.permissao")
		local msg = "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 saiu de serviço . "..#policia.." Mecânicos em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanamecanicoo") then
	    vRP.addUserGroup(user_id,"mecanicoo")
		vRP.removeUserGroup(user_id,"paisanamecanicoo")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg =  "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 entrou em serviço . "..#policia.." Mecânicos em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "borracheiro") then
	    vRP.addUserGroup(user_id,"paisanaborracheiro")
		vRP.removeUserGroup(user_id,"borracheiro")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("mecanico.permissao")
		local msg = "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 saiu de serviço . "..#policia.." Mecânicos em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanaborracheiro") then
	    vRP.addUserGroup(user_id,"borracheiro")
		vRP.removeUserGroup(user_id,"paisanaborracheiro")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg =  "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 entrou em serviço . "..#policia.." Mecânicos em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "aprendiz") then
	    vRP.addUserGroup(user_id,"paisanaaprendiz")
		vRP.removeUserGroup(user_id,"aprendiz")
		TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		local policia = vRP.getUsersByPermission("mecanico.permissao")
		local msg = "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." saiu de serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 saiu de serviço . "..#policia.." Mecânicos em serviço")
		
	elseif vRP.hasGroup(user_id, "paisanaaprendiz") then
	    vRP.addUserGroup(user_id,"aprendiz")
		vRP.removeUserGroup(user_id,"paisanaaprendiz")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou de serviço.")
		local policia = vRP.getUsersByPermission("paramedico.permissao")
		local msg =  "```[MEC] Mecanico "..identity.name.." "..identity.firstname.." entrou em serviço em "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..". ```"
		SendWebhookMessage(webhookmecanicoponto,msg)
		
		TriggerClientEvent('chatMessage',-1,"^7 1 MECANICO ^1^7 entrou em serviço . "..#policia.." Mecânicos em serviço")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
end)



-------------------------------------------------------------------------------------------------------------------------------
--CONVIDAR PM
---------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('convidarpm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"coronel.permissao") then
	    local id = vRP.getUserSource(parseInt(args[1]))
		if args[1] then
			if id then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para ser policial, deseja aceitar ?",60)
			if ok then
		        local identity44 = vRP.getUserIdentity(args[1])
			    vRP.addUserGroup(parseInt(args[1]),"recruta")
			    local msg = "```[POLÍCIA MILITAR] ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." entrou para a corporação, bem vindo(a)!.```" 
				SendWebhookMessage(webhookvindo,msg)
				
		    	end
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)



-------------------------------------------------------------------------------------------------------------------------------
--CONVIDAR SAMU
---------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('convidarsamu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"diretor.permissao") then
	    local id = vRP.getUserSource(parseInt(args[1]))
		if args[1] then
			if id then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para o SAMU, deseja aceitar ?",60)
			if ok then
		        local identity44 = vRP.getUserIdentity(args[1])
			    vRP.addUserGroup(parseInt(args[1]),"paramedicoo")
			    local msg = "```[SAMU] ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." entrou para a corporação, bem vindo(a)!.```" 
				SendWebhookMessage(webhooksamuvindo,msg)
				
		    	end
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)


-------------------------------------------------------------------------------------------------------------------------------
--CONVIDAR MECANICO
---------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('convidarmec',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"engenheiro.permissao") then
	    local id = vRP.getUserSource(parseInt(args[1]))
		if args[1] then
			if id then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para ser MECÂNICO, deseja aceitar ?",60)
			if ok then
		        local identity44 = vRP.getUserIdentity(args[1])
			    vRP.addUserGroup(parseInt(args[1]),"aprenfiz")
			    local msg = "```[MEC] ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." entrou para os mecânicos boladões, bem vindo(a)!.```" 
				SendWebhookMessage(webhookmecvindo,msg)
				
		    	end
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)









-----------------------------------------------------------------------------------------------------------------------------------------
-- DETIDO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('detido',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local placa,vname,vnet = vRPclient.ModelName(source,7)
		local placa_user = vRP.getUserByRegistration(placa)
		local identity = vRP.getUserIdentity(source)
		if placa_user then
			if vname then
				local rows = vRP.query("vRP/get_vehicle",{ user_id = placa_user, vehicle = vname })
				if #rows > 0 then
					if rows[1].detido == 1 then
						TriggerClientEvent("Notify",source,"importante","Este veículo já se encontra detido.")
					else
						vRP.execute("vRP/set_detido",{ user_id = placa_user, vehicle = vname, detido = 1, time = parseInt(os.time()) })
						TriggerClientEvent("Notify",source,"sucesso","Veículo detido com sucesso.")
						
						local msg = "```[VEICULO DETIDO] MODELO "..vname.." | PLACA "..identity.registration.." - PROPRIETARIO PROCURAR DEPARTAMENTO DE POLICIA```" 
		                SendWebhookMessage(webhookdetido,msg)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('prender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local player = vRP.getUserSource(parseInt(args[1]))
		local identity44 = vRP.getUserIdentity(args[1])
		vRP.setUData(parseInt(args[1]),"vRP:prisao",json.encode(parseInt(args[2])))
		vRPclient.setHandcuffed(player,false)
		TriggerClientEvent('prisioneiro',player,true)
		vRPclient.teleport(player,1680.1,2513.0,45.5)
		prison_lock(parseInt(args[1]))
		
		local msg = "```[COPOM] "..identity.name.." "..identity.firstname.." prendeu "..identity44.name.." "..identity44.firstname.." por "..args[2].." meses.```"
        SendWebhookMessage(webhookficha,msg)
		
		
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALGEMAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:algemar")
AddEventHandler("vrp_policia:algemar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if vRP.getInventoryItemAmount(user_id,"algemas") >= 1 then
			if vRPclient.isHandcuffed(nplayer) then
				vRPclient.toggleHandcuff(nplayer)
				TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
				TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
			else
				TriggerClientEvent('cancelando',source,true)
				TriggerClientEvent('cancelando',nplayer,true)
				TriggerClientEvent('carregar',nplayer,source)
				vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
				vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
				SetTimeout(3500,function()
					vRPclient._stopAnim(source,false)
					vRPclient.toggleHandcuff(nplayer)
					TriggerClientEvent('carregar',nplayer,source)
					TriggerClientEvent('cancelando',source,false)
					TriggerClientEvent('cancelando',nplayer,false)
					TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
					TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
				end)
			end
		else
			if vRP.hasPermission(user_id,"policia.permissao") then
				if vRPclient.isHandcuffed(nplayer) then
					vRPclient.toggleHandcuff(nplayer)
					TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
					TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
				else
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
					SetTimeout(3500,function()
						vRPclient._stopAnim(source,false)
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('cancelando',nplayer,false)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:carregar")
AddEventHandler("vrp_policia:carregar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,1)
		if nplayer then
			TriggerClientEvent('carregar',nplayer,source)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FICHA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ficha', function(source, args, rawCommand)  -- ready
	local src = source
	local user_id = vRP.getUserId(src)
	local nplayer = vRPclient.getNearestPlayer(src,5)
	if nplayer then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local nuser_id = vRP.getUserId(nplayer)
			local rows = vRP.query("vRP/get_fichacriminal", {user_id = nuser_id})
			foreachherex = ""
			for k,v in pairs(rows) do
				foreachherex = foreachherex.."<li class=\"card\">			<i class=\"icon fa fa-file\">				</i><div><h4> "..v.ficha.." </h4></div><label class=\"amount\">  "..v.tempopreso.." Meses   </label></li>"
			end
			local identity = vRP.getUserIdentity(nuser_id)
			vRPclient.setDiv(src, "ficha", "@import url(\"https://fonts.googleapis.com/css?family=Roboto+Slab\");@import url(\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\");body {font-family: \"Roboto Slab\", serif;}.layout {display: flex;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;border-radius: 5px;margin: 0 56.8%;margin-top: 50px;margin-bottom: 50px;width: 60%;height: 974.4px;}.layout > .page {display: flex;flex-direction: column;background: #f7f6fc;margin: 0 auto;margin-top: 50px;width: 350px;max-height: 550px;box-shadow: 0 0 4px 1px rgba(0, 0, 0, 0.1);border-radius: 10px;}.layout > .page header {padding: 15px 30px;background: linear-gradient(45deg, #8388fe 0%, #8388fe 34%, #30c1ea 100%);color: #ffffff;display: flex;flex-direction: column;flex-shrink: 0;position: -webkit-sticky;position: sticky;top: 0;}.layout > .page header nav {display: flex;align-items: center;justify-content: space-between;}.layout > .page header nav > h2 {font-size: 1.0em;}.layout > .page header nav img.user-img {width: 40px;height: 40px;border-radius: 50%;box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.2);}.layout > .page:last-child {margin-top: 100px;}.page.dashboard header .details {display: flex;flex-direction: column;margin-top: 15px;}.page.dashboard header .details h1 {font-size: 1.0em;}.page.dashboard header .details .balance {display: flex;align-items: center;justify-content: space-between;margin-top: 15px;}.page.dashboard header .details .balance h4 {font-size: 0.75em;}.page.dashboard header .details .balance h2 {font-size: 1.2em;margin-top: 5px;letter-spacing: 1px;}.page.dashboard header .details .balance > i {font-size: 1.5em;}.page.dashboard > .split {margin: 0 auto;margin-top: 30px;margin-bottom: 30px;display: flex;flex-shrink: 0;border-radius: 5px;}.page.dashboard > .split .tile {display: flex;align-items: center;padding: 14px;background: #30c1ea;color: #ffffff;border-radius: 5px;box-shadow: 0 0 4px 1px rgba(0, 0, 0, 0.1);}.page.dashboard > .split .tile.income {background: #8388fe;}.page.dashboard > .split .tile > i {margin-right: 30px;font-size: 1.2em;}.page.dashboard > .split .tile h4 {font-size: 0.75em;}.page.dashboard > .split .tile h2 {font-size: 1.0em;margin-top: 6px;}.page.dashboard > .split .tile:last-child {margin-left: 15px;}.page.dashboard section.payments,.page.dashboard section.savings {background: #f7f6fc;padding: 30px;padding-bottom: 0;}.page.dashboard section.payments > .title,.page.dashboard section.savings > .title {font-size: 1em;font-weight: 600;margin-bottom: 15px;}.page.dashboard section.savings ul li:last-child {opacity: 0.5;}ul.list {list-style: none;}ul.list li.card {display: flex;align-items: center;background: #ffffff;box-shadow: 0 0 4px 1px rgba(0, 0, 0, 0.1);padding: 8px;margin: 5px 0;border-radius: 5px;}ul.list li.card .icon {font-size: 1.2em;color: #30c1ea;}ul.list li.card > div {margin-left: 10px;font-size: 0.75em;}ul.list li.card > div h4 {font-weight: 600;color: #6b6b6b;}ul.list li.card > div h5 {color: #9e9e9e;font-size: 9px;margin-top: 6px;}ul.list li.card > .amount, ul.list li.card .more {margin-left: auto;font-size: 1em;color: #1183a3;}ul.list li.card > .more {font-size: 0.75em;text-align: right;}ul.list li.card > .more .amount.less {color: #E91E63;}.page.calendar {background: #f7f6fc;}.page.calendar .content {padding: 30px;}.page.calendar .split-calendar {display: flex;background: #ffffff;color: #9e9e9e;}.page.calendar .split-calendar > div {padding: 15px 0;flex-grow: 1;text-align: center;text-transform: uppercase;font-size: 0.75em;border-left: 1px solid #d1d1d1;transition: all .2s;}.page.calendar .split-calendar > div:first-child {border-left: none;}.page.calendar .split-calendar > div.selected, .page.calendar .split-calendar > div:hover {background: #30c1ea;color: #ffffff;}.page.calendar .split-calendar > div:hover {cursor: pointer;}.page.calendar .balance {text-align: center;margin: 15px 0;}.page.calendar .balance h4 {color: #9e9e9e;font-size: 0.75em;}.page.calendar .balance h2 {color: #0c5e75;font-size: 1.0em;margin-top: 7.5px;}.page.calendar ul.list .card {position: relative;padding-left: 30px;margin-left: 15px;}.page.calendar ul.list .card:hover {background: #f7f6fc;color: #ffffff;}.page.calendar ul.list .card:hover > .icon {left: 80%;}.page.calendar ul.list .card > .icon {position: absolute;left: -15px;width: 45px;padding: 10px 0;text-align: center;background: #30c1ea;border-radius: 5px;color: #ffffff;box-shadow: 0 0 4px 1px rgba(0, 0, 0, 0.1);transition: left 0.5s;}.page.calendar ul.list .card > .icon.present {background: #8388fe;}","<div class=\"layout\"><div class=\"page dashboard\"><header><div class=\"details\"><h1>Ficha Criminal, "..identity.name.." "..identity.firstname..", ele possui "..identity.age.." anos.</h1><div class=\"balance\"></div></div></header><section class=\"payments\"><h2 class=\"title\"> Ficha Criminal </h2><ul class=\"list\"> "..foreachherex.." </ul></section></div></div>", "")
			if vRP.request(src,"Fechar dados do jogador?",900) then
				vRPclient.removeDiv(src, "ficha")
			else
				vRPclient.removeDiv(src, "ficha")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RMASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rmascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rmascara',nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RCHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rchapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rchapeu',nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RCAPUZ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rcapuz',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if vRPclient.isCapuz(nplayer) then
			vRPclient.setCapuz(nplayer)
			TriggerClientEvent("Notify",source,"sucesso","Capuz colocado com sucesso.")
		else
			TriggerClientEvent("Notify",source,"importante","A pessoa não está com o capuz na cabeça.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('re',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"paramedico.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isInComa(nplayer) and vRP.tryGetInventoryItem(user_id,"desfibrilador",1) then
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
				TriggerClientEvent("progress",source,30000,"reanimando")
				SetTimeout(30000,function()
					vRPclient.killGod(nplayer)
					vRPclient._stopAnim(source,false)
					vRP.giveMoney(user_id,300)
					TriggerClientEvent('cancelando',source,false)
				end)
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.")
			end
		end
	end
end)
--[[RegisterServerEvent("reanimar:jogador")
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
				        vRPclient.setHealth(nplayer,150)
					    vRPclient._stopAnim(source,false)
						vRPclient._stopAnim(nplayer,false)
					    vRP.giveMoney(user_id,300)
					    TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('setart',source)
				    end)
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.")
			end
		end
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- CV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.ejectVehicle(nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- APREENDER
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	"dinheirosujo",
	"algemas",
	"capuz",
	"lockpick",
	"masterpick",
	"maconha",
	"crack",
	"lsd",
	"placa",
	"rebite",
	"orgao",
	"etiqueta",
	"pendrive",
	"relogioroubado",
	"pulseiraroubada",
	"anelroubado",
	"colarroubado",
	"brincoroubado",
	"carteiraroubada",
	"carregadorroubado",
	"tabletroubado",
	"sapatosroubado",
	"vibradorroubado",
	"perfumeroubado",
	"maquiagemroubada",
	"wbody|WEAPON_DAGGER",
	"wbody|WEAPON_BAT",
	"wbody|WEAPON_BOTTLE",
	"wbody|WEAPON_CROWBAR",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_GOLFCLUB",
	"wbody|WEAPON_HAMMER",
	"wbody|WEAPON_HATCHET",
	"wbody|WEAPON_KNUCKLE",
	"wbody|WEAPON_KNIFE",
	"wbody|WEAPON_MACHETE",
	"wbody|WEAPON_SWITCHBLADE",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_WRENCH",
	"wbody|WEAPON_BATTLEAXE",
	"wbody|WEAPON_POOLCUE",
	"wbody|WEAPON_STONE_HATCHET",
	"wbody|WEAPON_PISTOL",
	"wbody|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_APPISTOL",
	"wbody|WEAPON_CARBINERIFLE",
	"wbody|WEAPON_SMG",
	"wbody|WEAPON_PUMPSHOTGUN_MK2",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_SNSPISTOL",
	"wbody|WEAPON_MICROSMG",
	"wbody|WEAPON_ASSAULTRIFLE",
	"wbody|WEAPON_FIREEXTINGUISHER",
	"wbody|WEAPON_FLARE",
	"wbody|WEAPON_REVOLVER",
	"wbody|WEAPON_PISTOL_MK2",
	"wbody|WEAPON_VINTAGEPISTOL",
	"wbody|WEAPON_MUSKET",
	"wbody|WEAPON_GUSENBERG",
	"wbody|WEAPON_ASSAULTSMG",
	"wbody|WEAPON_COMBATPDW",
	"wammo|WEAPON_DAGGER",
	"wammo|WEAPON_BAT",
	"wammo|WEAPON_BOTTLE",
	"wammo|WEAPON_CROWBAR",
	"wammo|WEAPON_FLASHLIGHT",
	"wammo|WEAPON_GOLFCLUB",
	"wammo|WEAPON_HAMMER",
	"wammo|WEAPON_HATCHET",
	"wammo|WEAPON_KNUCKLE",
	"wammo|WEAPON_KNIFE",
	"wammo|WEAPON_MACHETE",
	"wammo|WEAPON_SWITCHBLADE",
	"wammo|WEAPON_NIGHTSTICK",
	"wammo|WEAPON_WRENCH",
	"wammo|WEAPON_BATTLEAXE",
	"wammo|WEAPON_POOLCUE",
	"wammo|WEAPON_STONE_HATCHET",
	"wammo|WEAPON_PISTOL",
	"wammo|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_APPISTOL",
	"wammo|WEAPON_CARBINERIFLE",
	"wammo|WEAPON_SMG",
	"wammo|WEAPON_PUMPSHOTGUN_MK2",
	"wammo|WEAPON_STUNGUN",
	"wammo|WEAPON_NIGHTSTICK",
	"wammo|WEAPON_SNSPISTOL",
	"wammo|WEAPON_MICROSMG",
	"wammo|WEAPON_ASSAULTRIFLE",
	"wammo|WEAPON_FIREEXTINGUISHER",
	"wammo|WEAPON_FLARE",
	"wammo|WEAPON_REVOLVER",
	"wammo|WEAPON_PISTOL_MK2",
	"wammo|WEAPON_VINTAGEPISTOL",
	"wammo|WEAPON_MUSKET",
	"wammo|WEAPON_GUSENBERG",
	"wammo|WEAPON_ASSAULTSMG",
	"wammo|WEAPON_COMBATPDW",
	"bandagem"
}

RegisterCommand('apreender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local user_id = vRP.getUserId(source)
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local weapons = vRPclient.replaceWeapons(nplayer,{})
				for k,v in pairs(weapons) do
					vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
					if v.ammo > 0 then
						vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
					end
				end

				local inv = vRP.getInventory(nuser_id)
				for k,v in pairs(itemlist) do
					local sub_items = { v }
					if string.sub(v,1,1) == "*" then
						local idname = string.sub(v,2)
						sub_items = {}
						for fidname,_ in pairs(inv) do
							if splitString(fidname,"|")[1] == idname then
								table.insert(sub_items,fidname)
							end
						end
					end

					for _,idname in pairs(sub_items) do
						local amount = vRP.getInventoryItemAmount(nuser_id,idname)
						if amount > 0 then
							local item_name,item_weight = vRP.getItemDefinition(idname)
							if item_name then
								if vRP.tryGetInventoryItem(nuser_id,idname,amount,true) then
									vRP.giveInventoryItem(user_id,idname,amount)
								end
							end
						end
					end
				end
				TriggerClientEvent("Notify",nplayer,"importante","Todos os seus pertences foram apreendidos.")
				TriggerClientEvent("Notify",source,"importante","Apreendeu todos os pertences da pessoa.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('extras',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		if vRPclient.isInVehicle(source) then
			TriggerClientEvent('extras',source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYEXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryextras")
AddEventHandler("tryextras",function(index,extra)
	TriggerClientEvent("syncextras",-1,index,parseInt(extra))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		TriggerClientEvent('cone',source,args[1])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARREIRA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('barreira',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		TriggerClientEvent('barreira',source,args[1])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPIKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('spike',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('spike',source,args[1])
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- DISPAROS
--------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('atirando')
AddEventHandler('atirando',function(x,y,z)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasPermission(user_id,"policia.permissao") then
			local policiais = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(policiais) do
				local player = vRP.getUserSource(w)
				if player then
					TriggerClientEvent('notificacao',player,x,y,z,user_id)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANUNCIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('anuncio',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local identity = vRP.getUserIdentity(user_id)
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(0,128,192,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 7%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 15px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: "..identity.name.." "..identity.firstname)
		SetTimeout(30000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- PRISÃO
--------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local player = vRP.getUserSource(parseInt(user_id))
	if player then
		SetTimeout(30000,function()
			local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
			local tempo = json.decode(value) or 0

			if tempo == -1 then
				return
			end

			if tempo > 0 then
				TriggerClientEvent('prisioneiro',player,true)
				vRPclient.teleport(player,1680.1,2513.0,46.5)
				prison_lock(parseInt(user_id))
			end
		end)
	end
end)

function prison_lock(target_id)
	local player = vRP.getUserSource(parseInt(target_id))
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente.")
			end
			vRPclient.killGod(player)
		end)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMINUIR PENA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("diminuirpena")
AddEventHandler("diminuirpena",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
	local tempo = json.decode(value) or 0
	if tempo >= 5 then
		vRP.setUData(parseInt(user_id),"vRP:prisao",json.encode(parseInt(tempo)-2))
		TriggerClientEvent("Notify",source,"importante","Sua pena foi reduzida em <b>2 meses</b>, continue o trabalho.")
	else
		TriggerClientEvent("Notify",source,"importante","Atingiu o limite da redução de pena, não precisa mais trabalhar.")
	end
end)
RegisterServerEvent("vrp_carta")
AddEventHandler("vrp_carta",function()
    local source = source
	local user_id = vRP.getUserId(source)
    local ins = vRP.getUsersByPermission("instrutor.permissao")
	
    if vRP.hasGroup(user_id, "Carta") then
		TriggerClientEvent("Notify",user_id,"negado","Voçe ja tem carta.")
	else
        if parseInt(#ins) >= 1 then
            TriggerClientEvent('chatMessage',user_id,"ALERTA",{255,0,0},"instrutor em serviço: "..#ins)        
        else
           local sdasdasdas = vRP.request(source,"Deseja comprar carta por $ 3.000",60)
	       if sdasdasdas then
	            if vRP.tryPayment(user_id, 3000) then
			        vRP.addUserGroup(user_id,"Carta")
				    TriggerClientEvent('chatMessage',source,"Aviso",{4,0,0},"Compra efetuada com sucesso .")  
			    else
				    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
			    end
		    end      
        end
	end
end)
RegisterServerEvent("vrp_porte")
AddEventHandler("vrp_porte",function()
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasGroup(user_id, "Porte") then
		TriggerClientEvent("Notify",source,"negado","Voçe ja tem porte de arma.")
	else 
	
        local dasdasdasda = vRP.request(source,"Deseja comprar porte de arma por $ 15.000",60)
	    if dasdasdasda then
	        if vRP.tryPayment(user_id, 15000) then
			    vRP.addUserGroup(user_id,"Porte")
		        TriggerClientEvent('chatMessage',user_id,"Aviso",{4,0,0},"Compra efetuada com sucesso .")  
		    else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
	    end   
    end		
end)
--[[
RegisterServerEvent("vrp_slot2")
AddEventHandler("vrp_slot2",function()
    local source = source
	local user_id = vRP.getUserId(source)
	
	if not vRP.hasGroup(user_id,"2") and not vRP.hasGroup(user_id,"3")and not vRP.hasGroup(user_id,"4")and  not vRP.hasGroup(user_id,"5") and not vRP.hasGroup(user_id,"6")
	and not vRP.hasGroup(user_id,"7") and not vRP.hasGroup(user_id,"8")and not vRP.hasGroup(user_id,"9")and not vRP.hasGroup(user_id,"10") and not vRP.hasGroup(user_id,"11") 
	and not vRP.hasGroup(user_id,"12") and not vRP.hasGroup(user_id,"13")and not vRP.hasGroup(user_id,"14")and not vRP.hasGroup(user_id,"15") and not vRP.hasGroup(user_id,"16")then
		local dasdasdasda = vRP.request(source,"Deseja comprar vaga(2) por $ 5.000",60)
	    if dasdasdasda then
		    if vRP.tryPayment(user_id, 5000) then
	            vRP.addUserGroup(user_id, "2")
		        TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
	    end
	end
	
	if vRP.hasGroup(user_id,"2") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(3) por $ 5.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 5000) then
	            vRP.addUserGroup(user_id, "3")
				vRP.removeUserGroup(user_id,"4")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"3") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(4) por $ 15.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 15000) then
	            vRP.addUserGroup(user_id, "4")
		        vRP.removeUserGroup(user_id,"3")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"4") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(5) por $ 25.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 25000) then
	            vRP.addUserGroup(user_id, "5")
		        vRP.removeUserGroup(user_id,"4")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"5") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(6) por $ 35.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 35000) then
	            vRP.addUserGroup(user_id, "6")
		        vRP.removeUserGroup(user_id,"5")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"6") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(7) por $ 45.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 45000) then
	            vRP.addUserGroup(user_id, "7")
		        vRP.removeUserGroup(user_id,"6")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"7") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(8) por $ 55.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 55000) then
	            vRP.addUserGroup(user_id, "8")
		        vRP.removeUserGroup(user_id,"7")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"8") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(9) por $ 65.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 65000) then
	            vRP.addUserGroup(user_id, "9")
		        vRP.removeUserGroup(user_id,"8")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"9") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(10) por $ 75.000",60)
		if a1 then
		    if vRP.tryPayment(user_id, 75000) then
	            vRP.addUserGroup(user_id, "10")
		        vRP.removeUserGroup(user_id,"9")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"10") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(10) por  1.000 vales",60)
		if a1 then
		    if vRP.tryGetInventoryItem(user_id,"vale", 1000,true) then
	            vRP.addUserGroup(user_id, "11")
		        vRP.removeUserGroup(user_id,"10")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"11") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(10) por  1.000 vales",60)
		if a1 then
		    if vRP.tryGetInventoryItem(user_id,"vale", 1000,true) then
	            vRP.addUserGroup(user_id, "12")
		        vRP.removeUserGroup(user_id,"11")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"12") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(10) por  1.000 vales",60)
		if a1 then
		    if vRP.tryGetInventoryItem(user_id,"vale", 1000,true) then
	            vRP.addUserGroup(user_id, "13")
		        vRP.removeUserGroup(user_id,"12")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"13") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(10) por  1.000 vales",60)
		if a1 then
		    if vRP.tryGetInventoryItem(user_id,"vale", 1000,true) then
	            vRP.addUserGroup(user_id, "14")
		        vRP.removeUserGroup(user_id,"13")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"14") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(10) por  1.000 vales",60)
		if a1 then
		    if vRP.tryGetInventoryItem(user_id,"vale", 1000,true) then
	            vRP.addUserGroup(user_id, "15")
		        vRP.removeUserGroup(user_id,"14")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"15") then
	    local a1 = vRP.request(source,"Deseja comprar vaga(10) por  1.000 vales",60)
		if a1 then
		    if vRP.tryGetInventoryItem(user_id,"vale", 1000,true) then
	            vRP.addUserGroup(user_id, "16")
		        vRP.removeUserGroup(user_id,"15")
				TriggerClientEvent("Notify",source,"importante","Compra efetuada com sucesso .")
			else
			    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		    end
		end
	end
	if vRP.hasGroup(user_id,"16") then
	    TriggerClientEvent("Notify",source,"negado","Limite atingido.")
	end
end)
]]

---------------------------------------------------------------------------------------------------------------------------
--PROMOVER PM
---------------------------------------------------------------------------------------------------------------------------



RegisterCommand('promoverpm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"coronel.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			if vRP.hasGroup(parseInt(args[1]), "recruta") or vRP.hasGroup(parseInt(args[1]), "paisanarecruta")then
			    vRP.addUserGroup(parseInt(args[1]),"soldado")
				vRP.removeUserGroup(parseInt(args[1]),"recruta")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." foi promovido a soldado! Parabéns!. ```"
				SendWebhookMessage(webhookvindo,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "soldado") or vRP.hasGroup(parseInt(args[1]), "paisanasoldado")then
			    vRP.addUserGroup(parseInt(args[1]),"cabo")
				vRP.removeUserGroup(parseInt(args[1]),"soldado")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." foi promovido a cabo! Parabéns!. ```"
				SendWebhookMessage(webhookvindo,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "cabo") or vRP.hasGroup(parseInt(args[1]), "paisanacabo")then
			    vRP.addUserGroup(parseInt(args[1]),"sargento")
				vRP.removeUserGroup(parseInt(args[1]),"cabo")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." foi promovido a sargento! Parabéns!. ```"
				SendWebhookMessage(webhookvindo,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "sargento") or vRP.hasGroup(parseInt(args[1]), "paisanasargento")then
			    vRP.addUserGroup(parseInt(args[1]),"tenente")
				vRP.removeUserGroup(parseInt(args[1]),"sargento")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." foi promovido a tenente! Parabéns!. ```"
				SendWebhookMessage(webhookvindo,msg)
                
			elseif vRP.hasGroup(parseInt(args[1]), "tenente") or vRP.hasGroup(parseInt(args[1]), "paisanatenente")then
			    vRP.addUserGroup(parseInt(args[1]),"capitao")
				vRP.removeUserGroup(parseInt(args[1]),"tenente")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." foi promovido a capitão! Parabéns!. ```"
				SendWebhookMessage(webhookvindo,msg)
                
			elseif vRP.hasGroup(parseInt(args[1]), "capitao") or vRP.hasGroup(parseInt(args[1]), "paisanacapitao")then
			    vRP.addUserGroup(parseInt(args[1]),"major")
				vRP.removeUserGroup(parseInt(args[1]),"capitao")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." foi promovido a major! Parabéns!. ```"
				SendWebhookMessage(webhookvindo,msg)
                
			elseif vRP.hasGroup(parseInt(args[1]), "major") or vRP.hasGroup(parseInt(args[1]), "paisanamajor")then
			    vRP.addUserGroup(parseInt(args[1]),"coronel")
				vRP.removeUserGroup(parseInt(args[1]),"major")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				local msg = "```[Policia Militar] Policial "..identity.name.." "..identity.firstname.." foi promovido a coronel! Parabéns!. ```"
				SendWebhookMessage(webhookvindo,msg)
                
			elseif vRP.hasGroup(parseInt(args[1]), "coronel") or vRP.hasGroup(parseInt(args[1]), "paisanacoronel")then
			    vRP.addUserGroup(parseInt(args[1]),"recruta")
				vRP.removeUserGroup(parseInt(args[1]),"coronel")
				TriggerClientEvent("Notify",source,"aviso","PM promovido")
				
                
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)



---------------------------------------------------------------------------------------------------------------------------
--PROMOVER SAMU
---------------------------------------------------------------------------------------------------------------------------



RegisterCommand('promoversamu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"diretor.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			if vRP.hasGroup(parseInt(args[1]), "paramedico") or vRP.hasGroup(parseInt(args[1]), "paisanaparamedico")then
			    vRP.addUserGroup(parseInt(args[1]),"enfermeiro")
				vRP.removeUserGroup(parseInt(args[1]),"paramedico")
				TriggerClientEvent("Notify",source,"aviso","SAMU promovido")
				local msg = "```[SAMU] Paramédico "..identity.name.." "..identity.firstname.." foi promovido a enfermeiro! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "enfermeiro") or vRP.hasGroup(parseInt(args[1]), "paisanaenfermeiro")then
			    vRP.addUserGroup(parseInt(args[1]),"medicogeral")
				vRP.removeUserGroup(parseInt(args[1]),"enfermeiro")
				TriggerClientEvent("Notify",source,"aviso","SAMU promovido")
				local msg = "```[SAMU] Paramédico "..identity.name.." "..identity.firstname.." foi promovido a médico geral! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "medicogeral") or vRP.hasGroup(parseInt(args[1]), "paisanamedicogeral")then
			    vRP.addUserGroup(parseInt(args[1]),"cirurgiao")
				vRP.removeUserGroup(parseInt(args[1]),"medicogeral")
				TriggerClientEvent("Notify",source,"aviso","SAMUM promovido")
				local msg = "```[SAMU] Paramédico "..identity.name.." "..identity.firstname.." foi promovido a cirurgião! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "cirurgiao") or vRP.hasGroup(parseInt(args[1]), "paisanacirurgiao")then
			    vRP.addUserGroup(parseInt(args[1]),"diretor")
				vRP.removeUserGroup(parseInt(args[1]),"cirurgiao")
				TriggerClientEvent("Notify",source,"aviso","SAMU promovido")
				local msg = "```[SAMU] Paramédico "..identity.name.." "..identity.firstname.." foi promovido a diretor! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
                
			elseif vRP.hasGroup(parseInt(args[1]), "diretor") or vRP.hasGroup(parseInt(args[1]), "paisanadiretor")then
			    vRP.addUserGroup(parseInt(args[1]),"paramedico")
				vRP.removeUserGroup(parseInt(args[1]),"diretor")
				TriggerClientEvent("Notify",source,"aviso","SAMU promovido")
				local msg = "```[SAMU] Paramédico "..identity.name.." "..identity.firstname.." foi rebaixado a paramédico! :( . ```"
				SendWebhookMessage(webhooksamuprov,msg)
                
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)



---------------------------------------------------------------------------------------------------------------------------
--PROMOVER MEC
---------------------------------------------------------------------------------------------------------------------------


RegisterCommand('promovermec',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"engenheiro.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			if vRP.hasGroup(parseInt(args[1]), "aprendiz") or vRP.hasGroup(parseInt(args[1]), "paisanaaprendiz")then
			    vRP.addUserGroup(parseInt(args[1]),"borracheiro")
				vRP.removeUserGroup(parseInt(args[1]),"aprendiz")
				TriggerClientEvent("Notify",source,"aviso","mecanico promovido")
				local msg = "```[MEC] Mecânico "..identity.name.." "..identity.firstname.." foi promovido a borracheiro! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "borracheiro") or vRP.hasGroup(parseInt(args[1]), "paisanaborracheiro")then
			    vRP.addUserGroup(parseInt(args[1]),"mecanicoo")
				vRP.removeUserGroup(parseInt(args[1]),"borracheiro")
				TriggerClientEvent("Notify",source,"aviso","mecanico promovido")
				local msg = "```[MEC] Mecânico "..identity.name.." "..identity.firstname.." foi promovido a borracheiro! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "mecanicoo") or vRP.hasGroup(parseInt(args[1]), "paisanamecanicoo")then
			    vRP.addUserGroup(parseInt(args[1]),"engenheiro")
				vRP.removeUserGroup(parseInt(args[1]),"mecanicoo")
				TriggerClientEvent("Notify",source,"aviso","mecanico promovido")
				local msg = "```[MEC] Mecânico "..identity.name.." "..identity.firstname.." foi promovido a borracheiro! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
			
			elseif vRP.hasGroup(parseInt(args[1]), "engenheiro") or vRP.hasGroup(parseInt(args[1]), "paisanaengenheiro")then
			    vRP.addUserGroup(parseInt(args[1]),"aprendiz")
				vRP.removeUserGroup(parseInt(args[1]),"engenheiro")
				TriggerClientEvent("Notify",source,"aviso","mecanico promovido")
				local msg = "```[MEC] Mecânico "..identity.name.." "..identity.firstname.." foi promovido a borracheiro! Parabéns!. ```"
				SendWebhookMessage(webhooksamuprov,msg)
                
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)