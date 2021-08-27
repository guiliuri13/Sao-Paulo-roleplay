local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "bennys" then
		vRP.teleport(936.84185791016,-989.1201171875,38.323406219482)
	elseif data == "garagem-centr" then
		vRP.teleport(216.28608703614,-810.92071533204,30.704326629638)
	elseif data == "garagem-prai" then
		vRP.teleport( -1186.9260253906,-1509.3853759766,4.3796701431274)
	elseif data == "hospital" then
		vRP.teleport(292.35021972656,-560.78424072266,43.264938354492)
	elseif data == "bc" then
		vRP.teleport(232.53332519532,210.26301574708,105.4331665039)
	elseif data == "dp" then
		vRP.teleport( 417.43133544922,-969.19903564454,29.4305934906)
	end
	ToggleActionMenu()
	TriggerEvent("ToogleBackCharacter")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE LOGIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vrp:ToogleLoginMenu')
AddEventHandler('vrp:ToogleLoginMenu',function()
	ToggleActionMenu()
end)