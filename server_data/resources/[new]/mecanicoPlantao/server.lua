local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("mecanico",func)

local cobrar = true
local valorAtendimento = 1000
finalizados = {}

function func.checkMecanico()
local samu = vRP.getUsersByPermission("mecanico.permissao")

if #samu == 0 then
 
return true
end
end

RegisterServerEvent("verificaMec")
AddEventHandler(
    "verificaMec",
    function()

local mec = vRP.getUsersByPermission("mecanico.permissao")
local source = source
        local player = vRP.getUserId(source)
if #mec == 0 then
TriggerClientEvent("semMec", source)
else
TriggerClientEvent("comMec", source)
end

end)

RegisterServerEvent("repararCarro")
AddEventHandler(
    "repararCarro",
    function()
    print("teste")
        local source = source
        local player = vRP.getUserId(source)
        local perguntaSamu = vRP.request(source, "Você deseja chamar o Mecânico ?!", 60)
        if perguntaSamu and not finalizados[player] then
            local source = vRP.getUserSource(player)
            if cobrar then
                if vRP.tryPayment(player, valorAtendimento) then
                    TriggerClientEvent("chamaMecanico", source)
                    TriggerClientEvent("Notify", source, "Sucesso", "Você pagou R$" ..valorAtendimento.. " Pelo atendimento. Aguarde no local!")
                end
            else
                TriggerClientEvent("chamaMecanico", source)
                TriggerClientEvent("Notify", source, "aviso", "Aguarde no local!")
            end
        end
    end
)

RegisterServerEvent("reparar:Carro")
AddEventHandler(
    "reparar:Carro",
    function()
   local user_id = vRP.getUserId(source)
	
local vehicle = vRPclient.getNearestVehicle(source,7)
TriggerClientEvent('reparar',source,vehicle)
    TriggerClientEvent("fecharGui", source)

    end
)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)