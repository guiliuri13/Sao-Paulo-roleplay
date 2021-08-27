local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPN = {}
Tunnel.bindInterface("vrp_identidade",vRPN)
Proxy.addInterface("vrp_identidade",vRPN)

local cfg = module("vrp","cfg/groups")
local groups = cfg.groups
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------


function vRPN.Identidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local cash = vRP.getMoney(user_id)
		local banco = vRP.getBankMoney(user_id)
		local identity = vRP.getUserIdentity(user_id)
		local multas = vRP.getUData(user_id,"vRP:multas")
		local mymultas = json.decode(multas) or 0
		local paypal = vRP.getUData(user_id,"vRP:paypal")
		local mypaypal = json.decode(paypal) or 0
		local groupv = vRPN.getUserGroupByType(user_id,"job")
		local cargo = vRPN.getUserGroupByType(user_id,"cargo")
		
		
		if cargo ~= "" then
			groupv = cargo
		end
		local tem = ""
		if vRP.hasGroup(user_id,"Carta") then
                tem = "Possui"
            else
                tem = "Não possui"
		end
		local tema = ""
		if vRP.hasGroup(user_id,"Porte") then
                tema = "Possui"
            else
                tema = "Não possui"
		end
		local temlider = 0
		if vRP.hasGroup(user_id,"Lider") then
		   temlider = 1
		else
		   temlider = 0
		end
		datavip = ""..vRP.getInventoryItemAmount(user_id,"dias").."D/"..vRP.getInventoryItemAmount(user_id,"horas").."H/"..vRP.getInventoryItemAmount(user_id,"minutos").."M"
		if identity then
			return identity.foto,identity.name,identity.firstname,identity.user_id,identity.registration,identity.age,identity.phone,vRP.format(parseInt(cash)),vRP.format(parseInt(banco)),vRP.format(parseInt(mymultas)),vRP.format(parseInt(mypaypal)),groupv,tem,tema,nvip,datavip,temlider
		end
	end
end

function vRPN.getUserGroupByType(user_id,gtype)
	local user_groups = vRP.getUserGroups(user_id)
	for k,v in pairs(user_groups) do
		local kgroup = groups[k]
		if kgroup then
			if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == gtype then
				return kgroup._config.title
			end
		end
	end
	return ""
end