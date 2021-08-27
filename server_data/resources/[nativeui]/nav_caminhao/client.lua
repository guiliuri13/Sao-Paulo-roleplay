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
	if data == "gas-01" then
		spawnVehicle("tanker2",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Combustível</b> liberada.")
	elseif data == "gas-02" then
		spawnVehicle("tanker2",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Combustível</b> liberada.")
	elseif data == "gas-03" then
		spawnVehicle("tanker2",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Combustível</b> liberada.")

	elseif data == "diesel-01" then
		spawnVehicle("armytanker",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Diesel</b> liberada.")
	elseif data == "diesel-02" then
		spawnVehicle("armytanker",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Diesel</b> liberada.")
	elseif data == "diesel-03" then
		spawnVehicle("armytanker",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Diesel</b> liberada.")

	elseif data == "show-01" then
		spawnVehicle("tvtrailer",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Shows</b> liberada.")
	elseif data == "show-02" then
		spawnVehicle("tvtrailer",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Shows</b> liberada.")
	elseif data == "show-03" then
		spawnVehicle("tvtrailer",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Shows</b> liberada.")

	elseif data == "woods-01" then
		spawnVehicle("trailerlogs",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")
	elseif data == "woods-02" then
		spawnVehicle("trailerlogs",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")
	elseif data == "woods-03" then
		spawnVehicle("trailerlogs",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Madeiras</b> liberada.")

	elseif data == "cars-01" then
		spawnVehicle("tr4",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Veículos</b> liberada.")
	elseif data == "cars-02" then
		spawnVehicle("tr4",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Veículos</b> liberada.")
	elseif data == "cars-03" then
		spawnVehicle("tr4",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>Veículos</b> liberada.")

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)

function spawnVehicle(name,x,y,z)
	local mhash = GetHashKey(name)
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		Citizen.Wait(10)
	end

	if HasModelLoaded(mhash) then
		local nveh = CreateVehicle(mhash,x,y,z+0.5,270.90,true,false)

		SetVehicleOnGroundProperly(nveh)
		SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
		SetEntityAsMissionEntity(nveh,true,true)

		SetModelAsNoLongerNeeded(mhash)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1151.90,-3249.53,5.90,true)
		if distance <= 1.2 then
			if IsControlJustPressed(0,38) then
				ToggleActionMenu()
			end
		end
	end
end)