local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPEX = {}
Tunnel.bindInterface("rp-radio",vRPEX)


function vRPEX.checkPermission(grupo)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,grupo) then
    --if vRP.hasGroup(user_id,grupo) then
       return true 
    else
        TriggerClientEvent("Notify",source,"negado","<b>Você não tem permissão para entrar nessa Frequencia</b>.",8000)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKRADIO
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPEX.checkRadio()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
		return true
	else
		TriggerClientEvent("Notify",source,"importante","Você precisa comprar o <b>Rádio</b> em uma <b>Loja de Departamento</b>.",8000)
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDROP
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPEX.checkDrop()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
		return true
	else
		return false
	end
end