local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local idgens = Tools.newIDGenerator()

local cfg = module("vrp","cfg/groups")
local groups = cfg.groups


local webhookadm = "https://discordapp.com/api/webhooks/760658781121413159/W4CU1GP8qmD0K4LSFgoFwW_WWcou8S8f3oRKQl1p9xDmntOXGObKJryVG9Gr4u1Pz1ND"
local webhookcopom = "https://discordapp.com/api/webhooks/760658922432102460/EYf7fUCKHYlB8I4Mm6EkPEwYh-zuoLypWqQFf6dfkXbQczSmu1IM9TxmDnLoYl61WOly"
local webhookins = "https://discordapp.com/api/webhooks/760659242553835530/fnFX5SfDBiVNYqWfhgzPiAiLgCo3Fn-w_tO1bqhC5RUNdZbpBwKrYtJ3JCbiuuLcCay2"

local webponto = "https://discordapp.com/api/webhooks/760659318457892875/5P7qGzuWKwX5FZuK-nYY9LQ-jcj3F45NK4TIMs187fj-sc1gx4gmsH5N6HVs2HyrbG_g"
local webhookwl = "https://discordapp.com/api/webhooks/760659428704780349/y91ey8cRKft5bFWf7KC3c2ckIxwqkSs0ZAfJEQBXeZIqt-CipLp7ND5_3EaphQ7R_JO7"

local webhookcds = "https://discordapp.com/api/webhooks/760659538231164979/2k9Dfz2-Ig2tDuDDSrn2MvHE2NiT-nqn_W1dWGsVJFW_wQG6MHdjyozvWZ-c1VTaMAE4"



function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- admin
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('a',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "wl.permissao"
		if vRP.hasPermission(user_id,permission) then
			local admins = vRP.getUsersByPermission(permission)
			for l,w in pairs(admins) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname.."  ("..identity.user_id..")",{230,200,9},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)

local admin = {}
RegisterCommand('relato',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)	
	local identity = vRP.getUserIdentity(user_id)
	local uplayer = vRP.getUserSource(user_id)	
	TriggerClientEvent('chatMessage',source, identity.name.." "..identity.firstname.."  ("..identity.user_id..")",{189,178,108},rawCommand:sub(7))
			local admins = vRP.getUsersByPermission("wl.permissao")
			for l,w in pairs(admins) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						TriggerClientEvent('chatMessage',player, identity.name.." "..identity.firstname.."  ("..identity.user_id..")",{189,178,108},rawCommand:sub(7))
					end)
				end
			end
end)

RegisterCommand('mp',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)	
	local identity = vRP.getUserIdentity(user_id)
	local dest = vRP.getUserSource(parseInt(args[1]))	
	local destid = parseInt(args[1])
	local mensagem = ""
	
	for i=1, #args, 1 do
	if i > 1 then mensagem = mensagem .. ' '
	mensagem = mensagem .. args[i]
	end
	end
	if vRP.hasPermission(user_id,"wl.permissao") then
--	TriggerClientEvent('chatMessage', dest, mensagem,{3,190,252})
		TriggerClientEvent('chatMessage',dest,identity.name.." "..identity.firstname.."  ("..identity.user_id.."): " ..mensagem,{236,252,3})
		TriggerClientEvent('chatMessage',source," Para "..destid..": " ..mensagem,{236,252,3})
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- anuncioadm
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ann',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "admin.permissao"
		if vRP.hasPermission(user_id,permission) then
			TriggerClientEvent('chatMessage',-1,identity.name.." "..identity.firstname.."  ("..identity.user_id..")",{255,0,0},rawCommand:sub(4))
		end
	end
end)

