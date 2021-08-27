--[[  DON_SPEED ]]

local donspeedid = 0
local donspeedcarregado = false
local bliop = nil

RegisterNetEvent("DonSpeed:InicioParamedico")
AddEventHandler("DonSpeed:InicioParamedico",function()
	
	local vehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
    if IsVehicleModel(vehicle,GetHashKey("sprintersamu")) then
	    if donspeedid == 0 and donspeedcarregado == false then
		   donspeedid = 1
		   CriandoBlip(1826.77, 3693.46, 33.94)
		   TriggerEvent("Notify","importante","Encomenda pronta va buscar .")
		end
	else
	    TriggerEvent("Notify","importante","Sem o caminhao .")
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local carre = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1826.77, 3693.46, 33.94,true)
		if carre < 6.0  then
		    DrawMarker(20,1826.77, 3693.46, 33.94,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)		
			local vehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
			if IsControlJustPressed(0,38) and IsVehicleModel(vehicle,GetHashKey("ambulance")) then	
				if donspeedid == 1 and donspeedcarregado == false  then
				    --FreezeEntityPosition(GetPlayerPedId(), true)
				    TriggerEvent("progress",2000,"CARREGANDO")
				    Citizen.Wait(2000)
					--FreezeEntityPosition(GetPlayerPedId(), false)
			        donspeedid = 2
				    donspeedcarregado = true
				    TriggerServerEvent('DonSpeed:CarregandoPara')
					RemoveBlip(bliop)
				    CriandoBlip(341.27, -562.62, 28.46)
					TriggerEvent("Notify","importante","Carregado com sucesso vá descarregar !")
				end
			end
		end	
		local dsentregue = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 337.42,-572.37,28.79, true)
		if dsentregue < 6.0  then
		    DrawMarker(20,337.42, -572.37, 28.79,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
			local vehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
			if IsControlJustPressed(0,38) and IsVehicleModel(vehicle,GetHashKey("ambulance")) then
				if donspeedid == 2 and donspeedcarregado == true  then
				    RemoveBlip(bliop)
			        donspeedid = 0
				    donspeedcarregado = false
					--FreezeEntityPosition(GetPlayerPedId(), true)
			        TriggerEvent("progress",2000,"DESCARREGANDO")	
				    Citizen.Wait(2000)
					--FreezeEntityPosition(GetPlayerPedId(), false)
				    TriggerServerEvent('DonSpeed:DescarregandoPara')
				    RemoveBlip(bliop)
					TriggerEvent("Notify","importante","Descarregado com sucesso .")
				end
			end
		end	
	end
end)	
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) then
            if dsRota == true then
			    dsRota = false
			    RemoveBlip(bliop)
				TriggerEvent("Notify","importante","Cancelado missao.")
			end
		end
	end
end)
function CriandoBlip(x,y,z)
	bliop = AddBlipForCoord( x,y,z)
	SetBlipSprite(bliop,1)
	SetBlipColour(bliop,5)
	SetBlipScale(bliop,0.4)
	SetBlipAsShortRange(bliop,false)
	SetBlipRoute(bliop,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota")
	EndTextCommandSetBlipName(bliop)
end