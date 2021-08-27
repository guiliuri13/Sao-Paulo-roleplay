
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")



Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1) --[[
		local dsLavagem = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 3585.14,3683.95,27.62,true)
		if dsLavagem <= 3.0  then
		    DSTEXT(3585.14,3683.95,27.62, "PRESSIONE  ~b~E~w~ PARA LAVAR O DINHEIRO ")
		    DrawMarker(27,3585.14,3683.95,27.62-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
			if IsControlJustPressed(0, 38) then	
			   TriggerServerEvent('Don_Speed:Permissao', "milicia.permissao")
			end
		end  --]]
		local dsTwoLavagem = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 23.289,-1398.676,28.747,true)
		if dsTwoLavagem
		<= 3.0  then
		    DSTEXT(23.289,-1398.676,28.747, "PRESSIONE  ~b~E~w~ PARA LAVAR O DINHEIRO")
		    DrawMarker(27,23.289,-1398.676,28.747-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
			if IsControlJustPressed(0, 38) then	
			TriggerServerEvent('Don_Speed:Permissao', "yakuza.permissao")
			end
		end
	end
end)

RegisterNetEvent("Don_Speed:Animacao")
AddEventHandler("Don_Speed:Animacao",function()
    TriggerEvent("progress",10000,"lavando")
    TaskStartScenarioInPlace(GetPlayerPed(-1), "prop_human_bum_bin", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	TriggerServerEvent('Don_Speed:Pagamento')
end)

function DSTEXT(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end