RegisterCommand('desbugarnome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if identity.name == "" and identity.firstname == "" then
	
	    local nome = vRP.prompt(source, "Digite seu primeiro nome:(EX: Maurilio)", "")
	    local firstname = vRP.prompt(source, "Digite seu segundo nome:(EX: Moraes)", "")
        local idade = vRP.prompt(source, "Digite sua ideade: (EX: 26)", "")
		
		vRP.execute("vRP/update_user_identity",{ user_id = user_id, firstname = firstname, name = nome, age = idade, registration = identity.registration, phone = identity.phone })
        TriggerClientEvent("Notify",source,"sucesso","Nome Corrigido.")  
		
		local msg = "```[ADMINISTRAÇÃO] ID:"..user_id.." arrumou seu nome para "..nome.." "..firstname.." com idade de "..idade.." ! ```"
        SendWebhookMessage(webdebugar,msg)
	else
	    TriggerClientEvent("Notify",source,"sucesso","Seu nome não esta bugado!")
	end
end)
RegisterCommand('rename',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "owner.permissao") then
        local idjogador = vRP.prompt(source, "PASSAPORTE: ", "")
        local nome = vRP.prompt(source, "NOVO NOME: ", "")
        local firstname = vRP.prompt(source, "NOVO SOBRENOME: ", "")
        local idade = vRP.prompt(source, "NOVA IDADE: ", "")
        local nplayer = vRP.getUserSource(parseInt(idjogador))

        if nplayer then

            local identity = vRP.getUserIdentity(parseInt(idjogador))
            if idjogador == "" or nome == "" or firstname == "" or idade == "" then
                   return
               else
                vRP.execute("vRP/update_user_identity",{ user_id = idjogador, firstname = firstname, name = nome, age = idade, registration = identity.registration, phone = identity.phone })
                TriggerClientEvent("Notify",nplayer,"sucesso","Identidade atualizada!")
                TriggerClientEvent("Notify",source,"sucesso","Identidade do ID: <b>"..parseInt(idjogador).."</b> alterada com sucesso!")
            end

        else
            TriggerClientEvent("Notify",source,"negado","O ID: <b>"..parseInt(idjogador).."</b> n�o est� na cidade!")
        end        
    else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end   
end)
RegisterCommand('dv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	
	if vRP.hasPermission(user_id,"suporte.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('deletarveiculo',source,vehicle)
			local msg = "```[ADMINISTRAÇÃO] ["..source.."]["..user_id.."] "..identity.name.." "..identity.firstname.." deletou um veículo .```"
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end 
end)
RegisterServerEvent("trydeleteveh")
AddEventHandler("trydeleteveh",function(index)
	TriggerClientEvent("syncdeleteveh",-1,index)
end)
RegisterServerEvent("trydeleteped")
AddEventHandler("trydeleteped",function(index)
	TriggerClientEvent("syncdeleteped",-1,index)
end)
RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
	TriggerClientEvent("syncdeleteobj",-1,index)
end)

RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"supervisor.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('reparar',source,vehicle)
			
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." reparou um veículo .```"
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('limparea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		TriggerClientEvent("syncarea",-1,x,y,z)
		local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." limpou area .```"
        SendWebhookMessage(webhookadm,msg)
		
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('god',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			local identity44 = vRP.getUserIdentity(parseInt(args[1]))
			if nplayer then
				vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer, 400)
				local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." deu vida para ["..parseInt(args[1]).."]"..identity44.name.." "..identity44.firstname.." .```"
                SendWebhookMessage(webhookadm,msg)
			end
		else
			vRPclient.killGod(source)
			vRPclient.setHealth(source, 400)
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." recuperou sua vida .```"
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"supervisor.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('vehash',source,vehicle)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"owner.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('vehtuning',source,vehicle)
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." tuning is vehicle .```"
            SendWebhookMessage(webhookadm,msg)
		end
	end
end)

