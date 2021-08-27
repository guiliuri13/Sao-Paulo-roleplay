local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("reviver",func)

local cobrar = true
local valorAtendimento = 500
finalizados = {}

function func.checkParamedico()
local samu = vRP.getUsersByPermission("samu.permissao")

if #samu == 0 then
 
return true
end
end


RegisterServerEvent("verificaSamu")
AddEventHandler(
    "verificaSamu",
    function()

local samu = vRP.getUsersByPermission("paramedico.permissao")
local source = source
        local player = vRP.getUserId(source)
if #samu == 0 then
TriggerClientEvent("SemSamu", source)
else
 TriggerClientEvent("comSamu", source)
end

end)


RegisterServerEvent("reviver:Player")
AddEventHandler(
    "reviver:Player",
    function()
   local user_id = vRP.getUserId(source)
	
			vRPclient.killGod(source)
			vRPclient.setHealth(source,200)
    TriggerClientEvent("fecharGui", source)

    end
)