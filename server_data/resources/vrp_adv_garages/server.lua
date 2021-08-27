local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vRPgarage = Tunnel.getInterface("vrp_adv_garages")

vRP._prepare("vRP/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @tuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")
vRP._prepare("vRP/remove_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/get_vehicles","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/get_detido","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/get_maxcars","SELECT COUNT(vehicle) as quantidade FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/set_vehstatus","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/count_vehicle","SELECT COUNT(*) as qtd FROM vrp_user_vehicles WHERE vehicle = @vehicle")

local cfg = module("vrp_adv_garages","cfg/garages")
local cfg_inventory = module("vrp","cfg/inventory")

local garage_types = cfg.garage_types
local totalgaragem = 1

local veh_models_ids = Tools.newIDGenerator()
local veh_models = {}

for group,vehicles in pairs(garage_types) do
	for veh_model,_ in pairs(vehicles) do
		if not veh_models[veh_model] then
			veh_models[veh_model] = veh_models_ids:gen()
		end
	end
end

local carros = {
	["ds4"] = { price = 73000},
	["punto"] = { price = 70000},
	["f150"] = { price = 175000},
	["fusion"] = { price = 100000},
	["fordka"] = { price = 45000},
	["vwgolf"] = { price = 60000},
	["civic"] = { price = 55000},
	["eletran17"] = { price = 110000},
	["sonata18"] = { price = 120000},
	["veloster"] = { price = 85000},
	["monza"] = { price = 13000},
	["p207"] = { price =  23000},
	["vwpolo"] = { price =  90000},
	["evoq"] = { price =  220000},
	["santafe"] = { price =  140000},
	["celta"] = { price =  17000},
	["amarok"] = { price =  185000},
	["civic2016"] = { price =  120000},
	["fiat"] = { price =  10000},
	["jetta2017"] = { price =  200000},
	["l200civil"] = { price =  180000},
	["saveiro"] = { price =  70000},
	["upzinho"] = { price =  20000},
	["voyage"] = { price =  40000},
	["golg7"] = { price =  85000},
	["fiattoro"] = { price =  80000},
	["palio"] = { price =  20000},
	["fiatuno"] = { price =  15000},
	["fiatstilo"] = { price =  80000},
	["surfer"] = { price =  50000},
	["panto"] = { price =  5000},
	["blista"] = { price =  60000},
	["sultanrs"] = { price =  150000},
	["bison"] = { price =  200000},
	["rhapsody"] = { price =  7000},
	["prairie"] = { price =  10000},
	["felon"] = { price =  70000},
	["jackal"] = { price =  60000},
	["oracle"] = { price =  60000},
	["brioso"] = { price =  30000},
	["vivace"] = { price =  23000},
	["biz25"] = { price =  10000},
	["150"] = { price =  13000},
	["bros60"] = { price =  25000},
	["xt66"] = { price =  40000},
	["450crf"] = { price =  100000},
	["xj"] = { price =  240000},
	["hornet"] = { price =  260000},
	["dm1200"] = { price =  300000},
	["z1000"] = { price =  290000},
	["faggio2"] = { price =  5000},
	["bati"] = { price =  300000},
	["hakuchou"] = { price =  310000},
	["manchez"] = { price =  290000},
	["sanchez2"] = { price =  150000},
	["double"] = { price =  300000},
	["diablous2"] = { price =  380000},
	["zombiea"] = { price =  230000},
	["akuma"] = { price =  420000},
	["bf400"] = { price =  260000},
	["carbonrs"] = { price = 300000},
	["daemon2"] = { price =  200000},
	["hexer"] = { price =  180000},
	["nightblade"] = { price =  340000},
	["sanchez"] = { price =  150000},
	["vader"] = { price =  280000},
	["vortex"] = { price =  300000},
	["wolfsbane"] = { price =  230000},
	["zombieb"] = { price =  235000},
	["blazer"] = { price =  200000},
	["audirs6"] = { price = 500000},
	["bmwm3f80"] = { price = 500000},
	["bmwm4gts"] = { price =  500000},
	["dodgechargersrt"] = { price = 500000},
	["ferrariitalia"] = { price = 1000000},
	["fordmustang"] = {price = 200000},
	["lamborghinihuracan"] = { price =  450000},
	["lancerevolutionx"] = { price =  500000},
	["mazdarx7"] = { price =  40000},
	["mercedesamgc63"] = { price =  500000},
	["nissan370z"] = { price =  500000},
	["nissangtr"] = { price =  500000},
	["nissanskyliner34"] = { price =  300000},
	["paganihuayra"] = { price =  500000},
	["teslaprior"] = { price =  850000, 500000},
	["toyotasupra"] = { price =  100000},
	["r1250"] = { price =   5000},
	["r1"] = { price =   300000},
	["senna"]  = { price =   5000000},
	["slsamg"]  = { price =   5000000},
	["palameila"]  = { price =   5000000},
	["18macan"]  = { price =   5000000},
    ["lamtmc"]  = { price =   5000000},
	["aperta"]  = { price =   5000000},
	["eleanor"]  = { price =   5000000},
	["defiant"]  = { price =   5000000},
	["2018zl1"]  = { price =   5000000},
	["amggtr"]  = { price =   5000000},
	["lp700r"]  = { price =   5000000},
	["fxxkevo"]  = { price =   5000000},
	["i8"]  = { price =   5000000},
	["911r"]  = { price =   5000000},
	["19ramdonk"]  = { price =   5000000},
	["g65amg"]  = { price =   5000000},
	
	["versa"]  = { price =1000000}, --- lance ---
    ["passat"]  = { price =1000000},
    ["cronos"]  = { price =1000000},
    ["uno"] = { price =1000000},
    ["jetta"]  = { price =1000000},
    ["astra"]  = { price =1000000},
    ["palio97"]  = { price =1000000},
    ["fusca"]  = { price =1000000},
    ["corsa98"]  = { price =1000000},
    ["s10"]  = { price = 1000000},
    ["saveirog6"]  = { price =1000000},
    ["tritonhpe"]  = { price =1000000},
    ["hilux2016"]  = { price =1000000},
    ["cbrr"]  = { price =1000000},
    ["bmws"]  = { price =1000000},
    ["palio97"]  = { price =1000000},
}
local webconce = "https://discordapp.com/api/webhooks/738496811450237019/IJR0eb84zVGvNdQNhsL10WdRImyi0SoCV1g2GOwLcn77pmHMw8E7u60lnBJ-VRWr6QkX"