RegisterCommand('wl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"wl.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			vRP.setWhitelisted(parseInt(args[1]),true)
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." liberou whitlist do ID:"..parseInt(args[1]).."  .```"
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			vRP.setWhitelisted(parseInt(args[1]),false)
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." bloqueou whitlist do ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```"
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('kick',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao")  then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then
				local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." kickou o ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```"
                SendWebhookMessage(webhookadm,msg)
				TriggerClientEvent("Notify","aviso",-1,"[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." kickou o ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname..".")
				vRP.kick(id,"Você foi expulso da cidade.")
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('ban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." baniu o ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```"
            SendWebhookMessage(webhookadm,msg)
			
			TriggerClientEvent("Notify","aviso",-1,"[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." baniu o ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .")
			
			vRP.setBanned(parseInt(args[1]),true)
			
			vRP.kick(args[1],"Você foi banido da cidade.")
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),false)
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." desbaniu o ID "..args[1].." .```"
            SendWebhookMessage(webhookadm,msg)
			TriggerClientEvent("Notify","aviso",-1,"[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." desbaniu o ID "..args[1].." .")
			
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"owner.permissao") then
	
	    if parseInt(args[1]) >= 1 and parseInt(args[1]) <= 10000 then
	        vRP.giveMoney(user_id,parseInt(args[1]))
	        local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." tentou abusar de comando e pegar R$"..args[1].." .```"
            SendWebhookMessage(webhookadm,msg)
			
		    TriggerClientEvent("Notify","aviso",-1,"[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." tentou abusar de comando e pegar R$"..args[1].." .")
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('mone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"owner.permissao") then
	
	    vRP.giveMoney(user_id,parseInt(args[1]))
	    local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." tentou abusar de comando e pegar R$"..args[1].." .```"
        SendWebhookMessage(webhookadm,msg)
			
		TriggerClientEvent("Notify","aviso",-1,"[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." tentou abusar de comando e pegar R$"..args[1].." .")

	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"suporte.permissao") then
	
		vRPclient.toggleNoclip(source)
		
		local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." Ativou/Desativou NoClip```"
        SendWebhookMessage(webhookadm,msg)
		
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"supervisor.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"supervisor.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:",x..","..y..","..z)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)


RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao", "comandante.permissao") then
	
		if args[1] and args[2] then
		
		    local identity44 = vRP.getUserIdentity(args[1])
			vRP.addUserGroup(parseInt(args[1]),args[2])
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." setou "..args[2].." para "..identity44.name.." "..identity44.firstname.." .```" 
            SendWebhookMessage(webhookadm,msg)
			
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('ungroup',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('trazer',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then
				vRPclient.teleport(tplayer,x,y,z)
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('ir',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao")  then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then
				vRPclient.teleport(tplayer,x,y,z)
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('cobject',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"owner.permissao") then
		TriggerClientEvent('cobject',source,args[1],args[2])
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		TriggerClientEvent('tptoway',source)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"owner.permissao") then
		if args[1] then
			TriggerClientEvent('spawnarveiculo',source,args[1])
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"supervisor.permissao") then
		TriggerClientEvent('delnpcs',source)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('adm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(0,0,0,0.4); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
		SetTimeout(60000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('tpall', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"owner.permissao") then
        local rusers = vRP.getUsers()
        for k,v in pairs(rusers) do
            local rsource = vRP.getUserSource(k)
            if rsource ~= source then
                vRPclient.teleport(rsource,x,y,z)
				local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." puxou todos até ele .```"
                SendWebhookMessage(webhookadm,msg)
            end
        end
    else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('reall', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"owner.permissao") then
        local rusers = vRP.getUsers()
        for k,v in pairs(rusers) do
            local rsource = vRP.getUserSource(k)
            vRPclient.setHealth(rsource, 200)
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." deu vida a todos online .```"
            SendWebhookMessage(webhookadm,msg)
        end
    else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('convidar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local id = vRP.getUserSource(parseInt(args[1]))
	if id then
	    if vRP.hasPermission(user_id,"azul.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local aok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para MotoClub , deseja aceitar ?",60)
		    if aok then
				vRP.addUserGroup(parseInt(args[1]),"Motoclub")
			end
		end
		if vRP.hasPermission(user_id,"motoclub.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local aok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para MotoClub , deseja aceitar ?",60)
		    if aok then
				vRP.addUserGroup(parseInt(args[1]),"Motoclub")
			end
		end
		if vRP.hasPermission(user_id,"vermelhos.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local bok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para P.C.C , deseja aceitar ?",60)
		    if bok then
	            vRP.addUserGroup(parseInt(args[1]),"P.C.C")
			end
		end
		if vRP.hasPermission(user_id,"azul.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local cok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Azul , deseja aceitar ?",60)
		    if cok then
	            vRP.addUserGroup(parseInt(args[1]),"Azul")
			end
		end
		if vRP.hasPermission(user_id,"amarelos.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local dok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para T.C.P , deseja aceitar ?",60)
		    if dok then
	            vRP.addUserGroup(parseInt(args[1]),"T.C.P")
			end
		end
		if vRP.hasPermission(user_id,"verdes.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local eok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Vermelhos , deseja aceitar ?",60)
		    if eok then
	            vRP.addUserGroup(parseInt(args[1]),"Vermelhos")
			end
		end
		if vRP.hasPermission(user_id,"roxos.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local fok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para A.D.A , deseja aceitar ?",60)
		    if fok then
	            vRP.addUserGroup(parseInt(args[1]),"A.D.A")
			end
		end
		if vRP.hasPermission(user_id,"mafia.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local gok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Mafia , deseja aceitar ?",60)
		    if gok then
	            vRP.addUserGroup(parseInt(args[1]),"Mafia")
			end
		end
		if vRP.hasPermission(user_id,"milicia.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local gok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Milicia , deseja aceitar ?",60)
		    if gok then
	            vRP.addUserGroup(parseInt(args[1]),"Milicia")
			end
		end
		if vRP.hasPermission(user_id,"yakuza.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local hok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Yakuza , deseja aceitar ?",60)
		    if hok then
	            vRP.addUserGroup(parseInt(args[1]),"Yakuza")
			end
		end
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(parseInt(args[1]),"recruta")
			end
		end
		if vRP.hasPermission(user_id,"rota.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para ROTA , deseja aceitar ?",60)
		    if ok then
	            vRP.addUserGroup(parseInt(args[1]),"ROTA")
			end
		end
		if vRP.hasPermission(user_id,"paramedico.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Medico , deseja aceitar ?",60)
		    if ok then
	            vRP.addUserGroup(parseInt(args[1]),"Paramedico")
			end
		end
		if vRP.hasPermission(user_id,"benny.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Bennys , deseja aceitar ?",60)
		    if ok then
	            vRP.addUserGroup(parseInt(args[1]),"Bennys")
			end
		end
		if vRP.hasPermission(user_id,"vanilla.permissao") and vRP.hasGroup(user_id, "Lider")then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Vanilla , deseja aceitar ?",60)
		    if ok then
	            vRP.addUserGroup(parseInt(args[1]),"Vanilla")
			end
		end
	end
end)
RegisterCommand('retirar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if args[1] and args[1] ~= user_id then
		if vRP.hasPermission(user_id,"azul.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"Motoclub")
		end
	    if vRP.hasPermission(user_id,"motoclub.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"Motoclub")
		end
		if vRP.hasPermission(user_id,"vermelhos.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"P.C.C")
		end
		if vRP.hasPermission(user_id,"azul.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"Azul")
		end
		if vRP.hasPermission(user_id,"amarelos.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"T.C.P")
		end
		if vRP.hasPermission(user_id,"verdes.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"Vermelhos")
		end
		if vRP.hasPermission(user_id,"roxos.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"A.D.A")
		end
		if vRP.hasPermission(user_id,"mafia.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"Mafia")
		end
		if vRP.hasPermission(user_id,"pm.permissao") and vRP.hasGroup(user_id, "Lider")then
			vRP.removeUserGroup(parseInt(args[1]),"Policia")
		end
		if vRP.hasPermission(user_id,"rota.permissao") and vRP.hasGroup(user_id, "Lider")then
		    vRP.removeUserGroup(parseInt(args[1]),"ROTA")
		end
		if vRP.hasPermission(user_id,"vanilla.permissao") and vRP.hasGroup(user_id, "Lider")then
		    vRP.removeUserGroup(parseInt(args[1]),"Vanilla")
		end
		if vRP.hasPermission(user_id,"yakuza.permissao") and vRP.hasGroup(user_id, "Lider")then
		    vRP.removeUserGroup(parseInt(args[1]),"Yakuza")
		end
		if vRP.hasPermission(user_id,"milicia.permissao") and vRP.hasGroup(user_id, "Lider")then
		    vRP.removeUserGroup(parseInt(args[1]),"Milicia")
		end
		if vRP.hasPermission(user_id,"paramedico.permissao") and vRP.hasGroup(user_id, "Lider")then
		    vRP.removeUserGroup(parseInt(args[1]),"Paramedico")
		end
		if vRP.hasPermission(user_id,"benny.permissao") and vRP.hasGroup(user_id, "Lider")then
		    vRP.removeUserGroup(parseInt(args[1]),"Bennys")
		end
		if vRP.hasPermission(user_id,"milicia.permissao") and vRP.hasGroup(user_id, "Lider")then
		    vRP.removeUserGroup(parseInt(args[1]),"Bennys")
		end
	end
end)

RegisterCommand('darlider',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"supervisor.permissao") then
		if args[1] and args[2] then
		    local identity44 = vRP.getUserIdentity(args[1])
			vRP.addUserGroup(parseInt(args[1]),args[2])
			vRP.addUserGroup(parseInt(args[1]),"Lider")
			
			TriggerClientEvent('chatMessage',-1,"^7[ADMINISTRAÇÃO] Admin ^9"..identity.name.." "..identity.firstname.."^7 setou lider de ^9"..args[2].."^7 para ^9["..args[1].."]"..identity44.name.." "..identity44.firstname.." ^7.")
			
			local msg = "```[ADMINISTRAÇÃO] Admin ["..user_id.."] "..identity.name.." "..identity.firstname.." setou lider de "..args[2].." para ["..args[1]"]"..identity44.name.." "..identity44.firstname.." .```" 
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('tirarlider',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"dono.permissao") then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])
			vRP.removeUserGroup(parseInt(args[1]),"Lider")
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('tirarcnh',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"instrutor.permissao") then
		if args[1] then
			vRP.removeUserGroup(parseInt(args[1]),"Carta")
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('tirarporte',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		if args[1] then
			vRP.removeUserGroup(parseInt(args[1]),"Porte")
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)

RegisterCommand('cnh',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"instrutor.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			vRP.addUserGroup(parseInt(args[1]),"Carta")
			local msg = "```[CARTA] Instrutor ["..user_id.."] "..identity.name.." "..identity.firstname.." deu CNH para "..identity44.name.." "..identity44.firstname.." .```" 
            SendWebhookMessage(webhookins,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('porte',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"policia.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			vRP.addUserGroup(parseInt(args[1]),"Porte")
			local msg = "```[PORTE] Policial ["..user_id.."] "..identity.name.." "..identity.firstname.." deu porte de armas para "..identity44.name.." "..identity44.firstname.." .```" 
            SendWebhookMessage(webhookcopom,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('convidaradmin',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"owner.permissao") then
	    local id = vRP.getUserSource(parseInt(args[1]))
		if args[1] then
			if id then
	        local ok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para ser administrador , deseja aceitar ?",60)
			if ok then
		        local identity44 = vRP.getUserIdentity(args[1])
			    vRP.addUserGroup(parseInt(args[1]),"suporte")
			    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." setou suporte para ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```" 
                SendWebhookMessage(webhookadm,msg)
			    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." setou suporte para ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .")
		    end
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('promoveradmin',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"owner.permissao") then
		if args[1] then
		    local identity44 = vRP.getUserIdentity(args[1])
			if vRP.hasGroup(parseInt(args[1]), "suporte") or vRP.hasGroup(parseInt(args[1]), "suportepaisana")then
			    vRP.addUserGroup(parseInt(args[1]),"moderador")
				vRP.removeUserGroup(parseInt(args[1]),"suporte")
			    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a moderador ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```" 
                SendWebhookMessage(webhookadm,msg)
				TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a moderador ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .")
			
			elseif vRP.hasGroup(parseInt(args[1]), "moderador") or vRP.hasGroup(parseInt(args[1]), "moderadorpaisana")then
			    vRP.addUserGroup(parseInt(args[1]),"administrador")
				vRP.removeUserGroup(parseInt(args[1]),"moderador")
			    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a administrador ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```" 
                SendWebhookMessage(webhookadm,msg)
				TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a administrador ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .")
			
			elseif vRP.hasGroup(parseInt(args[1]), "administrador") or vRP.hasGroup(parseInt(args[1]), "administradorpaisana")then
			    vRP.addUserGroup(parseInt(args[1]),"dsupervisor")
				vRP.removeUserGroup(parseInt(args[1]),"administrador")
			    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a supervisor ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```" 
                SendWebhookMessage(webhookadm,msg)
				TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a supervisor ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .")
			
			elseif vRP.hasGroup(parseInt(args[1]), "dsupervisor") or vRP.hasGroup(parseInt(args[1]), "dsupervisorpaisana")then
			    vRP.addUserGroup(parseInt(args[1]),"dono")
				vRP.removeUserGroup(parseInt(args[1]),"dsupervisor")
			    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a dono ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .```" 
                SendWebhookMessage(webhookadm,msg)
				TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." promoveu a dono ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." .")
			end
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('removeradmin',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"owner.permissao") then
		if args[1] then
		   local identity44 = vRP.getUserIdentity(parseInt(args[1]))
		   
		   vRP.removeUserGroup(parseInt(args[1]),"suporte")
		   vRP.removeUserGroup(parseInt(args[1]),"moderador")
		   vRP.removeUserGroup(parseInt(args[1]),"administrador")
		   vRP.removeUserGroup(parseInt(args[1]),"dsupervisor")
		   vRP.removeUserGroup(parseInt(args[1]),"dono")
		   
		   local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." removeu ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." da staff .```" 
           SendWebhookMessage(webhookadm,msg)
		   TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." removeu ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." da administração.")
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('atendimentos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	------------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "dono") then
	    vRP.addUserGroup(user_id,"donopaisana")
		vRP.removeUserGroup(user_id,"dono")
		
		local msg = "```[ADMINISTRAÇÃO] Dono ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Dono ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento.")
		
	elseif vRP.hasGroup(user_id, "donopaisana") then
	    vRP.addUserGroup(user_id,"dono")
		vRP.removeUserGroup(user_id,"donopaisana")
		
		local msg = "```[ADMINISTRAÇÃO] Dono ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Dono ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento.")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "dsupervisor") then
	    vRP.addUserGroup(user_id,"dsupervisorpaisana")
		vRP.removeUserGroup(user_id,"dsupervisor")
		
		local msg = "```[ADMINISTRAÇÃO] Supervisor ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Supervisor ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento.")
		
	elseif vRP.hasGroup(user_id, "dsupervisorpaisana") then
	    vRP.addUserGroup(user_id,"dsupervisor")
		vRP.removeUserGroup(user_id,"dsupervisorpaisana")
		
		local msg = "```[ADMINISTRAÇÃO] Supervisor ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Supervisor ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento.")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "administrador") then
	    vRP.addUserGroup(user_id,"administradorpaisana")
		vRP.removeUserGroup(user_id,"administrador")
		
		local msg = "```[ADMINISTRAÇÃO] Administrador ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Administrador ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento.")
		
	elseif vRP.hasGroup(user_id, "administradorpaisana") then
	    vRP.addUserGroup(user_id,"administrador")
		vRP.removeUserGroup(user_id,"administradorpaisana")
		
		local msg = "```[ADMINISTRAÇÃO] Administrador ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Administrador ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento.")
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "moderador") then
	    vRP.addUserGroup(user_id,"moderadorpaisana")
		vRP.removeUserGroup(user_id,"moderador")
		
		local msg = "```[ADMINISTRAÇÃO] Moderador ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Moderador ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento.")
		
	elseif vRP.hasGroup(user_id, "moderadorpaisana") then
	    vRP.addUserGroup(user_id,"moderador")
		vRP.removeUserGroup(user_id,"moderadorpaisana")
		
		local msg = "```[ADMINISTRAÇÃO] Moderador ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Moderador ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento.")
	end	
	-----------------------------------------------------------------------------------------------------------------------------------------
	if vRP.hasGroup(user_id, "suporte") then
	    vRP.addUserGroup(user_id,"suportepaisana")
		vRP.removeUserGroup(user_id,"suporte")
		
		local msg = "```[ADMINISTRAÇÃO] Suporte ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Suporte ["..user_id.."] "..identity.name.." "..identity.firstname.." terminou atendimento.")
		
	elseif vRP.hasGroup(user_id, "suportepaisana") then
	    vRP.addUserGroup(user_id,"suporte")
		vRP.removeUserGroup(user_id,"suportepaisana")
		
		local msg = "```[ADMINISTRAÇÃO] Suporte ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento . ```" 
        SendWebhookMessage(webponto,msg)
	    TriggerClientEvent('chatMessage',-1,"[ADMINISTRAÇÃO] Suporte ["..user_id.."] "..identity.name.." "..identity.firstname.." iniciou atendimento.")
	end	
	
end)	
RegisterCommand('darvale',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if args[1] and args[2] then
	    if vRP.hasPermission(user_id,"owner.permissao") then
	        TriggerClientEvent("Notify",source,"sucesso","Voçê deu vale para um jogador")
	        TriggerClientEvent("Notify",args[1],"sucesso","Voçê recebeu vale de um jogador")
		    vRP.giveInventoryItem(parseInt(args[1]),"vale",parseInt(args[2]))
		
		    local identity44 = vRP.getUserIdentity(args[1])
		
		    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." deu para ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." "..args[2].." vale(s)```" 
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)	

RegisterCommand('limparinv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if args[1]  then
	    if vRP.hasPermission(user_id,"owner.permissao") then
		    local sets = {}
		
		    sets[1] = vRP.getInventoryItemAmount(parseInt(args[1]),"vale")
		    sets[2] = vRP.getInventoryItemAmount(parseInt(args[1]),"dias")
		    sets[3] = vRP.getInventoryItemAmount(parseInt(args[1]),"horas")
		    sets[4] = vRP.getInventoryItemAmount(parseInt(args[1]),"minutos")
		
		    vRP.clearInventory(parseInt(args[1]))
		
		    vRP.giveInventoryItem(parseInt(args[1]),"vale", sets[1])
		    vRP.giveInventoryItem(parseInt(args[1]),"dias", sets[2])
		    vRP.giveInventoryItem(parseInt(args[1]),"horas", sets[3])
		    vRP.giveInventoryItem(parseInt(args[1]),"minutos", sets[4])
	
			TriggerClientEvent("Notify",source,"sucesso","Limpou inventario do jogador.")
	        TriggerClientEvent("Notify",parseInt(args[1]),"sucesso","Limparam seu inventario")

		    local identity44 = vRP.getUserIdentity(args[1])
		
		    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." limpou inventario de ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." ```" 
            SendWebhookMessage(webhookadm,msg)
		end
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('debug',function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"owner.permissao") then
            TriggerClientEvent("ToggleDebug",player)
        else
            TriggerClientEvent("Notify",source,"negado","Sem permissao")
        end
    end
end)
RegisterCommand('reset',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"owner.permissao") then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                local id = vRP.getUserId(nplayer)
                if id then
                    vRP.setUData(id,"vRP:spawnController",json.encode(1))
                    TriggerClientEvent("Notify",user_id,"sucesso","Você <b>resetou</b> o personagem do passaporte <b>"..vRP.format(parseInt(args[1])).."</b>.",5000)
                end
            end
        else
            TriggerClientEvent("Notify",source,"negado","Sem permissao")
        end
    end
end)



 -- Teleport
RegisterCommand('tpjesus',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		vRPclient.teleport(source,-198.86,-739.142,216.90)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('tppraca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		vRPclient.teleport(source,160.03,-990.14,30.09)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('tpconce',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		vRPclient.teleport(source,-67.00,-1092.83,26.49)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('tphospital',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		vRPclient.teleport(source,351.28,-605.58,28.77)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)
RegisterCommand('tpcentral',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		vRPclient.teleport(source,221.91,208.00,105.50)
	else
        TriggerClientEvent("Notify",source,"negado","Sem permissao")
    end
end)




local player_customs = {}

RegisterCommand('vroupas',function(source,args,rawCommand)
    local custom = vRPclient.getCustomization(source)
    if player_customs[source] then -- hide
      player_customs[source] = nil
      vRPclient._removeDiv(source,"customization")
    else -- show
      local content = ""
    for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end
        player_customs[source] = true
      vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content)
 	end
end)

local presets = {
	["ROTA1"] = {
	    [1885233650] = {
		    [3] = {0,0,0},
		    [4] = {31,2,0},
		    [6] = {24,0,0},
		    [7] = {1,0,0},
		    [8] = {129,0,0},
		    [9] = {7,0,0},
		    [10] = {0,0,0},
		    [11] = {93,1,0},
		    ["p0"] = {28,1,0},
		    ["p6"] = {-1,0}
		}
	},
	["ROTA2"] = {
	    [1885233650] = {
		    [3] = {6,0,0},
		    [4] = {59,9,0},
		    [5] = {0,0,0},
		    [6] = {24,0,0},
		    [7] = {1,0,0},
		    [8] = {74,3,0},
		    [10] = {0,0,0},
		    [11] = {76,1,0},
		    ["p6"] = {-1,0},
		}
	},
	["FN"] = {
	    [1885233650] = {
		    [3] = {30,0,0},
		    [4] = {84,0,0},
		    [6] = {33,0,0},
		    [7] = {1,0,0},
		    [8] = {97,0,0},
		    [11] = {186,0,0},			
		    ["p2"] = {1,0,0}
		}
	},
	["Policia"] = {
	    [1885233650] = {
		    [3] = {0,0,0},
		    [4] = {25,1,0},
		    [5] = {0,0,0},
		    [6] = {51,0,0},
		    [7] = {1,0,0},
		    [8] = {129,0,0},
	    	[9] = {11,0,2},
		    [10] = {0,0,0},
		    [11] = {93,0,0},
		    ["p0"] = {114,0,0},
		    ["p6"] = {-1,0}
		}
	},
	["PMCOMANDANTE"] = {
	    [1885233650] = {
	        [3] = {0,0,0},
		    [4] = {31,2,0},
		    [5] = {0,0,0},
		    [6] = {24,0,0},
		    [7] = {1,0,0},
		    [8] = {16,0,0},
		    [10] = {0,0,0},
		    [11] = {93,0,0},
		    ["p0"] = {28,2,0},
		    ["p6"] = {-1,0}
		}
    }
}
RegisterCommand('preset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pm.permissao") or vRP.hasPermission(user_id,"owner.permissao") then
		if args[1] then
			local custom = presets[tostring(args[1])]
			if custom then
				local old_custom = vRPclient.getCustomization(source)
				local idle_copy = {}

				idle_copy = vRP.save_idle_custom(source,old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
					idle_copy[l] = w
				end
				vRPclient._setCustomization(source,idle_copy)
			end
		else
			vRP.removeCloak(source)
		end
	end
end)


----------------------------------- addcar

vRP._prepare("vRP/add_vehicle",
             "INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")
vRP._prepare("vRP/remove_vehicle",
			 "DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
			 
RegisterCommand('addcar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"owner.permissao") then
		if args[1] and args[2] then
			vRP.execute("vRP/add_vehicle", {
			user_id = args[1],
			vehicle = args[2]
			})
		else
			TriggerClientEvent('chatMessage',source,"VIP",{255,70,50},"Você esqueceu de colocar um argumento.")
		end
	end
end)

RegisterCommand('removecar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"owner.permissao") then
		if args[1] and args[2] then
			vRP.execute("vRP/remove_vehicle", {
			user_id = args[1],
			vehicle = args[2]
			})
		else
			TriggerClientEvent('chatMessage',source,"VIP",{255,70,50},"Você não colocou argumentos suficientes.")
		end
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
---FPS BOOST
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand("fps",function(source,args)
    if args[1] == "on" then
        SetTimecycleModifier("cinema")
        TriggerEvent("Notify","sucesso","Boost de fps ligado!")
    elseif args[1] == "off" then
        SetTimecycleModifier("default")
        TriggerEvent("Notify","sucesso","Boost de fps desligado!")
    end
end)





--------------------------------------------------------------------------------------------------------------
--------CORONHADA
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
       DisableControlAction(1, 140, true)
              DisableControlAction(1, 141, true)
           DisableControlAction(1, 142, true)
        end
    end
end)























--[[
RegisterCommand('convidarrecruta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    local id = vRP.prompt(source, "Digite o rg de quem deseja contratar:", "")
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"recruta")
			end
		end
	end
end)

RegisterCommand('convidarsoldado',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    local id = vRP.prompt(source, "Digite o rg de quem deseja contratar:", "")
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"soldado")
			end
		end
	end
end)

RegisterCommand('convidarcabo',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    local id = vRP.prompt(source, "Digite o rg de quem deseja contratar:", "")
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"cabo")
			end
		end
	end
end)

RegisterCommand('convidarsargento',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    local id = vRP.prompt (source, "Digite o rg de quem deseja contratar:", "")
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"sargento")
			end
		end
	end
end)

RegisterCommand('convidartenente',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    local id = vRP.prompt (source, "Digite o rg de quem deseja contratar:", "")
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"tenente")
			end
		end
	end
end)

RegisterCommand('convidarcapitao',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local id = vRP.prompt (source, "Digite o rg de quem deseja contratar:", "")
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"capitao")
			end
		end
	end
end)
 
RegisterCommand('convidarmajor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local id = vRP.prompt (source, "Digite o rg de quem deseja contratar:", "")
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"major")
			end
		end
	end
end)
 
RegisterCommand('convidarcoronel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local id = vRP.prompt (source, "Digite o rg de quem deseja contratar:", "")
--	local id = vRP.getUserSource(parseInt(args[1]))
	if id then
		if vRP.hasPermission(user_id,"coronel.permissao") then
	        local iok = vRP.request(id,""..identity.name.." "..identity.firstname.." te convidou para Policia Militar , deseja aceitar ?",60)
		    if iok then
	            vRP.addUserGroup(id),"coronel")
			end
		end
	end
end)
 
--]]