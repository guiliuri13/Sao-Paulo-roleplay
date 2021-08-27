local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_policia",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"policia.permissao")
end

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
	    local a1 = math.random(50,60)
		vRP.giveMoney(user_id,parseInt(a1))
		
		if  vRP.hasPermission(user_id,"ouro.premissao") or vRP.hasPermission(user_id,"prata.permissao") or vRP.hasPermission(user_id,"bronze.permissao")  then
            vRP.giveMoney(user_id,parseInt(a1 / 4))
		elseif vRP.hasPermission(user_id,"diamond.permissao")then
		    vRP.giveMoney(user_id,parseInt(a1 / 3))
	    elseif vRP.hasPermission(user_id, "black.permissao")then
		    vRP.giveMoney(user_id,parseInt(a1 / 2))
		end
	end
end
function emP.Ostensivodd()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
	    local a1 = math.random(100,200)
		vRP.giveMoney(user_id,parseInt(a1))
		
		if  vRP.hasPermission(user_id,"ouro.premissao") or vRP.hasPermission(user_id,"prata.permissao") or vRP.hasPermission(user_id,"bronze.permissao")  then
            vRP.giveMoney(user_id,parseInt(a1 / 4))
		elseif vRP.hasPermission(user_id,"diamond.permissao")then
		    vRP.giveMoney(user_id,parseInt(a1 / 3))
	    elseif vRP.hasPermission(user_id, "black.permissao")then
		    vRP.giveMoney(user_id,parseInt(a1 / 2))
		end
	end
end