local Proxy = module("vrp", "lib/Proxy")
local Tunnel =  module("vrp", "lib/Tunnel")
vRP = Proxy.getInterface("vRP")

function hud.GetBasics()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.getThirst(user_id), vRP.getHunger(user_id)
end