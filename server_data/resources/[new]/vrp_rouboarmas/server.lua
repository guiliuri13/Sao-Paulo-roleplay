local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
func = {}
Tunnel.bindInterface("vrp_rouboarmas",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local idgens = Tools.newIDGenerator()
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookrouboarmas = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMASLIST
-----------------------------------------------------------------------------------------------------------------------------------------

local armalist = {
	[1] = { ['index'] = "wbody|WEAPON_ASSAULTSMG", ['qtd'] = 1, ['name'] = "MTAR-21" },
	[2] = { ['index'] = "wbody|WEAPON_ASSAULTRIFLE", ['qtd'] = 1, ['name'] = "AK-103" },
	[3] = { ['index'] = "wbody|WEAPON_GUSENBERG", ['qtd'] = 1, ['name'] = "THOMPSON" },
	[4] = { ['index'] = "wbody|WEAPON_PISTOL_MK2", ['qtd'] = 1, ['name'] = "FN FIVE SEVEN" },
	[5] = { ['index'] = "wbody|WEAPON_COMPACTRIFLE", ['qtd'] = 1, ['name'] = "AKS-74U" },
	[6] = { ['index'] = "wbody|WEAPON_CARBINERIFLE_MK2", ['qtd'] = 1, ['name'] = "MPX" },
	[7] = { ['index'] = "wbody|WEAPON_MACHINEPISTOL", ['qtd'] = 1, ['name'] = "TEC-9" },
	[8] = { ['index'] = "wammo|WEAPON_ASSAULTSMG", ['qtd'] = 35, ['name'] = "MUNIÇÃO DE MTAR-2" },
	[9] = { ['index'] = "wammo|WEAPON_ASSAULTRIFLE", ['qtd'] = 50, ['name'] = "MUNIÇÃO DE AK-103" },
	[10] = { ['index'] = "wammo|WEAPON_GUSENBERG", ['qtd'] = 10, ['name'] = "MUNIÇÃO DE THOMPSON" },
	[11] = { ['index'] = "wammo|WEAPON_PISTOL_MK2", ['qtd'] = 50, ['name'] = "MUNIÇÃO DE FN FIVE SEVEN" },
	[12] = { ['index'] = "wammo|WEAPON_COMPACTRIFLE", ['qtd'] = 30, ['name'] = "MUNIÇÃO DE AKS-74U" },
	[13] = { ['index'] = "wammo|WEAPON_CARBINERIFLE_MK2", ['qtd'] = 50, ['name'] = "MUNIÇÃO DE MPX" },
	[14] = { ['index'] = "wammo|WEAPON_MACHINEPISTOL", ['qtd'] = 20, ['name'] = "MUNIÇÃO DE TEC-9" },
	[15] = { ['index'] = "wammo|WEAPON_PUMPSHOTGUN", ['qtd'] = 50, ['name'] = "MUNIÇÃO DE SHOTGUN" },
	[16] = { ['index'] = "dinheirosujo", ['qtd'] = 3500, ['name'] = "Dinheiro Sujo" },
	[17] = { ['index'] = "dinheirosujo", ['qtd'] = 1500, ['name'] = "Dinheiro Sujo" },
	[18] = { ['index'] = "dinheirosujo", ['qtd'] = 500, ['name'] = "Dinheiro Sujo" },
	[19] = { ['index'] = "dinheirosujo", ['qtd'] = 2500, ['name'] = "Dinheiro Sujo" },
	[20] = { ['index'] = "dinheirosujo", ['qtd'] = 1500, ['name'] = "Dinheiro Sujo" },
	[21] = { ['index'] = "dinheirosujo", ['qtd'] = 3100, ['name'] = "Dinheiro Sujo" },
	[22] = { ['index'] = "dinheirosujo", ['qtd'] = 3000, ['name'] = "Dinheiro Sujo" },
	[23] = { ['index'] = "dinheirosujo", ['qtd'] = 3000, ['name'] = "Dinheiro Sujo" },
	[24] = { ['index'] = "dinheirosujo", ['qtd'] = 4100, ['name'] = "Dinheiro Sujo" },
	[25] = { ['index'] = "dinheirosujo", ['qtd'] = 3600, ['name'] = "Dinheiro Sujo" },
	[26] = { ['index'] = "dinheirosujo", ['qtd'] = 2400, ['name'] = "Dinheiro Sujo" },
	[27] = { ['index'] = "dinheirosujo", ['qtd'] = 3600, ['name'] = "Dinheiro Sujo" },
	[28] = { ['index'] = "dinheirosujo", ['qtd'] = 3100, ['name'] = "Dinheiro Sujo" },
	[29] = { ['index'] = "dinheirosujo", ['qtd'] = 4100, ['name'] = "Dinheiro Sujo" },
	[30] = { ['index'] = "dinheirosujo", ['qtd'] = 3200, ['name'] = "Dinheiro Sujo" },
	[31] = { ['index'] = "dinheirosujo", ['qtd'] = 5500, ['name'] = "Dinheiro Sujo" },
	[32] = { ['index'] = "dinheirosujo", ['qtd'] = 1300, ['name'] = "Dinheiro Sujo" },
	[33] = { ['index'] = "dinheirosujo", ['qtd'] = 1500, ['name'] = "Dinheiro Sujo" },
	[34] = { ['index'] = "dinheirosujo", ['qtd'] = 3200, ['name'] = "Dinheiro Sujo" },
	[35] = { ['index'] = "dinheirosujo", ['qtd'] = 2100, ['name'] = "Dinheiro Sujo" },
	[36] = { ['index'] = "dinheirosujo", ['qtd'] = 900, ['name'] = "Dinheiro Sujo" },
	[37] = { ['index'] = "dinheirosujo", ['qtd'] = 300, ['name'] = "Dinheiro Sujo" }
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
local timers = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkRobbery(id,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia >= 1 then
			if timers[id] == 0 or not timers[id] then
				timers[id] = 900
				TriggerClientEvent('iniciandolojadearmas',source,x,y,z)
				vRPclient._playAnim(source,false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
				local random = math.random(100)
				if random >= 10 then
					TriggerClientEvent("Notify",source,"aviso","A policia foi acionada.",8000)
					TriggerClientEvent("vrp_sound:source",source,'alarm',0.7)
					vRPclient.setStandBY(source,parseInt(60))
					for l,w in pairs(policia) do
						local player = vRP.getUserSource(parseInt(w))
						if player then
							async(function()
								local ids = idgens:gen()
								vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
								blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
								TriggerClientEvent('chatMessage',player,"COPOM",{245,0,0},"O roubo começou na ^1Loja de armas^0, dirija-se até o local e intercepte o assaltante.")
								SetTimeout(20000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
							end)
						end
					end
				end
				SetTimeout(10000,function()
					local randlist = math.random(100)
						if randlist >= 40 and randlist <= 89 then
							local randitem = math.random(#armalist)
							vRP.giveInventoryItem(user_id,armalist[randitem].index,armalist[randitem].qtd)
							TriggerClientEvent("Notify",source,"sucesso","Você recebeu "..armalist[randitem].qtd.."x <b>"..armalist[randitem].name.."</b>.",8000)
							SendWebhookMessage(webhookrouboarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n [ROUBOU]: "..armalist[randitem].qtd.." "..armalist[randitem].name.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
				end)
			else
				TriggerClientEvent("Notify",source,"aviso","O seguro ainda não cobriu o ultomo assalto, aguarde <b>"..timers[id].." segundos</b>até a cobertura.",8000)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return not (vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"hospital.permissao") or vRP.hasPermission(user_id,"paisanapolicia.permissao") or vRP.hasPermission(user_id,"paisanaparamedico.permissao"))
end