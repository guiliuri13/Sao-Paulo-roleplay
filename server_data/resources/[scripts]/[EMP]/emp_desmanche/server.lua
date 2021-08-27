local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_desmanche",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"motoclub.permissao")
end

function emP.checkVehicle()
	local source = source
	local user_id = vRP.getUserId(source)
	local mPlaca,mName,mPrice,mBanido = vRPclient.ModelName2(source)
	local placa_user = vRP.getUserByRegistration(mPlaca)
	if placa_user then
		local rows = vRP.query("vRP/get_detido",{ user_id = placa_user, vehicle = mName })
		if #rows <= 0 then
			TriggerClientEvent("Notify",source,"aviso","Veículo não encontrado na lista do proprietário.")
			return
		end
		if mName then
			if parseInt(rows[1].detido) == 1 then
				TriggerClientEvent("Notify",source,"aviso","Veículo encontra-se apreendido na seguradora.")
				return
			end
			if mBanido then
				TriggerClientEvent("Notify",source,"aviso","Veículos de serviço ou alugados não podem ser desmanchados.")
				return
			end
		end
		return true
	end
end


local vehicleprice = {
    {"audirs6", 200000},
    {"bmwm4gts", 500000}, 
    {"dodgechargersrt", 500000},
    {"ferrariitalia", 500000},
    {"fordmustang", 500000},
    {"lamborghinihuracan", 500000},
    {"lancerevolutionx", 500000},
    {"mazdarx7", 500000},
    {"mercedesamgc63", 500000},
    {"nissan370z", 500000},
    {"nissangtr", 500000},
    {"nissanskyliner34", 500000},
    {"paganihuayra", 500000},
    {"teslaprior", 500000},
    {"toyotasupra", 500000},
    {"r1250", 500000},
    {"senna", 500000},
    {"slsamg", 500000},	    
    {"palameila", 500000},
    {"18macan", 500000},
    {"lamtmc", 500000},
    {"aperta", 500000},
    {"eleanor", 500000},
    {"defiant", 500000},
    {"2018zl1", 500000},
    {"amggtr", 500000},
    {"lp700r", 500000},
    {"fxxkevo", 500000},
    {"i8", 500000},
    {"911r", 500000},
    {"19ramdonk", 500000},
    {"g65amg", 500000},	
    {"ds4", 36500},
    {"punto", 36500},
    {"f150", 91500},
    {"fusion", 50000},
    {"fordka", 22500},
    {"vwgolf", 30000},
    {"civic", 22500},
    {"eletran17", 55000},
    {"sonata18", 60000},
    {"veloster", 42500},
    {"monza", 6500},
    {"p207", 11500},
    {"vwpolo", 45000},
    {"evoq", 110000},
    {"santafe", 70000},
    {"celta", 8500},
    {"amarok", 92500},
    {"civic2016", 60000},
    {"fiat", 5000},
    {"jetta2017", 100000},
    {"l200civil", 90000},
    {"saveiro", 35000},
    {"upzinho", 10000},
    {"voyage", 20000},
    {"golg7", 42500},
    {"fiattoro", 40000},
    {"palio", 10000},
    {"fiatuno", 7500},
    {"fiatstilo", 40000},
    {"surfer", 25000},
    {"panto", 2500 },
    {"blista", 30000},
    {"sultan", 75000},
    {"bison", 100000},
    {"rhapsody", 3500},
    {"prairie", 5000},
    {"felon", 35000},
    {"jackal", 30000}, 
    {"oracle", 30000},
    {"brioso", 15000},
    {"sultan", 125000},
    {"biz25", 5000},
    {"150", 6500},
    {"bros60", 12500},
    {"xt66", 20000},
    {"450crf", 50000},
    {"xj", 120000},
    {"hornet", 130000},
    {"dm1200", 150000},
    {"z1000", 150000},
    {"faggio2", 2500},
    {"bati", 150000},
    {"hakuchou", 150000},
    {"manchez", 150000},
    {"sanchez2", 75000},
    {"double", 150000},
    {"diablous2", 150000},
    {"zombiea", 150000},
    {"akuma", 150000},
    {"bf400", 150000},
    {"carbonrs", 150000},
    {"daemon2", 150000},
    {"hexer", 90000},
    {"nightblade", 150000},
    {"sanchez", 75000},
    {"vader", 150000},
    {"vortex", 150000},
    {"wolfsbane", 115000},
    {"zombieb", 115500},
    {"blazer", 100000}
}



function emP.removeVehicles(mPlaca,mName,mPrice,mNet)
	local source = source
	local user_id = vRP.getUserId(source)
	local placa_user = vRP.getUserByRegistration(mPlaca)
	if placa_user then
		vRP.execute("vRP/set_detido",{ user_id = placa_user, vehicle = mName, detido = 1, time = parseInt(os.time()) })
		for i,v in pairs(vehicleprice) do
		    testea1 = v[1]
			testea2 = v[2]
		    if mName == testea1 then 
			    vRP.giveInventoryItem(user_id,"dinheirosujo", testea2)
				TriggerClientEvent("Notify",source,"sucesso","Desmanchado com sucesso ! R$ "..testea2.."")
			end
		end
		TriggerClientEvent('syncdeleteveh',-1,mNet)
	end
end