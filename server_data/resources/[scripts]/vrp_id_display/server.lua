local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPidd = {}
IDDclient = Tunnel.getInterface("vrp_id_display_new","vrp_id_display_new")
vRPclient = Tunnel.getInterface("vRP","vrp_id_display_new")
Tunnel.bindInterface("vrp_id_display_new",vRPidd)
Proxy.addInterface("vrp_id_display_new",vRPidd)
vRP = Proxy.getInterface("vRP")

AddEventHandler("vRP:playerLeave",function(user_id, source) 
	local users = vRP.getUsers()
	for k,v in pairs(users) do
	  IDDclient.removeUser(v,user_id)
	end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn) 
	local users = vRP.getUsers()
	
	if vRP.hasPermission(user_id,"admin.permissao") then
		for k,v in pairs(users) do
			IDDclient.insertUser(source, k, v)
		end
	else
		for k,v in pairs(users) do
			if vRP.hasPermission(k,"admin.permissao") then
				--IDDclient.insertUser(source, k, v)
				IDDclient.insertUser(v, user_id, source)
			end
		end
	end
end)