function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end
local idveh = {}
RegisterServerEvent("vrp_adv_garages_id")
AddEventHandler("vrp_adv_garages_id",function(netid,enginehealth,bodyhealth,fuel)
	if idveh[netid] and netid ~= 0 then
		local user_id = idveh[netid][1]
		local carname = idveh[netid][2]
		local player = vRP.getUserSource(user_id)
		if player then
			vRPgarage.despawnGarageVehicle(player,carname)
		end

		if enginehealth < 0 then
			enginehealth = 0
		end

		if bodyhealth < 0 then
			bodyhealth = 0
		end

		if fuel > 100 then
			fuel = 100
		end

		local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = carname })
		if #rows > 0 then
			vRP.execute("vRP/set_vehstatus",{ user_id = user_id, vehicle = carname, engine = parseInt(enginehealth), body = parseInt(bodyhealth), fuel = parseInt(fuel) })
		end
	end
end)

function openGarage(source,gid,payprice,location)
	local source = source
	local user_id = vRP.getUserId(source)
	local vehicles = garage_types[gid]
	local gtypes = vehicles._config.gtype
	local mods = vehicles._shop
	local menu = { name = gid }

	for _,gtype in pairs(gtypes) do
		if gtype == "personal" then
			menu["Possuídos"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Possuídos" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = vname })
							local data = vRP.getSData("custom:u"..user_id.."veh_"..vname)
							local custom = json.decode(data) or ""
							if not payprice then
								vRP.closeMenu(source)
								local cond,netid,carname = vRPgarage.spawnGarageVehicle(source,vname,custom,parseInt(rows[1].engine),parseInt(rows[1].body),parseInt(rows[1].fuel),parseInt(location))
								if cond then
									idveh[netid] = { user_id,carname }
								else
									TriggerClientEvent("Notify",source,"aviso","Já tem um veículo deste modelo fora da garagem.")
								end
							else
								
									vRP.closeMenu(source)
									local cond,netid,carname = vRPgarage.spawnGarageVehicle(source,vname,custom,parseInt(rows[1].engine),parseInt(rows[1].body),parseInt(rows[1].fuel),parseInt(location))
									if cond then
										idveh[netid] = { user_id,carname }
									else
										TriggerClientEvent("Notify",source,"aviso","Já tem um veículo deste modelo fora da garagem.")
									end
							end
						end
					end

					local choosedetido = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local ok = vRP.request(source,"Veículo na detenção, deseja acionar o seguro pagando <b>R$"..vRP.format(parseInt(carros[vname].price*0.1)).."</b> ?",60)
							if ok then
								if vRP.tryFullPayment(user_id,parseInt(carros[vname].price*0.1)) then
									vRP.closeMenu(source)
									vRP.execute("vRP/set_detido",{ user_id = user_id, vehicle = vname, detido = 0, time = 0 })
									TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.")
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
								end
							end
						end
					end

					local choosedetidotime = function(source,choice)
						local vname = kitems[choice]
						if vname then
							local ok = vRP.request(source,"Veículo na retenção, deseja acionar o seguro pagando <b>R$"..vRP.format(parseInt(carros[vname].price*0.2)).."</b>?",60)
							if ok then
								if vRP.tryFullPayment(user_id,parseInt(carros[vname].price*0.2)) then
									vRP.closeMenu(source)
									TriggerClientEvent("Notify",source,"sucesso","Seguradora foi acionada, aguarde a notificação da liberação.")
									TriggerClientEvent("progress",source,10000,"liberando")
									SetTimeout(10000,function()
										vRP.execute("vRP/set_detido",{ user_id = user_id, vehicle = vname, detido = 0, time = 0 })
										TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.")
									end)
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
								end
							end
						end
					end

					local pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					for k,v in pairs(pvehicles) do
						local vehicle
						for x,garage in pairs(garage_types) do
							vehicle = garage[v.vehicle]
							if vehicle then break end
						end

						if vehicle then
							local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = v.vehicle })
							if parseInt(rows[1].detido) <= 0 then
								submenu[vehicle[1]] = { choose,"<text01>Lataria:</text01> <text02>"..vRP.format(parseInt(rows[1].body*0.1)).."%</text02><text01>Motor:</text01> <text02>"..vRP.format(parseInt(rows[1].engine*0.1)).."%</text02><text01>Gasolina:</text01> <text02>"..vRP.format(parseInt(rows[1].fuel)).."%</text02><text01>Seguro:</text01> <text02>RS"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.005)).."</text02><text01>Detenção:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.1)).."</text02><text01>Retenção:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.5)).."</text02>" }
							else
								if os.time() <= parseInt(rows[1].time+24*60*60) then
									submenu[vehicle[1]] = { choosedetidotime,"<text01>Lataria:</text01> <text02>"..vRP.format(parseInt(rows[1].body*0.1)).."%</text02><text01>Motor:</text01> <text02>"..vRP.format(parseInt(rows[1].engine*0.1)).."%</text02><text01>Gasolina:</text01> <text02>"..vRP.format(parseInt(rows[1].fuel)).."%</text02><text01>Seguro:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.005)).."</text02><text01>Detenção:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.1)).."</text02><text01>Retenção:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.5)).."</text02>" }
								else
									submenu[vehicle[1]] = { choosedetido,"<text01>Lataria:</text01> <text02>"..vRP.format(parseInt(rows[1].body*0.1)).."%</text02><text01>Motor:</text01> <text02>"..vRP.format(parseInt(rows[1].engine*0.1)).."%</text02><text01>Gasolina:</text01> <text02>"..vRP.format(parseInt(rows[1].fuel)).."%</text02><text01>Seguro:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.005)).."</text02><text01>Detenção:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.1)).."</text02><text01>Retenção:</text01> <text02>R$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.5)).."</text02>" }
								end
							end
							kitems[vehicle[1]] = v.vehicle
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }

			menu["Guardar"] = { function(player,choice)
				local vehicle = vRPclient.getNearestVehicle(source,15)
			    local mPlaca = vRPclient.ModelName(source,7)
	            local mPlacaUser = vRP.getUserByRegistration(mPlaca)
				if vehicle and user_id == mPlacaUser then
					TriggerClientEvent('deletarveiculo',source,vehicle)
				end
			end }
		elseif gtype == "rent" then
		    menu["Guardar"] = { function(player,choice)
				local vehicle = vRPclient.getNearestVehicle(source,15)
			    local mPlaca = vRPclient.ModelName(source,7)
	            local mPlacaUser = vRP.getUserByRegistration(mPlaca)
				if vehicle then				
					TriggerClientEvent('deletarveiculo',source,vehicle)
                end
			end }
			menu["Aluguel"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Aluguel" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local data = vRP.getSData("custom:u"..user_id.."veh_"..vname)
							local custom = json.decode(data) or ""
							local cond,netid,carname = vRPgarage.spawnGarageVehicle(source,vname,custom,1000,1000,100,parseInt(location))
							if cond then
								idveh[netid] = { user_id,carname }
							else
								TriggerClientEvent("Notify",source,"aviso","Já tem um veículo deste modelo fora da garagem.")
							end
							vRP.closeMenu(source)
						end
					end

					local _pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					local pvehicles = {}
					for k,v in pairs(_pvehicles) do
						pvehicles[string.lower(v.vehicle)] = true
					end

					for k,v in pairs(vehicles) do
						if k ~= "_config" and k ~= "_shop" and pvehicles[string.lower(k)] == nil then
							submenu[v[1]] = { choose }
							kitems[v[1]] = k
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }
		elseif gtype == "store" then
			menu["Comprar"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Comprar" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local vehicle = vehicles[vname]
							if vehicle then
								local ok = vRP.request(source,"Tem certeza que deseja <b>comprar</b> este veículo?",30)
								if ok then
									local rows = vRP.query("vRP/count_vehicle",{ vehicle = vname })
									if vehicle[4] ~= -1 and parseInt(rows[1].qtd) >= vehicle[4] then
										TriggerClientEvent("Notify",source,"importante","Estoque indisponivel.")
									else
										local totalv = vRP.query("vRP/get_maxcars",{ user_id = user_id })
										
										if vRP.hasGroup(user_id,"2") then
										    totalgaragem = totalgaragem +1
											TriggerClientEvent("Notify",source,"importante","2.")
										end
										if vRP.hasGroup(user_id,"3") then
										    totalgaragem = totalgaragem +2
											TriggerClientEvent("Notify",source,"importante","3.")
										end
										if vRP.hasGroup(user_id,"4") then
										    totalgaragem = totalgaragem +3
											TriggerClientEvent("Notify",source,"importante","4.")
										end
										if vRP.hasGroup(user_id,"5") then
										    totalgaragem = totalgaragem +4
											TriggerClientEvent("Notify",source,"importante","5.")
										end
										if vRP.hasGroup(user_id,"6") then
										    totalgaragem = totalgaragem +5
											TriggerClientEvent("Notify",source,"importante","6.")
										end
										if vRP.hasGroup(user_id,"7") then
										    totalgaragem = totalgaragem +6
											TriggerClientEvent("Notify",source,"importante","7.")
										end
										if vRP.hasGroup(user_id,"8") then
										    totalgaragem = totalgaragem +7
											TriggerClientEvent("Notify",source,"importante","8.")
										end
										if vRP.hasGroup(user_id,"9") then
										    totalgaragem = totalgaragem +8
											TriggerClientEvent("Notify",source,"importante","9.")
										end
										if vRP.hasGroup(user_id,"10") then
										    totalgaragem = totalgaragem +9
											TriggerClientEvent("Notify",source,"importante","10.")
										end
										
										if parseInt(totalv[1].quantidade) >= totalgaragem then
											TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em sua garagem."..totalgaragem.."")
											return
										end
										
										if vRP.tryFullPayment(user_id,vehicle[2]) then
										    vRP.execute("vRP/add_vehicle",{ user_id = user_id, vehicle = vname })
											if vehicle[2] > 0 then
												TriggerClientEvent("Notify",source,"sucesso","Pagou <b>R$"..vRP.format(parseInt(vehicle[2])).."</b>.")
												local identity = vRP.getUserIdentity(user_id)
												local msg = "```[ADMINISTRAÇÃO] ["..source.."] "..identity.name.." "..identity.firstname.."  comprou "..vname.." por R$"..vRP.format(parseInt(vehicle[2])).."```"
                                                SendWebhookMessage(webconce,msg)
											end
											vRP.closeMenu(source)
										else
											TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
										end
									end
								end
							end
						end
					end

					local _pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					local pvehicles = {}
					for k,v in pairs(_pvehicles) do
						pvehicles[string.lower(v.vehicle)] = true
					end

					for k,v in pairs(vehicles) do
						if k ~= "_config" and k ~= "_shop" and pvehicles[string.lower(k)] == nil then
							if v[2] > 0 then
								submenu[v[1]] = { choose,"<text01>Valor:</text01> <text02>R$"..v[2].."</text02><text01>P-Mala:</text01> <text02>"..v[3].."</text02><text01>Estoque:</text01> <text02>"..v[4].." " }
							else
								submenu[v[1]] = { choose }
							end
							kitems[v[1]] = k
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }
		elseif gtype == "valestore" then
			menu["Comprar"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Comprar" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local vehicle = vehicles[vname]
							if vehicle then
								local ok = vRP.request(source,"Tem certeza que deseja <b>comprar</b> este veículo?",30)
								if ok then
									local rows = vRP.query("vRP/count_vehicle",{ vehicle = vname })
									if vehicle[4] ~= -1 and parseInt(rows[1].qtd) >= vehicle[4] then
										TriggerClientEvent("Notify",source,"importante","Estoque indisponivel.")
									else
										local totalv = vRP.query("vRP/get_maxcars",{ user_id = user_id })
										
										if vRP.hasGroup(user_id,"2") then
										    totalgaragem = totalgaragem +1
											TriggerClientEvent("Notify",source,"importante","2.")
										end
										if vRP.hasGroup(user_id,"3") then
										    totalgaragem = totalgaragem +2
											TriggerClientEvent("Notify",source,"importante","3.")
										end
										if vRP.hasGroup(user_id,"4") then
										    totalgaragem = totalgaragem +3
											TriggerClientEvent("Notify",source,"importante","4.")
										end
										if vRP.hasGroup(user_id,"5") then
										    totalgaragem = totalgaragem +4
											TriggerClientEvent("Notify",source,"importante","5.")
										end
										if vRP.hasGroup(user_id,"6") then
										    totalgaragem = totalgaragem +5
											TriggerClientEvent("Notify",source,"importante","6.")
										end
										if vRP.hasGroup(user_id,"7") then
										    totalgaragem = totalgaragem +6
											TriggerClientEvent("Notify",source,"importante","7.")
										end
										if vRP.hasGroup(user_id,"8") then
										    totalgaragem = totalgaragem +7
											TriggerClientEvent("Notify",source,"importante","8.")
										end
										if vRP.hasGroup(user_id,"9") then
										    totalgaragem = totalgaragem +8
											TriggerClientEvent("Notify",source,"importante","9.")
										end
										if vRP.hasGroup(user_id,"10") then
										    totalgaragem = totalgaragem +9
											TriggerClientEvent("Notify",source,"importante","10.")
										end
										
										if parseInt(totalv[1].quantidade) >= totalgaragem then
											TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em sua garagem."..totalgaragem.."")
											return
										end
										
										if vRP.tryGetInventoryItem(user_id,"vale",vehicle[2],true) then
										    vRP.execute("vRP/add_vehicle",{ user_id = user_id, vehicle = vname })
											if vehicle[2] > 0 then
												TriggerClientEvent("Notify",source,"sucesso","Pagou <b>R$"..vRP.format(parseInt(vehicle[2])).." vale(s)</b>.")
												local identity = vRP.getUserIdentity(user_id)
												local msg = "```[ADMINISTRAÇÃO] ["..source.."] "..identity.name.." "..identity.firstname.."  comprou "..vname.." por "..vRP.format(parseInt(vehicle[2])).." Veles```"
                                                SendWebhookMessage(webconce,msg)
											end
											vRP.closeMenu(source)
										else
											TriggerClientEvent("Notify",source,"negado","vale insuficiente.")
										end
									end
								end
							end
						end
					end

					local _pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					local pvehicles = {}
					for k,v in pairs(_pvehicles) do
						pvehicles[string.lower(v.vehicle)] = true
					end

					for k,v in pairs(vehicles) do
						if k ~= "_config" and k ~= "_shop" and pvehicles[string.lower(k)] == nil then
							if v[2] > 0 then
								submenu[v[1]] = { choose,"<text01>Valor:</text01> <text02>Vales "..v[2].."</text02><text01>P-Mala:</text01> <text02>"..v[3].."</text02><text01>Estoque:</text01> <text02>"..v[4].." " }
							else
								submenu[v[1]] = { choose }
							end
							kitems[v[1]] = k
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }
		elseif gtype == "sell" then
			menu["Vender"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Vender" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local vehicle = vehicles[vname]
							if vehicle then
								local ok = vRP.request(source,"Tem certeza que deseja <b>vender</b> este veículo?",30)
								if ok then
									local price = math.ceil(vehicle[2]*0.7)
									local rows = vRP.query("vRP/get_vehicle",{ user_id = user_id, vehicle = vname })
									if #rows <= 0 then
										return
									end
									if parseInt(rows[1].detido) >= 1 then
										TriggerClientEvent("Notify",source,"aviso","Acione a seguradora antes de vender.")
										return
									end
									vRP.execute("vRP/remove_vehicle",{ user_id = user_id, vehicle = vname })
									vRP.setSData("custom:u"..user_id.."veh_"..vname,json.encode())
									vRP.giveMoney(user_id,parseInt(price))
									if parseInt(price) > 0 then
										TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>R$"..vRP.format(parseInt(price)).."</b>.")
									end
									vRP.closeMenu(source)
								end
							end
						end
					end

					local _pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					local pvehicles = {}
					for k,v in pairs(_pvehicles) do
						pvehicles[string.lower(v.vehicle)] = true
					end

					for k,v in pairs(pvehicles) do
						local vehicle = vehicles[k]
						if vehicle then
							if vehicle[2] > 0 then
								submenu[vehicle[1]] = { choose,"<text01>Valor:</text01> <text02>R$"..parseInt(math.ceil(vehicle[2]*0.7)).."</text02>" }
							else
								submenu[vehicle[1]] = { choose }
							end
							kitems[vehicle[1]] = k
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }
		elseif gtype == "shop" then
			menu["Loja"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				local tosub = false
				if user_id then
					local submenu = { name = "Loja" }
					submenu.onclose = function()
						if not tosub then
							vRP.openMenu(source,menu)
						end
					end

					local ch_color = function(player,choice)
						local old_vname,old_custom = vRPgarage.getVehicleMods(source)
						local subsubmenu = { name = "Cores" }
						subsubmenu.onclose = function()
							tosub = false
							local vname,custom = vRPgarage.getVehicleMods(source)
							if custom then
								if vRP.tryGetInventoryItem(user_id,"tinta",5,true) then
									if vname then
										local mPlaca = vRPclient.ModelName(player,7)
										local mPlacaUser = vRP.getUserByRegistration(mPlaca)
										if mPlacaUser then
											vRP.setSData("custom:u"..mPlacaUser.."veh_"..vname,json.encode(custom))
										end
										TriggerClientEvent("Notify",player,"sucesso","Veículo pintado com sucesso.")
									end
								else
									vRPgarage.setVehicleMods(source,old_custom)
									TriggerClientEvent("Notify",player,"negado","Tinta insuficiente.")
								end
							end
						vRP.openMenu(source,submenu)
					end

					local ch_pri = function(player,choice,mod)
						vRPgarage.scrollVehiclePrimaryColour(source,mod)
					end

					local ch_sec = function(player,choice,mod)
						vRPgarage.scrollVehicleSecondaryColour(source,mod)
					end

					local ch_primaria = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setCustomPrimaryColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					local ch_secundaria = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setCustomSecondaryColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					local ch_perolada = function(player,choice,mod)
						vRPgarage.scrollVehiclePearlescentColour(source,mod)
					end

					local ch_rodas = function(player,choice,mod)
						vRPgarage.scrollVehicleWheelColour(source,mod)
					end

					local ch_fumaca = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setSmokeColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					subsubmenu["Primária"] = { ch_pri }
					subsubmenu["Secundária"] = { ch_sec }
					subsubmenu["Primária RGB"] = { ch_primaria }
					subsubmenu["Secundária RGB"] = { ch_secundaria }
					subsubmenu["Perolada"] = { ch_perolada }
					subsubmenu["Rodas"] = { ch_rodas }
					subsubmenu["Fumaça"] = { ch_fumaca }

					tosub = true
					vRP.openMenu(source,subsubmenu)
				end

				submenu["Cores"] = { ch_color,"<text01></text01> <text02>5 Tintas</text02>" }

				local ch_neon = function(player,choice)
					local old_vname,old_custom = vRPgarage.getVehicleMods(source)
					local subsubmenu = { name = "Neon" }
					subsubmenu.onclose = function()
						tosub = false
						local vname,custom = vRPgarage.getVehicleMods(source)
						if custom then
							if vRP.tryGetInventoryItem(user_id,"tinta",5,true) then
								if vname then
									local mPlaca = vRPclient.ModelName(player,7)
									local mPlacaUser = vRP.getUserByRegistration(mPlaca)
									if mPlacaUser then
										vRP.setSData("custom:u"..mPlacaUser.."veh_"..vname,json.encode(custom))
									end
									TriggerClientEvent("Notify",player,"sucesso","Veículo pintado com sucesso .")
								end
							else
								vRPgarage.setVehicleMods(source,old_custom)
								TriggerClientEvent("Notify",player,"negado","Tinta insuficiente.")
							end
						end
						vRP.openMenu(source,submenu)
					end

					local ch_nleft = function(player,choice)
						vRPgarage.toggleNeon(source,0)
					end

					local ch_nright = function(player,choice)
						vRPgarage.toggleNeon(source,1)
					end

					local ch_nfront = function(player,choice)
						vRPgarage.toggleNeon(source,2)
					end

					local ch_nback = function(player,choice)
						vRPgarage.toggleNeon(source,3)
					end

					local ch_ncolor = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setNeonColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					subsubmenu["Traseiro"] = { ch_nback }
					subsubmenu["Dianteiro"] = { ch_nfront }
					subsubmenu["Esquerdo"] = { ch_nleft }
					subsubmenu["Direito"] = { ch_nright }
					subsubmenu["Cor"] = { ch_ncolor }
					tosub = true
					vRP.openMenu(source,subsubmenu)
				end

				submenu["Neon"] = { ch_neon,"<text01></text01> <text02>Uso de peças</text02>" }

				local ch_mods = function(player,choice)
					local kitems = {}
					local old_vname,old_custom = vRPgarage.getVehicleMods(source)
					local subsubmenu = { name = "Modificações" }
					subsubmenu.onclose = function()
						tosub = false
						local vname,custom = vRPgarage.getVehicleMods(source)
						local price = 0
						local items = {}
						if custom then
							for k,v in pairs(custom.mods) do
								local old = old_custom.mods[k]
								local mod = mods[k]
								if mod then
									if old ~= v then
										if mod[4] then
											items[k] = { mod[4],mod[2] }
										else
											price = price + mod[2]
										end
									end
								end
							end
							if vRP.tryGetInventoryItem(user_id,"parts",price,true) then 
								if vname then
									local mPlaca = vRPclient.ModelName(player,7)
									local mPlacaUser = vRP.getUserByRegistration(mPlaca)
									if mPlacaUser then
										vRP.setSData("custom:u"..mPlacaUser.."veh_"..vname,json.encode(custom))
									end
									if price > 0 then
										TriggerClientEvent("Notify",source,"sucesso","Usou <b>"..vRP.format(parseInt(price)).." Peças</b>.")
									end
								end
							else
								vRPgarage.setVehicleMods(source,old_custom)
								TriggerClientEvent("Notify",source,"negado","Peças insuficiente.")
							end
						end
						vRP.openMenu(source,submenu)
					end

					local ch_mod = function(player,choice,mod)
						vRPgarage.scrollVehicleMods(source,kitems[choice],mod)
					end

					for k,v in pairs(mods) do
						if v[2] > 0 then
							subsubmenu[v[1]] = { ch_mod,"<text01>Valor:</text01> <text02>R$"..parseInt(math.max(v[2],0)).."</text02>" }
						else
							subsubmenu[v[1]] = { ch_mod }
						end
						kitems[v[1]] = k
					end
					tosub = true
					vRP.openMenu(source,subsubmenu)
				end

				local ch_repair = function(player,choice)
					if vRP.tryFullPayment(user_id,3000) then
						TriggerClientEvent('reparar',source)
						TriggerClientEvent("Notify",source,"sucesso","Veículo reparado.")
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
					end
				end

				submenu["Modificações"] = { ch_mods }
				submenu["Reparar"] = { ch_repair,"<text01>Valor:</text01> <text02>R$3.000</text02>" }
				vRP.openMenu(source,submenu)
				end
			end }
		end
	end
	vRP.openMenu(source,menu)
