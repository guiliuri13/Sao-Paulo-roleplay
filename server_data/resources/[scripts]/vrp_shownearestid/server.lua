local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("vrp_shownearestid",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local user_id = vRP.getUserId(source)
		nplayer = vRPclient.getNearestPlayer(source,2)
		nuser_id = vRP.getUserId(nplayer)
		if nuser_id == nil then
			nuser_id = "NENHUM"
		end	
		print(nuser_id)
	end
end)]]

function func.getNuserId()
	local user_id = vRP.getUserId(source)
	nplayer = vRPclient.getNearestPlayer(source,4)
	nuser_id = vRP.getUserId(nplayer)
	if nuser_id == nil then
		nuser_id = "NENHUM"
	end
	return nuser_id	
end	