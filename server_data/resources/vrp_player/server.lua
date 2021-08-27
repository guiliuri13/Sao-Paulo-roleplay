local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
    ["partspistol"] = { index = "partspistol", nome = "Peças Pistola" },
    ["wammopistol"] = { index = "wammopistol", nome = "(M)Peças Pistola" },
    ["partsminismg"] = { index = "partsminismg", nome = "Peças SMG" },
    ["wammominismg"] = { index = "wammominismg", nome = "(M)Peças SMG" },
    ["partsassault"] = { index = "partsassault", nome = "Peças Assault" },
    ["wammoassault"] = { index = "wammoassault", nome = "(M)Peças Assault" },
    ["pills"] = { index = "pills", nome = "Remedio" },
    ["cc"] = { index = "cc", nome = "Cartão Clonado" },
    ["morfina"] = { index = "morfina", nome = "Morfina" },
	["ferramenta"] = { index = "ferramenta", nome = "Ferramenta" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda" },
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de Lixo" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia" },
	["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite" },
	["tora"] = { index = "tora", nome = "Tora de Madeira" },
	["alianca"] = { index = "alianca", nome = "Aliança" },
	["bandagem"] = { index = "bandagem", nome = "Bandagem" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja" },
	["tequila"] = { index = "tequila", nome = "Tequila" },
	["vodka"] = { index = "vodka", nome = "Vodka" },
	["whisky"] = { index = "whisky", nome = "Whisky" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque" },
	["absinto"] = { index = "absinto", nome = "Absinto" },
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos" },
	["algemas"] = { index = "algemas", nome = "Algemas" },
	["capuz"] = { index = "capuz", nome = "Capuz" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick" },
	["masterpick"] = { index = "masterpick", nome = "Masterpick" },
	["militec"] = { index = "militec", nome = "Militec-1" },
	["carnedecormorao"] = { index = "carnedecormorao", nome = "Carne de Cormorão" },
	["carnedecorvo"] = { index = "carnedecorvo", nome = "Carne de Corvo" },
	["carnedeaguia"] = { index = "carnedeaguia", nome = "Carne de Águia" },
	["carnedecervo"] = { index = "carnedecervo", nome = "Carne de Cervo" },
	["carnedecoelho"] = { index = "carnedecoelho", nome = "Carne de Coelho" },
	["carnedecoyote"] = { index = "carnedecoyote", nome = "Carne de Coyote" },
	["carnedelobo"] = { index = "carnedelobo", nome = "Carne de Lobo" },
	["carnedepuma"] = { index = "carnedepuma", nome = "Carne de Puma" },
	["carnedejavali"] = { index = "carnedejavali", nome = "Carne de Javali" },
	["isca"] = { index = "isca", nome = "Isca" },
	["dourado"] = { index = "dourado", nome = "Dourado" },
	["corvina"] = { index = "corvina", nome = "Corvina" },
	["salmao"] = { index = "salmao", nome = "Salmão" },
	["pacu"] = { index = "pacu", nome = "Pacu" },
	["pintado"] = { index = "pintado", nome = "Pintado" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré" },
	["lambari"] = { index = "lambari", nome = "Lambari" },
	["energetico"] = { index = "energetico", nome = "Energético" },
	["mochila"] = { index = "mochila", nome = "Mochila" },
	["maconha"] = { index = "maconha", nome = "Maconha" },
	["placa"] = { index = "placa", nome = "Placa" },
	["rebite"] = { index = "rebite", nome = "Rebite" },
	["carbono"] = { index = "carbono", nome = "Carbono" },
	["ferro"] = { index = "ferro", nome = "Ferro" },
	["aco"] = { index = "aco", nome = "Aço" },
	["adubo"] = { index = "adubo", nome = "Adubo" },
	["fertilizante"] = { index = "fertilizante", nome = "Fertilizante" },
	["capsula"] = { index = "capsula", nome = "Cápsula" },
	["polvora"] = { index = "polvora", nome = "Pólvora" },
	["orgao"] = { index = "orgao", nome = "Órgão" },
	["etiqueta"] = { index = "etiqueta", nome = "Etiqueta" },
	["pendrive"] = { index = "pendrive", nome = "Pendrive" },
	["relogioroubado"] = { index = "relogioroubado", nome = "Relógio Roubado" },
	["pulseiraroubada"] = { index = "pulseiraroubada", nome = "Pulseira Roubada" },
	["anelroubado"] = { index = "anelroubado", nome = "Anel Roubado" },
	["colarroubado"] = { index = "colarroubado", nome = "Colar Roubado" },
	["brincoroubado"] = { index = "brincoroubado", nome = "Brinco Roubado" },
	["carteiraroubada"] = { index = "carteiraroubada", nome = "Carteira Roubada" },
	["carregadorroubado"] = { index = "carregadorroubado", nome = "Carregador Roubado" },
	["tabletroubado"] = { index = "tabletroubado", nome = "Tablet Roubado" },
	["sapatosroubado"] = { index = "sapatosroubado", nome = "Sapatos Roubado" },
	["vibradorroubado"] = { index = "vibradorroubado", nome = "Vibrador Roubado" },
	["perfumeroubado"] = { index = "perfumeroubado", nome = "Perfume Roubado" },
	["maquiagemroubada"] = { index = "maquiagemroubada", nome = "Maquiagem Roubada" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês" },
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra" },
	["wbody|WEAPON_PISTOL"] = { index = "m1911", nome = "M1911" },
	["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven" },
	["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19" },
	["wbody|WEAPON_APPISTOL"] = { index = "vp9", nome = "Koch VP9" },
	["wbody|WEAPON_STUNGUN"] = { index = "tazer", nome = "Tazer" },
	["wbody|WEAPON_SNSPISTOL"] = { index = "hkp7m10", nome = "HK P7M10" },
	["wbody|WEAPON_VINTAGEPISTOL"] = { index = "m1922", nome = "M1922" },
	["wbody|WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44" },
	["wbody|WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador" },
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor" },
	["wbody|WEAPON_MICROSMG"] = { index = "uzi", nome = "Uzi" },
	["wbody|WEAPON_SMG"] = { index = "mp5", nome = "MP5" },
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mtar21", nome = "MTAR-21" },
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer MPX" },
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870" },
	["wbody|WEAPON_CARBINERIFLE"] = { index = "m4a1", nome = "M4A1" },
	["wbody|WEAPON_ASSAULTRIFLE"] = { index = "ak103", nome = "AK-103" },
	["wbody|WEAPON_GUSENBERG"] = { index = "thompson", nome = "Thompson" },
	["wammo|WEAPON_PISTOL"] = { index = "m-m1911", nome = "Munição de M1911" },
	["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "Munição de FN Five Seven" },
	["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "Munição de Glock 19" },
	["wammo|WEAPON_APPISTOL"] = { index = "m-vp9", nome = "Munição de Koch VP9" },
	["wammo|WEAPON_STUNGUN"] = { index = "m-tazer", nome = "Munição de Tazer" },
	["wammo|WEAPON_SNSPISTOL"] = { index = "m-hkp7m10", nome = "Munição de HK P7M10" },
	["wammo|WEAPON_VINTAGEPISTOL"] = { index = "m-m1922", nome = "Munição de M1922" },
	["wammo|WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "Munição de Magnum 44" },
	["wammo|WEAPON_MUSKET"] = { index = "m-winchester22", nome = "Munição de Winchester 22" },
	["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "Munição de Sinalizador" },
	["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "Munição de Paraquedas" },
	["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "Munição de Extintor" },
	["wammo|WEAPON_MICROSMG"] = { index = "m-uzi", nome = "Munição de Uzi" },
	["wammo|WEAPON_SMG"] = { index = "m-mp5", nome = "Munição de MP5" },
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mtar21", nome = "Munição de MTAR-21" },
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "Munição de Sig Sauer MPX" },
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "Munição de Remington 870" },
	["wammo|WEAPON_CARBINERIFLE"] = { index = "m-m4a1", nome = "Munição de M4A1" },
	["wammo|WEAPON_ASSAULTRIFLE"] = { index = "m-ak103", nome = "Munição de AK-103" },
	["wammo|WEAPON_GUSENBERG"] = { index = "m-thompson", nome = "Munição de Thompson" },
	["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina" },
	["wbody|WEAPON_RAYPISTOL"] = { index = "raypistol", nome = "Pistola de Raio" },
	["folhacocamoida"] = { index = "folhacocamoida", nome = "folhacocamoida" },
	["folhacocaprocessada"] = { index = "folhacocaprocessada", nome = "folhacocaprocessada" },
	["cocaina"] = { index = "cocaina", nome = "cocaina" },
	["roupas"] = { index = "roupas", nome = "roupas"},
	["wbody|WEAPON_stickybomb"] = { index = "c4", nome = "c4" },
	["wbody|WEAPON_rpg"] = { index = "rpg", nome = "rpg" },
	["wbody|WEAPON_firework"] = { index = "firework", nome = "firework" },
	["wammo|WEAPON_stickybomb"] = { index = "m-c4", nome = "c4" },
	["wammo|WEAPON_rpg"] = { index = "m-rpg", nome = "muniçao de rpg" },
	["wammo|WEAPON_firework"] = { index = "m-firework", nome = " muniçao de firework" },
	["wbody|WEAPON_rayminigun"] = { index = "raygun", nome = "raygun" },
	["po"] = { index = "po", nome = "po" },
	["anfetamina"] = { index = "anfetamina", nome = "anfetamina" },
	["metanfetamina"] = { index = "metanfetamina", nome = "metanfetamina" },
	["desfibrilador"] = { index = "desfibrilador", nome = "desfibrilador" },
	["crack"] = { index = "crack", nome = "crack" },
	["colete1"] = { index = "colete1", nome = "Colete Intacto" },
	["colete2"] = { index = "colete2", nome = "Colete Danificado" },
	["colete3"] = { index = "colete2", nome = "Colete Perfurado" },
	["cloridrato"] = { index = "cloridrato", nome = "cloridrato" },
	["bicarbonato"] = { index = "bicarbonato", nome = "bicarbonato" },
	["lsd"] = { index = "lsd", nome = "lsd" },
	["acido"] = { index = "acido", nome = "acido" },
    ["colete1"] = { index = "colete1", nome = "Colete intacto" },
	["colete2"] = { index = "colete2", nome = "Colete danificado" },
    ["colete3"] = { index = "colete3", nome = "Colete perfurado" },
    ["parts"] = { index = "parts", nome = "Peças Automotivas" },
	["tinta"] = { index = "tinta", nome = "Tinta Automotivas" },
	["radio"] = { index = "radio", nome = "Radio Comunicador" },
	["macarico"] = { index = "macarico", nome = "Maçarico" },
	["c4"] = { index = "C3", nome = "C3" },
	["laptop"] = { index = "laptop", nome = "laptop" },
	["barradiamante"] = { index = "barradiamante", nome = "Barra de Diamante" },
	["barraouro"] = { index = "barraouro", nome = "Barra de Ouro" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and args[2] and itemlist[args[1]] ~= nil then
			vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /EQUIPAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('equipar',function(source,args,rawCommand)
	for k,v in pairs(itemlist) do
		if args[1] == v.index and args[1] ~= "mochila" then
			local user_id = vRP.getUserId(source)
			if vRP.tryGetInventoryItem(user_id,k,1) then
				local weapons = {}
				weapons[string.gsub(k,"wbody|","")] = { ammo = 0 }
				vRPclient._giveWeapons(source,weapons)
				vRP.logs("savedata/armamento.txt","[ID]: "..user_id.." / [FUNÇÃO]: Equipar / [ARMA]: "..v.index)
			else
				TriggerClientEvent("Notify",source,"negado","Armamento não encontrado.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /RECARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('recarregar',function(source,args,rawCommand)
	for k,v in pairs(itemlist) do
		if args[1] == v.index and args[1] ~= "mochila" then
			local uweapons = vRPclient.getWeapons(source)
			local weaponuse = string.gsub(k,"wbody|","")
			if uweapons[weaponuse] then
				local user_id = vRP.getUserId(source)
				if vRP.tryGetInventoryItem(user_id,"wammo|"..weaponuse,parseInt(args[2])) then
					local weapons = {}
					weapons[weaponuse] = { ammo = parseInt(args[2]) }
					vRPclient._giveWeapons(source,weapons,false)
					vRP.logs("savedata/armamento.txt","[ID]: "..user_id.." / [FUNÇÃO]: Recarregar / [ARMA]: "..v.index)
				else
					TriggerClientEvent("Notify",source,"negado","Munição não encontrada.")
				end
			else
				TriggerClientEvent("Notify",source,"importante","Equipe o armamento antes.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /MOC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('moc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(user_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(user_id)).."kg^4  ]  - -")
			for k,v in pairs(data.inventory) do
				if k and v then
					TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."^5    |    "..itemlist[k].index)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /DROPAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dropar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		local px,py,pz = vRPclient.getPosition(source)
		for k,v in pairs(itemlist) do
			if args[1] == v.index then
				if args[2] and parseInt(args[2]) > 0 then
					if vRP.tryGetInventoryItem(user_id,k,parseInt(args[2])) then
						TriggerEvent("DropSystem:create",k,parseInt(args[2]),px,py,pz)
						vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
						vRP.logs("savedata/dropar.txt","[ID]: "..user_id.." / [ITEM]: "..k.." / [QTD]: "..parseInt(args[2]))
					end
				else
					local data = vRP.getUserDataTable(user_id)
					for i,o in pairs(data.inventory) do
						if itemlist[i].index == args[1] then
							if vRP.tryGetInventoryItem(user_id,k,parseInt(o.amount)) then
								TriggerEvent("DropSystem:create",k,parseInt(o.amount),px,py,pz)
								vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
								vRP.logs("savedata/dropar.txt","[ID]: "..user_id.." / [ITEM]: "..k.." / [QTD]: "..parseInt(o.amount))
							end
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /id
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer == nil then
				return
			end
			nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				
			    if vRP.hasGroup(nuser_id,"Carta") then
                    tem = "Possui"
                else
                    tem = "Não possui"
		        end
		        local tema = ""
		        if vRP.hasGroup(nuser_id,"Porte") then
                    tema = "Possui"
                else
                    tema = "Não possui"
		        end

				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 450px; padding: 20px 20px 5px; bottom: 7%; right: 5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 250px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #99cc00; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..identity.user_id.." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div><div class=\"local\"><b>CNH:</b> "..tem.."</div><div class=\"local2\"><b>Porte:</b> "..tema.."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		else
			local nplayer = vRPclient.getNearestPlayer(source,2)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				
				if vRP.hasGroup(nuser_id,"Carta") then
                    tem = "Possui"
                else
                    tem = "Não possui"
		        end
		        local tema = ""
		        if vRP.hasGroup(nuser_id,"Porte") then
                    tema = "Possui"
                else
                    tema = "Não possui"
		        end
				
				
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 450px; padding: 20px 20px 5px; bottom: 7%; right: 5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 250px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #99cc00; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..identity.user_id.." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div><div class=\"local2\"><b>CNH:</b> "..tem.."</div><div class=\"local2\"><b>Porte:</b> "..tema.."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		end
	end
end)
RegisterCommand('id2', function(source, args, rawCommand) -- ready
    local user_id = vRP.getUserId(source)
	
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	
	if nuser_id then
	    local identity = vRP.getUserIdentity(nuser_id)
		
	    local firstname = identity.name
	    local name = identity.firstname
	    local registration = identity.registration
	    local age = identity.age
		
	    local bank = vRP.getBankMoney(nuser_id)
	    local money = vRP.getMoney(nuser_id)
		
	    local phone = identity.phone
		
	    local multas = vRP.getUData(nuser_id, "vRP:Multas") or "0"
	    if vRP.hasGroup(nuser_id,"Carta") then
            tem = "Possui"
        else
            tem = "Não possui"
		end
		local tema = ""
		if vRP.hasGroup(nuser_id,"Porte") then
             tema = "Possui"
        else
             tema = "Não possui"
		end
		
		vRP.prompt(source,"INFORMAÇOES","Nome "..firstname.." "..name.."("..nuser_id..")\nRegistro "..registration.."\nIdade "..age.."\nMultas R$"..multas.."\nCNH "..tem.."\nPorte "..tema.."")
		
	else
	    TriggerClientEvent('chatMessage',source,"Ninguem perto")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('revistar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	
	if nuser_id then
		local identity = vRP.getUserIdentity(user_id)
		local weapons = vRPclient.getWeapons(nplayer)
		local money = vRP.getMoney(nuser_id)
		local data = vRP.getUserDataTable(nuser_id)
		TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(nuser_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(nuser_id)).."kg^4  ]  - -")
		if data and data.inventory then
			for k,v in pairs(data.inventory) do
				TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome)
			end
		end
		TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5E Q U I P A D O^4  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
		for k,v in pairs(weapons) do
			if v.ammo < 1 then
				TriggerClientEvent('chatMessage',source,"",{},"     1x "..itemlist["wbody|"..k].nome)
			else
				TriggerClientEvent('chatMessage',source,"",{},"     1x "..itemlist["wbody|"..k].nome.." | "..vRP.format(parseInt(v.ammo)).."x Munições")
			end
		end
		TriggerClientEvent('chatMessage',source,"",{},"     $"..vRP.format(parseInt(money)).." Dólares")
		TriggerClientEvent("Notify",source,"aviso","Revistou id "..nuser_id.."</b>.")
		TriggerClientEvent("Notify",nplayer,"aviso","Revistado por <b>"..identity.name.." "..identity.firstname.."</b>.")
	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
veiculos["CLONADOS"] = true
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AFKSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("kickAFK")
AddEventHandler("kickAFK",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if not vRP.hasPermission(user_id,"admin.permissao") then
		DropPlayer(source,"Voce foi desconectado por ficar ausente.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /SEQUESTRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALERTAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('alertas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"alertas.permissao") then
		vRP.removeUserGroup(user_id,"Alertas")
		TriggerClientEvent("Notify",source,"importante","Você removeu as notificações.")
	else
		vRP.addUserGroup(user_id,"Alertas")
		TriggerClientEvent("Notify",source,"sucesso","Você ativou as notificações.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('players',function(source,args,rawCommand)
	local onlinePlayers = GetNumPlayerIndices()
	TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Jogadores online: "..onlinePlayers)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CASAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('casas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if args[1] and vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRP.getUserSource(parseInt(args[1]))
		if nplayer == nil then
			return
		end
		user_id = vRP.getUserId(nplayer)
	end
	if user_id then
		local address = vRP.getUserAddress(user_id)
		local casas = ""
		if args[1] then
			if #address > 0 then
				for k,v in pairs(address) do
					casas = casas..v.home.." - Nº"..v.number
					if k ~= #address then
						casas = casas..", "
					end
				end
				TriggerClientEvent("Notify",source,"importante","Residências possuidas pelo passaporte <b>"..vRP.format(parseInt(args[1])).."</b>: "..casas)
			else
				TriggerClientEvent("Notify",source,"negado","Passaporte <b>"..vRP.format(parseInt(args[1])).."</b> não possui residências.")
			end
		else
			if #address > 0 then
				for k,v in pairs(address) do
					casas = casas..v.home.." - Nº"..v.number
					if k ~= #address then
						casas = casas..", "
					end
				end
				TriggerClientEvent("Notify",source,"importante","Residências possuidas: "..casas)
			else
				TriggerClientEvent("Notify",source,"importante","Não possui residências em seu nome.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('motor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if not vRPclient.isInVehicle(source) then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vRP.hasPermission(user_id,"mecanico.permissao") and vRP.tryGetInventoryItem(user_id,"militec",1) or vRP.hasPermission(user_id,"benny.permissao") and vRP.tryGetInventoryItem(user_id,"militec",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
			TriggerClientEvent("progress",source,30000,"reparando")
			SetTimeout(30000,function()
				TriggerClientEvent('cancelando',source,false)
				TriggerClientEvent('repararmotor',source,vehicle)
				vRPclient._stopAnim(source,false)
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Militec-1</b> para reparar o motor.")
		end
	else
		TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
	end
end)

RegisterServerEvent("trymotor")
AddEventHandler("trymotor",function(nveh)
	TriggerClientEvent("syncmotor",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reparar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if not vRPclient.isInVehicle(source) then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vRP.tryGetInventoryItem(user_id,"repairkit",1) and vRP.hasPermission(user_id,"benny.permissao") or vRP.tryGetInventoryItem(user_id,"repairkit",1) and vRP.hasPermission(user_id,"mecanico.permissao") then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
			TriggerClientEvent("progress",source,30000,"reparando")
			SetTimeout(30000,function()
				TriggerClientEvent('cancelando',source,false)
				TriggerClientEvent('reparar',source,vehicle)
				vRPclient._stopAnim(source,false)
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Precisa de um <b>KIT REPARO</b> para reparar o motor.")
		end
	else
		TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
	end
end)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENVIAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('enviar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id and args[1] and parseInt(args[2]) > 0 then
		for k,v in pairs(itemlist) do
			if args[1] == v.index then
				if vRP.getInventoryWeight(nuser_id)+vRP.getItemWeight(k)*parseInt(args[2]) <= vRP.getInventoryMaxWeight(nuser_id) then
					if vRP.tryGetInventoryItem(user_id,k,parseInt(args[2])) then
						vRP.giveInventoryItem(nuser_id,k,parseInt(args[2]))
						vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
						TriggerClientEvent("Notify",source,"sucesso","Enviou <b>"..parseInt(args[2]).."x "..v.nome.."</b>.")
						TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>"..parseInt(args[2]).."x "..v.nome.."</b>.")
						vRP.logs("savedata/enviar.txt","[ID]: "..user_id.." / [NID]: "..nuser_id.." / [ITEM]: "..k)
					end
				end
			end
		end
	elseif nuser_id and parseInt(args[1]) > 0 then
		if vRP.tryPayment(user_id,parseInt(args[1])) then
			vRP.giveMoney(nuser_id,parseInt(args[1]))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.")
			TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.")
			vRP.logs("savedata/enviar.txt","[ID]: "..user_id.." / [NID]: "..nuser_id.." / [VALOR]: "..parseInt(args[1]))
		else
			TriggerClientEvent("Notify",source,"negado","Não tem a quantia que deseja enviar.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('garmas',function(source,args,rawCommand)
    local source = source
	local user_id = vRP.getUserId(source)
	
	if user_id then
		
		local dds = vRP.request(source,"<b>Deseja mesmo guardar seus equipamentos ? </b>",10)
		if dds then 
		    local weapons = vRPclient.replaceWeapons(source,{})
		    for k,v in pairs(weapons) do

			    vRP.giveInventoryItem(user_id,"wbody|"..k,1)
			    if v.ammo > 0 then
				    vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
			    end
		    end
		    if vRPclient.getArmour(source) == 100 then
		        vRPclient.setArmour(source,0)
		        vRP.giveInventoryItem(user_id,"colete1", 1)
			    vRP.setUData(user_id,"vRP:colete", json.encode(0))
		    end
	        if vRPclient.getArmour(source) <= 99 and vRPclient.getArmour(source) >= 49 then
                vRPclient.setArmour(source,0)
		        vRP.giveInventoryItem(user_id,"colete2", 1)
			    vRP.setUData(user_id,"vRP:colete", json.encode(0))
		    end
	        if vRPclient.getArmour(source) <= 49 and vRPclient.getArmour(source) >= 10 then
		        vRPclient.setArmour(source,0)
		        vRP.giveInventoryItem(user_id,"colete3", 1)
			    vRP.setUData(user_id,"vRP:colete", json.encode(0))
	        end
		    TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
		end
	end
end)
RegisterCommand('gcolete',function(source,args,rawCommand)
    local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
	    local ssssd = vRP.request(source,"<b>Deseja mesmo guardar seus equipamentos ?</b>",10)
		if ssssd then 
		    if vRPclient.getArmour(source) == 100 then
		        vRPclient.setArmour(source,0)
		        vRP.giveInventoryItem(user_id,"colete1", 1)
	        elseif vRPclient.getArmour(source) <= 99 and vRPclient.getArmour(source) >= 49 then
                vRPclient.setArmour(source,0)
		        vRP.giveInventoryItem(user_id,"colete2", 1)
	        elseif vRPclient.getArmour(source) <= 49 and vRPclient.getArmour(source) >= 10 then
		        vRPclient.setArmour(source,0)
		        vRP.giveInventoryItem(user_id,"colete3", 1)
	        end
		    TriggerClientEvent("Notify",source,"sucesso","Guardou seu colete na mochila.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLONEPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cloneplate',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.isInVehicle(source) and vRP.tryGetInventoryItem(user_id,"placa",1) then
			TriggerClientEvent("cloneplates",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUBAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('roubar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local vida = vRPclient.getHealth(nplayer)
	if nplayer then
	if vida <= 100 then
		local nuser_id = vRP.getUserId(nplayer)
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia >= 1 then
			if vRP.request(nplayer,"Você está sendo roubado, deseja passar tudo? É pecado recusar o roubo estando desmaiado!",30) then
				local vida = vRPclient.getHealth(nplayer)
				if vida <= 100 then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
					TriggerClientEvent("progress",source,30000,"roubando")
					SetTimeout(30000,function()
						local ndata = vRP.getUserDataTable(nuser_id)
						if ndata ~= nil then
							if ndata.inventory ~= nil then
								for k,v in pairs(ndata.inventory) do
								    if k ~= "vale" and k ~= "minutos" and k ~= "horas" and k ~= "dias" then
									    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
										    if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
											    vRP.giveInventoryItem(user_id,k,v.amount)
										    end
									    else
										    TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."</b> por causa do peso.")
									    end
									end
								end
							end
						end
						local weapons = vRPclient.replaceWeapons(nplayer,{})
						for k,v in pairs(weapons) do
							vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..itemlist["wbody"..k].nome.."</b> por causa do peso.")
							end
							if v.ammo > 0 then
								vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..itemlist["wammo|"..k].nome.."</b> por causa do peso.")
								end
							end
						end
						local nmoney = vRP.getMoney(nuser_id)
						if vRP.tryPayment(nuser_id,nmoney) then
							vRP.giveMoney(user_id,nmoney)
						end
						vRPclient.setStandBY(source,parseInt(600))
						vRPclient._stopAnim(source,false)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
					end)
				else
					local ndata = vRP.getUserDataTable(nuser_id)
					if ndata ~= nil then
						if ndata.inventory ~= nil then
							for k,v in pairs(ndata.inventory) do
							    if k ~= "vale" and k ~= "minutos" and k ~= "horas" and k ~= "dias" then
								    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
									    if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
										    vRP.giveInventoryItem(user_id,k,v.amount)
									    end
								    else
									    TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."</b> por causa do peso.")
								    end
								end
							end
						end
					end
					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
								vRP.giveInventoryItem(user_id,"wbody|"..k,1)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..itemlist["wbody|"..k].nome.."</b> por causa do peso.")
						end
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
									vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..itemlist["wammo|"..k].nome.."</b> por causa do peso.")
							end
						end
					end
					local nmoney = vRP.getMoney(nuser_id)
					if vRP.tryPayment(nuser_id,nmoney) then
						vRP.giveMoney(user_id,nmoney)
					end
					vRPclient.setStandBY(source,parseInt(600))
					TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
				end
			else
				TriggerClientEvent("Notify",source,"aviso","A pessoa está resistindo ao roubo.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Número insuficiente de policiais no momento.")
		end
	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WINS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent('mascara',source,args[1],args[2])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--CALL
---------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
RegisterCommand('chamar',function(source,args,rawCommand)
	local source = source
	local answered = false 
	local user_id = vRP.getUserId(source)
	if user_id then
		local players = {}
		if args[1] == "190" then
			players = vRP.getUsersByPermission("policia.permissao")
		elseif args[1] == "192" then
			players = vRP.getUsersByPermission("paramedico.permissao")
		elseif args[1] == "mec" then
			players = vRP.getUsersByPermission("mecanico.permissao")
		elseif args[1] == "taxi" then
			players = vRP.getUsersByPermission("taxista.permissao")
		elseif args[1] == "adm" then
			players = vRP.getUsersByPermission("chamado.adm")
		else
			TriggerClientEvent("Notify",source,"negado","Serviço inexistente.")
			return
		end

		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			return
		end

		local identitys = vRP.getUserIdentity(user_id)
		TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")
		for l,w in pairs(players) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			local x,y,z = vRPclient.getPosition(source)
			local uplayer = vRP.getUserSource(user_id)
			if player and player ~= uplayer then
				async(function()
					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},"Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0, "..descricao)
					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
					if ok then
						if not answered then
							answered = true
							local identity = vRP.getUserIdentity(nuser_id)
							TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							vRPclient._setGPS(player,x,y)
						else
							TriggerClientEvent("Notify",player,"negado","Chamado ja foi atendido por outra pessoa.")
							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
						end
					end
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- P
-----------------------------------------------------------------------------------------------------------------------------------------
local policia = {}
RegisterCommand('p',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5,false)
						TriggerClientEvent("Notify",player,"importante","Localização recebida de <b>"..identity.name.." "..identity.firstname.."</b>.")
						vRPclient._playSound(player,"Place_Prop_Fail","DLC_Dmod_Prop_Editor_Sounds")
						SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					end)
				end
			end
		end
	end
end)
    ---------------------------------------------------------
    RegisterCommand('tw', function(source, args, rawCommand)
        local message = rawCommand:sub(3)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(36, 211, 242,0) 95%); border-radius: 15px 50px 30px 5px;" src="https://image.flaticon.com/icons/svg/1006/1006657.svg"> @{0}:<br>{1}</div>',
        args = { fal, message }
        })

        local data = os.date("**%d-%m-%Y** ás **%X**")
        local content1 = "[**TWITTER**] [**ID**]: "..user_id.." [**MENSAGEM**]: "..message.." ás ("..data..")"
        PerformHttpRequest(webhookchat, function(err, text, headers) end, 'POST', json.encode({username = "PenguinChat", content = content1}), { ['Content-Type'] = 'application/json' })
    end)


    RegisterCommand('ilegal', function(source, args, rawCommand)
        local message = rawCommand:sub(8)
        local user_id = vRP.getUserId(source)
        if user_id ~= nil then
            for k, v in pairs(vRP.getUsers()) do
                if not vRP.hasPermission(k, "policia.permissao") then
                    TriggerClientEvent('chat:addMessage', v, {
                        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(0, 0, 0,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><i class="fab fa-twitter"></i> @Anônimo: {1}</div>',
                        args = { fal, message }
                    })

                    local data = os.date("**%d-%m-%Y** ás **%X**")
                    local content1 = "[**ILEGAL**] [**ID**]: "..user_id.." [**MENSAGEM**]: "..message.." ás ("..data..")"
                    PerformHttpRequest(webhookchat, function(err, text, headers) end, 'POST', json.encode({username = "PenguinChat", content = content1}), { ['Content-Type'] = 'application/json' })
                end
            end
        end
    end)

    RegisterCommand('ml', function(source, args, rawCommand)
        local message = rawCommand:sub(3)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(212, 178, 44,0.9) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 20px" src="https://image.flaticon.com/icons/svg/1006/1006657.svg"> @{0}: {1}</div>',
            args = { fal, message }
        })

        local data = os.date("**%d-%m-%Y** ás **%X**")
        local content1 = "[**ML**] [**ID**]: "..user_id.." [**MENSAGEM**]: "..message.." ás ("..data..")"
        PerformHttpRequest(webhookchat, function(err, text, headers) end, 'POST', json.encode({username = "PenguinChat", content = content1}), { ['Content-Type'] = 'application/json' })
    end, false)
    
    
    RegisterCommand('190', function(source, args, rawCommand)
        local message = rawCommand:sub(4)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
    
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(35, 142, 219,0.9) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/1022/1022484.svg"> @{0}: {1}</div>',
            args = { fal, message }
        })

        local data = os.date("**%d-%m-%Y** ás **%X**")
        local content1 = "[**190**] [**ID**]: "..user_id.." [**MENSAGEM**]: "..message.." ás ("..data..")"
        PerformHttpRequest(webhookchat, function(err, text, headers) end, 'POST', json.encode({username = "PenguinChat", content = content1}), { ['Content-Type'] = 'application/json' })
    end, false)
    
    RegisterCommand('190a', function(source, args, rawCommand)
        local message = rawCommand:sub(5)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(35, 142, 219,0.5) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 20px" src="https://image.flaticon.com/icons/svg/2067/2067824.svg"> @Bandidos:  {1}</div>',
            args = { fal, message }
        })

        local data = os.date("**%d-%m-%Y** ás **%X**")
        local content1 = "[**190a**] [**ID**]: "..user_id.." [**MENSAGEM**]: "..message.." ás ("..data..")"
        PerformHttpRequest(webhookchat, function(err, text, headers) end, 'POST', json.encode({username = "PenguinChat", content = content1}), { ['Content-Type'] = 'application/json' })
    end, false)
    
    RegisterCommand('192', function(source, args, rawCommand)
        local message = rawCommand:sub(4)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(0, 100, 0,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/1142/1142131.svg"> @{0}: {1}</div>',
            args = { fal, message }
        })

        local data = os.date("**%d-%m-%Y** ás **%X**")
        local content1 = "[**192**] [**ID**]: "..user_id.." [**MENSAGEM**]: "..message.." ás ("..data..")"
        PerformHttpRequest(webhookchat, function(err, text, headers) end, 'POST', json.encode({username = "PenguinChat", content = content1}), { ['Content-Type'] = 'application/json' })
    end, false)
    
-----------------------------------------------------------------------------------------------------------------------------------------
-- FORA RP
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('OOC',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if user_id then
			TriggerClientEvent('chatMessage',-1,"[OOC]"..identity.name.." "..identity.firstname,{169,169,169},rawCommand:sub(4))
		end
	end
end)


-- RegisterCommand('call', function(source,args,rawCommand)
-- 	if args[1] then
-- 		servico = args[1]
-- 		local desc = vRP.prompt(source,"Mensagem:","")
-- 		if desc ~= "" then
-- 			local source = source
-- 			local answered = false
-- 			local user_id = vRP.getUserId(source)
-- 			local uplayer = vRP.getUserSource(user_id)
-- 			if user_id then
-- 				local x,y,z = vRPclient.getPosition(source)
-- 				local players = {}
-- 				if servico == "911" then
-- 					players = vRP.getUsersByPermission("policia.permissao")
-- 					local typemessage = "sucesso"
-- 					local messagedesc = "Você fez um chamado para o serviço "..servico..", aguarde no local"
-- 					vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 					SetTimeout(5000,function()
-- 						vRPclient.removeDiv(source,"chamar")
-- 					end)
-- 				elseif servico == "112" then
-- 					players = vRP.getUsersByPermission("paramedico.permissao")
-- 					local typemessage = "sucesso"
-- 					local messagedesc = "Você fez um chamado para o serviço "..servico..", aguarde no local"
-- 					vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 					SetTimeout(5000,function()
-- 						vRPclient.removeDiv(source,"chamar")
-- 					end)
-- 				elseif servico == "911a" then
-- 					players = vRP.getUsersByPermission("policia.permissao")
-- 					--TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você fez um chamado para o serviço ^1Policia em anônimato^0, aguarde no local.")
-- 					local typemessage = "sucesso"
-- 					local messagedesc = "Você fez um chamado para a policia em anonimato."
-- 					vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 					SetTimeout(5000,function()
-- 						vRPclient.removeDiv(source,"chamar")
-- 					end)
-- 				elseif servico == "mec" then
-- 					players = vRP.getUsersByPermission("mecanico.permissao")
-- 					--TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você fez um chamado para o serviço ^0Mecânico, aguarde no local.")
-- 					local typemessage = "sucesso"
-- 					local messagedesc = "Você fez um chamado para o mecânico, aguarde no local."
-- 					vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 					SetTimeout(5000,function()
-- 						vRPclient.removeDiv(source,"chamar")
-- 					end)
-- 				elseif servico == "taxi" then
-- 					players = vRP.getUsersByPermission("taxista.permissao")
-- 					--TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você fez um chamado para o serviço ^0Taxi, aguarde no local.")
-- 					local typemessage = "sucesso"
-- 					local messagedesc = "Você fez um chamado para o taxi, aguarde no local."
-- 					vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 					SetTimeout(5000,function()
-- 						vRPclient.removeDiv(source,"chamar")
-- 					end)
-- 				elseif servico == "adm" then
-- 					players = vRP.getUsersByPermission("dv.permissao")
-- 					--TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você fez um chamado para o serviço ^0Taxi, aguarde no local.")
-- 					local typemessage = "sucesso"
-- 					local messagedesc = "Você fez um chamado para o adm, aguarde no local."
-- 					vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 					SetTimeout(5000,function()
-- 						vRPclient.removeDiv(source,"chamar")
-- 					end)
-- 				else
-- 					--TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Serviço inexistente.")
-- 					local typemessage = "error"
-- 					local messagedesc = "Serviço inexistente."
-- 					vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 					SetTimeout(5000,function()
-- 						vRPclient.removeDiv(source,"chamar")
-- 					end)
-- 				end
-- 				local identitys = vRP.getUserIdentity(user_id)
-- 				for l,w in pairs(players) do
-- 					local player = vRP.getUserSource(parseInt(w))
-- 					local nuser_id = vRP.getUserId(player)
-- 					if player and player ~= uplayer then
-- 						async(function()
-- 							if servico == "112" then
-- 								local ok = vRP.request(player,identitys.name.." "..identitys.firstname.."   |   "..desc,30)
-- 								if ok then
-- 									if not answered then
-- 										answered = true
-- 										local identity = vRP.getUserIdentity(nuser_id)
-- 										local typemessage = "sucesso"
-- 										local messagedesc = "Seu chamado foi atendido por <font color=\"green\">"..identity.name.." "..identity.firstname.."</font>, aguarde no local."
-- 										vRPclient.setDiv(source, "call","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 										SetTimeout(5000,function()
-- 											vRPclient.removeDiv(source,"call")
-- 										end)
-- 										vRPclient._playSound(source,"Phone_SoundSet_Default","Menu_Accept")
-- 										local id = idgens:gen()
-- 										blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6)
-- 										vRPclient._setGPS(player,x,y)
-- 									else
-- 										local typemessage = "error"
-- 										local messagedesc = "Este chamado já foi atendido por outra pessoa"
-- 										vRPclient.setDiv(player, "call","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 										SetTimeout(5000,function()
-- 											vRPclient.removeDiv(player,"call")
-- 										end)
-- 										vRPclient.playSound(player,"HUD_MINI_GAME_SOUNDSET","CHECKPOINT_MISSED")
-- 									end
-- 									SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
-- 								end
-- 							else
-- 								local ok = vRP.request(player,identitys.name.." "..identitys.firstname.."   |   "..desc,30)
-- 								SetTimeout(3500, function()
-- 									if ok then
-- 										if not answered then
-- 											answered = true
-- 											local identity = vRP.getUserIdentity(nuser_id)
-- 											--TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Seu chamado foi atendido por ^1"..identity.name.." "..identity.firstname.."^0, aguarde no local.")
-- 											local typemessage = "sucesso"
-- 											local messagedesc = "Seu chamado foi atendido por <font color=\"green\">"..identity.name.." "..identity.firstname.."</font>, aguarde no local."
-- 											vRPclient.setDiv(source, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 											SetTimeout(5000,function()
-- 												vRPclient.removeDiv(source,"call")
-- 											end)
-- 											vRPclient._playSound(source,"Phone_SoundSet_Default","Menu_Accept")
-- 											local id = idgens:gen()
-- 											blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6)
-- 											vRPclient._setGPS(player,x,y)
-- 										else
-- 											local typemessage = "error"
-- 											local messagedesc = "Este chamado já foi atendido por outra pessoa"
-- 											vRPclient.setDiv(player, "call","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 											SetTimeout(5000,function()
-- 												vRPclient.removeDiv(player,"call")
-- 											end)
-- 											vRPclient.playSound(player,"HUD_MINI_GAME_SOUNDSET","CHECKPOINT_MISSED")
-- 										end
-- 										SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
-- 									end
-- 								end)
-- 							end
-- 						end)
-- 					end
-- 				end
-- 			end
-- 		else
-- 			local typemessage = "error"
-- 			local messagedesc = "Você não pode fazer um chamado com a mensagem vazia"
-- 			vRPclient.setDiv(player, "chamar","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
-- 			SetTimeout(5000,function()
-- 				vRPclient.removeDiv(player,"chamar")
-- 			end)
-- 		end
-- 	end
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "policia.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('hr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "paramedico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('me',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		TriggerClientEvent('chatME',-1,source,identity.name,rawCommand:sub(3))
		vRP.logs("savedata/me.txt","[ID]: "..user_id.." / [MENSAGEM]: "..rawCommand:sub(3))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
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

RegisterCommand('use',function(source,args,rawCommand)
	if args[1] == nil then
		return
	end
	local user_id = vRP.getUserId(source)
	if args[1] == "bandagem" then
		vida = vRPclient.getHealth(source)
		if vida > 100 and vida < 400 then
			if bandagem[user_id] == 0 or not bandagem[user_id] then
				if vRP.tryGetInventoryItem(user_id,"bandagem",1) then
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent("progress",source,10000,"bandagem")
					SetTimeout(10000,function()
						bandagem[user_id] = 60
						TriggerClientEvent('bandagem',source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"sucesso","Bandagem utilizada com sucesso.")
					end)
				else
					TriggerClientEvent("Notify",source,"negado","Bandagem não encontrada na mochila.")
				end
			else
				TriggerClientEvent("Notify",source,"importante","Você precisa aguardar <b>"..bandagem[user_id].." segundos</b> para utilizar outra Bandagem.")
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar de vida cheia ou nocauteado.")
		end
	elseif args[1] == "mochila" then
		if vRP.tryGetInventoryItem(user_id,"mochila",1) then
			vRP.varyExp(user_id,"physical","strength",650)
			TriggerClientEvent("Notify",source,"sucesso","Mochila utilizada com sucesso.")
		else
			TriggerClientEvent("Notify",source,"negado","Mochila não encontrada na mochila.")
		end
	elseif args[1] == "cerveja" then
		if vRP.tryGetInventoryItem(user_id,"cerveja",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Cerveja utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Cerveja não encontrada na mochila.")
		end
	elseif args[1] == "tequila" then
		if vRP.tryGetInventoryItem(user_id,"tequila",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Tequila utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Tequila não encontrada na mochila.")
		end
	elseif args[1] == "vodka" then
		if vRP.tryGetInventoryItem(user_id,"vodka",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Vodka utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Vodka não encontrada na mochila.")
		end
	elseif args[1] == "whisky" then
		if vRP.tryGetInventoryItem(user_id,"whisky",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Whisky utilizado com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Whisky não encontrado na mochila.")
		end
	elseif args[1] == "conhaque" then
		if vRP.tryGetInventoryItem(user_id,"conhaque",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Conhaque utilizado com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Conhaque não encontrado na mochila.")
		end
	elseif args[1] == "absinto" then
		if vRP.tryGetInventoryItem(user_id,"absinto",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Absinto utilizado com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Absinto não encontrada na mochila.")
		end
	elseif args[1] == "maconha" then
		if vRP.tryGetInventoryItem(user_id,"maconha",1) then
			vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
			TriggerClientEvent("progress",source,10000,"fumando")
			SetTimeout(10000,function()
				vRPclient._stopAnim(source,false)
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent("Notify",source,"sucesso","Maconha utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Maconha não encontrada na mochila.")
		end
	elseif args[1] == "metanfetamina" then
		if vRP.tryGetInventoryItem(user_id,"metanfetamina",1) then
			vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
			TriggerClientEvent("progress",source,10000,"fumando")
			SetTimeout(10000,function()
				vRPclient._stopAnim(source,false)
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent("Notify",source,"sucesso","Meta utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Meta não encontrada na mochila.")
		end
		elseif args[1] == "cocaina" then
		if vRP.tryGetInventoryItem(user_id,"cocaina",1) then
			vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
			TriggerClientEvent("progress",source,10000,"cheirando")
			SetTimeout(10000,function()
				vRPclient._stopAnim(source,false)
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent("Notify",source,"sucesso","Coca utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Coca não encontrada na mochila.")
		end
	elseif args[1] == "rebite" then
		if vRP.tryGetInventoryItem(user_id,"rebite",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('energeticos',source,true)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Rebite utilizado com sucesso.")
			end)
			SetTimeout(60000,function()
				TriggerClientEvent('energeticos',source,false)
				TriggerClientEvent("Notify",source,"aviso","O efeito do rebite passou e o coração voltou a bater normalmente.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Rebite não encontrado na mochila.")
		end
	elseif args[1] == "capuz" then
		if vRP.getInventoryItemAmount(user_id,"capuz") >= 1 then
			local nplayer = vRPclient.getNearestPlayer(source,2)
			if nplayer then
				vRPclient.setCapuz(nplayer)
				vRP.closeMenu(nplayer)
				TriggerClientEvent("Notify",source,"sucesso","Capuz utilizado com sucesso.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Capuz não encontrado na mochila.")
		end
	elseif args[1] == "energetico" then
		if vRP.tryGetInventoryItem(user_id,"energetico",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				TriggerClientEvent('energeticos',source,true)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Energético utilizado com sucesso.")
			end)
			SetTimeout(60000,function()
				TriggerClientEvent('energeticos',source,false)
				TriggerClientEvent("Notify",source,"aviso","O efeito do energético passou e o coração voltou a bater normalmente.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Energético não encontrado na mochila.")
		end
	elseif args[1] == "lockpick" then
		local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
		local mPlacaUser = vRP.getUserByRegistration(mPlaca)
		if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1 and mName then
			if vRP.hasPermission(user_id,"policia.permissao") then
				TriggerClientEvent("syncLock",-1,mNet)
				return
			end

			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
			TriggerClientEvent("progress",source,30000,"roubando")
			SetTimeout(30000,function()
				TriggerClientEvent('cancelando',source,false)
				vRPclient._stopAnim(source,false)

				if not mPlacaUser then
					TriggerClientEvent("syncLock",-1,mNet)
					TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
				else
					if math.random(100) >= 80 then
						TriggerClientEvent("syncLock",-1,mNet)
						TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
					else
						TriggerClientEvent("Notify",source,"negado","Roubo do veículo falhou e as autoridades foram acionadas.")
						local policia = vRP.getUsersByPermission("policia.permissao")
						for k,v in pairs(policia) do
							local player = vRP.getUserSource(parseInt(v))
							if player then
								async(function()
									local id = idgens:gen()
									TriggerClientEvent('chatMessage',player,"COPOM",{245,0,0},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
									pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
									SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
								end)
							end
						end
					end
				end
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Precisa de uma <b>Lockpick</b> para iniciar o roubo do veículo.")
		end
	elseif args[1] == "masterpick" then
		local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
		local mPlacaUser = vRP.getUserByRegistration(mPlaca)
		if vRP.getInventoryItemAmount(user_id,"masterpick") >= 1 and mName then

			if vRP.hasPermission(user_id,"policia.permissao") then
				TriggerClientEvent("syncLock",-1,mNet)
				return
			end

			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
			TriggerClientEvent("progress",source,60000,"roubando")

			SetTimeout(60000,function()
				TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
				TriggerClientEvent('cancelando',source,false)
				TriggerClientEvent("syncLock",-1,mNet)
				vRPclient._stopAnim(source,false)

				local policia = vRP.getUsersByPermission("policia.permissao")
				for k,v in pairs(policia) do
					local player = vRP.getUserSource(parseInt(v))
					if player then
						async(function()
							local id = idgens:gen()
							TriggerClientEvent('chatMessage',player,"COPOM",{245,0,0},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
							pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
							SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
						end)
					end
				end
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Precisa de uma <b>Masterpick</b> para iniciar o roubo do veículo.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local roupas = {
	["mergulho"] = {
		[1885233650] = {
			[1] = { 122,0 },
			[5] = { -1,0 },
			[7] = { -1,0 },
			[3] = { 31,0 },
			[4] = { 94,0 },
			[8] = { 123,0 },
			[6] = { 67,0 },
			[11] = { 243,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			["p0"] = { -1,0 },
			["p1"] = { 26,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 122,0 },
			[5] = { -1,0 },
			[7] = { -1,0 },
			[3] = { 18,0 },
			[4] = { 97,0 },
			[8] = { 153,0 },
			[6] = { 70,0 },
			[11] = { 251,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			["p0"] = { -1,0 },
			["p1"] = { 28,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["paciente"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[5] = { -1,0 },
			[7] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 61,0 },
			[8] = { 15,0 },
			[6] = { 16,0 },
			[11] = { 104,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			["p0"] = { 28,1 },
			["p1"] = { 7,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[5] = { -1,0 },
			[7] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 15,3 },
			[8] = { 7,0 },
			[6] = { 5,0 },
			[11] = { 5,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			["p0"] = { 29,1 },
			["p1"] = { 15,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	}
}


RegisterCommand('roupas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
--	if vRP.hasPermission(user_id,"polpar.permissao") then
		if args[1] then
			local custom = roupas[tostring(args[1])]
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
		else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de roupa.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLUSA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('blusa',source,args[1],args[2])
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de  Roupas para mudar a blusa.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JAQUETA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('jaqueta',source,args[1],args[2])
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de  Roupas para mudar a jaqueta.")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- CALCA
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('calca',source,args[1],args[2])
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de  Roupas para mudar a calca.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent('maos',source,args[1],args[2])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACESSORIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('acessorios',source,args[1],args[2])
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de  Roupas para mudar os acessorios.")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- SAPATO
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
  local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('sapatos',source,args[1],args[2])
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de  Roupas para mudar o sapato.")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- Chapeu
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	  if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		  TriggerClientEvent('chapeu',source,args[1],args[2])
	  else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de  Roupas para mudar o chapeu.")
	  end
  end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- Chapeu
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		  TriggerClientEvent('oculos',source,args[1],args[2])
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de  Roupas para mudar o oculos.")
	end
end)

RegisterCommand('ems',function(source,args,rawCommand)
    local ems = vRP.getUsersByPermission("paramedico.permissao")
    if parseInt(#ems) >= 1 then
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"Paramédicos em serviço: "..#ems)        
    else
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"Nenhum Paramédicos em serviço")
    end
end)
RegisterCommand('ptr',function(source,args,rawCommand)
    local policia = vRP.getUsersByPermission("policia.permissao")
    if parseInt(#policia) >= 1 then
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"Policiais em serviço: "..#policia)        
    else
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"Nenhum policial em serviço")    
    end
end)
RegisterCommand('adv',function(source,args,rawCommand)
    local advs = vRP.getUsersByPermission("Advogado.permissao")
    if parseInt(#advs) >= 1 then
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"advogados em serviço: "..#advs)        
    else
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"Nenhum advogado em serviço")    
    end
end)
RegisterCommand('prof',function(source,args,rawCommand)
    local ins = vRP.getUsersByPermission("instrutor.permissao")
    if parseInt(#ins) >= 1 then
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"instrutor em serviço: "..#ins)        
    else
        TriggerClientEvent('chatMessage',source,"ALERTA",{255,0,0},"Nenhum instrutor em serviço")    
    end
end)
RegisterCommand('tratamento',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"paramedico.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,3)
		if nplayer then
		    if vRP.tryGetInventoryItem(user_id,"morfina",1)then
			    local sdasdasdok = vRP.request(nplayer,"<b>Deseja aceitar uma injeção de morfina?</b> ",10)
		        if sdasdasdok then 
			        TriggerClientEvent('tratamento',nplayer)
			        TriggerClientEvent("Notify",nplayer,"sucesso","Tratamento iniciado, aguarde a liberação do paramédico.")
			        TriggerClientEvent("Notify",source,"sucesso","Tratamento no paciente iniciado com sucesso.")
				end
			end
		end
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------
--/cobrar
---------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cobrar',function(source,args,rawCommand)
        local user_id = vRP.getUserId(source)
        local consulta = vRPclient.getNearestPlayer(source,2)
        local nuser_id = vRP.getUserId(consulta)
        local resultado = json.decode(consulta) or 0
        local banco = vRP.getBankMoney(nuser_id)
        local identity =  vRP.getUserIdentity(user_id)
        local identityu = vRP.getUserIdentity(nuser_id)
        if vRP.request(consulta,"Deseja pagar <b>$"..vRP.format(parseInt(args[1])).."</b> reais para <b>"..identity.name.." "..identity.firstname.."</b>?",30) then    
            if banco >= parseInt(args[1]) then
                vRP.setBankMoney(nuser_id,parseInt(banco-args[1]))
                vRP.giveBankMoney(user_id,parseInt(args[1]))
                TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>$"..vRP.format(parseInt(args[1])).." reais</b> de <b>"..identityu.name.. " "..identityu.firstname.."</b>.")
                local player = vRP.getUserSource(parseInt(args[2]))
                if player == nil then
                    return
                else
                    local identity = vRP.getUserIdentity(user_id)
                    TriggerClientEvent("Notify",player,"importante","<b>"..identity.name.." "..identity.firstname.."</b> transferiu <b>$"..vRP.format(parseInt(args[1])).." reais</b> para sua conta.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
            end
        end
    end)