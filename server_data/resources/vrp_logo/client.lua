local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        SendNUIMessage({
            show = IsPauseMenuActive()
        })
    end
end)
