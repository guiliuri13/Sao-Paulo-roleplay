-- DEFAULT --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")
SFclient = Tunnel.getInterface("b2k-safezone","b2k-safezone")

SFzone = {}
Proxy.addInterface("b2k-safezone", SFzone) -- comunicação entre resources
Tunnel.bindInterface("b2k-safezone", SFzone) -- comunicação entre client <-> server