end

local function build_garages(source)
	local source = source
	local user_id = vRP.getUserId(source)
	local address = vRP.getUserAddress(user_id)
	if user_id then
		if #address > 0 then
			for k,v in pairs(cfg.garages) do
				local i,x,y,z,pay,loc = table.unpack(v)
				local g = cfg.garage_types[i]

				if g then
					for kk,vv in pairs(address) do
						local cfg = g._config
						if not cfg.ghome or cfg.ghome == vv.home then
							local garage_enter = function(player,area)
								if user_id and vRP.hasPermissions(user_id,cfg.permissions or {}) then
									openGarage(source,i,pay,loc)
								end
							end

							local garage_leave = function(player,area)
								vRP.closeMenu(source)
							end

							vRPclient._addMarker(source,27,x,y,z-0.95,2,2,0.5,0,95,140,50,100)
							vRP.setArea(source,"vRP:garage"..k,x,y,z,1.0,1.0,garage_enter,garage_leave)
						end
					end
				end
			end
		else
			for k,v in pairs(cfg.garages) do
				local i,x,y,z,pay,loc = table.unpack(v)
				local g = cfg.garage_types[i]

				if g then
					local cfg = g._config
						if not cfg.ghome then
							local garage_enter = function(player,area)
							if user_id and vRP.hasPermissions(user_id,cfg.permissions or {}) then
								openGarage(source,i,pay,loc)
							end
						end

						local garage_leave = function(player,area)
							vRP.closeMenu(source)
						end

						vRPclient._addMarker(source,27,x,y,z-0.95,2,2,0.5,0,95,140,50,100)
						vRP.setArea(source,"vRP:garage"..k,x,y,z,1.0,1.0,garage_enter,garage_leave)
					end
				end
			end
		end
	end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		build_garages(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER O VEÍCULO PARA OUTRO JOGADOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('vehs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local menu = vRP.buildMenu("vehicle",{ user_id = user_id, player = source, vname = name })
		menu.name = "Veículos"

		local kitems = {}
		local choose = function(source,choice)
			local tosub = false
			local vehicle = choice
			local vname = kitems[vehicle]
			local submenu = { name = vehicle }
			submenu.onclose = function()
				tosub = false
				vRP.openMenu(source,menu)
			end

			local ch_sell = function(source,choice)
				local nplayer = vRPclient.getNearestPlayer(source,3)
				if nplayer then
					local tuser_id = vRP.getUserId(nplayer)
					local totalv = vRP.query("vRP/get_maxcars",{ user_id = tuser_id })
					if vRP.hasGroup(tuser_id,"2") then
		                totalgaragem = totalgaragem +1
						TriggerClientEvent("Notify",source,"importante","2.")
					end
					if vRP.hasGroup(tuser_id,"3") then
						totalgaragem = totalgaragem +2
						TriggerClientEvent("Notify",source,"importante","3.")
					end
					if vRP.hasGroup(tuser_id,"4") then
					    totalgaragem = totalgaragem +3
					    TriggerClientEvent("Notify",source,"importante","4.")
					end
					if vRP.hasGroup(tuser_id,"5") then
						totalgaragem = totalgaragem +4
						TriggerClientEvent("Notify",source,"importante","5.")
					end
					if vRP.hasGroup(tuser_id,"6") then
						totalgaragem = totalgaragem +5
						TriggerClientEvent("Notify",source,"importante","6.")
					end
					if vRP.hasGroup(tuser_id,"7") then
						totalgaragem = totalgaragem +6
						TriggerClientEvent("Notify",source,"importante","7.")
					end
					if vRP.hasGroup(tuser_id,"8") then
						totalgaragem = totalgaragem +7
					    TriggerClientEvent("Notify",source,"importante","8.")
					end
					if vRP.hasGroup(tuser_id,"9") then
						totalgaragem = totalgaragem +8
						TriggerClientEvent("Notify",source,"importante","9.")
					end
					if vRP.hasGroup(tuser_id,"10") then
					totalgaragem = totalgaragem +9
						TriggerClientEvent("Notify",source,"importante","10.")
					end
										
					if parseInt(totalv[1].quantidade) >= totalgaragem then
						TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em garagem."..totalgaragem.."")
						return
					end

					local owned = vRP.query("vRP/get_vehicle",{ user_id = tuser_id, vehicle = vname })
					if #owned == 0 then
						local price = tonumber(sanitizeString(vRP.prompt(source,"Valor:",""),"\"[]{}+=?!_()#@%/\\|,.",false))
						local ok = vRP.request(nplayer,"Aceita comprar um <b>"..vehicle.."</b> por <b>R$"..vRP.format(parseInt(price)).."</b>?",30)
						if ok then
							if parseInt(price) > 0 then
								if vRP.tryFullPayment(tuser_id,parseInt(price)) then
									vRP.execute("vRP/move_vehicle",{ user_id = user_id, tuser_id = tuser_id, vehicle = vname })
									local data = vRP.getSData("custom:u"..user_id.."veh_"..vname)
									local custom = json.decode(data) or ""
									vRP.setSData("custom:u"..tuser_id.."veh_"..vname, json.encode(custom))
									vRP.setSData("custom:u"..user_id.."veh_"..vname, json.encode())
									vRP.giveMoney(user_id,parseInt(price))
									TriggerClientEvent("Notify",nplayer,"sucesso","Pagou <b>R$"..vRP.format(parseInt(price)).."</b>.")
									TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>R$"..vRP.format(parseInt(price)).."</b>.")
								else
									TriggerClientEvent("Notify",nplayer,"negado","Dinheiro insuficiente.")
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
								end
							end
						end
					else
						TriggerClientEvent("Notify",nplayer,"importante","Veículo ja possuído.")
						TriggerClientEvent("Notify",source,"importante","Veículo ja possuído.")
					end
				end
			end
			submenu["Vender"] = { ch_sell }
			tosub = true
			vRP.openMenu(source,submenu)
		end

		local choosedetido = function(source,choice)
			TriggerClientEvent("Notify",source,"importante","Veículo roubado ou detido pela policia, acione a seguradora.")
		end

		local pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
		for k,v in pairs(pvehicles) do
			local vehicle
			for x,garage in pairs(garage_types) do
				vehicle = garage[v.vehicle]
				if vehicle then break end
			end

			if vehicle then
				local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = v.vehicle })
				if parseInt(rows[1].detido) <= 0 then
					menu[vehicle[1]] = { choose }
				else
					menu[vehicle[1]] = { choosedetido }
				end
				kitems[vehicle[1]] = v.vehicle
			end
		end

		vRP.openMenu(source,menu)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOTÃO L PARA TRANCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("buttonLock")
AddEventHandler("buttonLock",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,7)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if user_id == mPlacaUser then
		vRPgarage.toggleLock(source)
		TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
	end
end)

RegisterServerEvent("tryLock")
AddEventHandler("tryLock",function(nveh)
	TriggerClientEvent("syncLock",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOTÃO PAGEUP PARA ABRIR PORTA-MALAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("buttonTrunk")
AddEventHandler("buttonTrunk",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local mPlaca,mName,mNet,mPrice,mBanido,mLock = vRPclient.ModelName(source,7)
	if not mLock then
		if mPlaca then
			if mName then
				if mBanido then
					TriggerClientEvent("Notify",source,"negado","Veículos de serviço ou alugados não podem utilizar o Porta-Malas.")
					return
				end
				local mPlacaUser = vRP.getUserByRegistration(mPlaca)
				if mPlacaUser then
					local chestname = "u"..mPlacaUser.."veh_"..string.lower(mName)
					local max_weight = cfg_inventory.vehicle_chest_weights[string.lower(mName)] or 50

					local cb_out = function(idname,amount)
						if parseInt(amount) > 0 then
							TriggerClientEvent("Notify",source,"sucesso","Retirado <b>"..amount.."x "..vRP.getItemName(idname).."</b>.")
						end
					end

					local cb_in = function(idname,amount)
						if parseInt(amount) > 0 then
							TriggerClientEvent("Notify",source,"sucesso","Colocado <b>"..amount.."x "..vRP.getItemName(idname).."</b>.")
						end
					end

					vRPgarage.toggleTrunk(source)
					vRP.openChest(source,chestname,max_weight,function()
						vRPgarage.toggleTrunk(source)
					end,cb_in,cb_out)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANCORAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ancorar',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,7)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if user_id == mPlacaUser then
		vRPgarage.toggleAnchor(source)
	end
end)