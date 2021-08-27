local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
		TriggerEvent("hideHud")
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
		TriggerEvent("showHud")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ BUTTON ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if data == "-1andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,331.187,-592.63,28.9,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "-2andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,335.91,-580.07,28.90,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "-3andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,-1096.06,-850.59,13.69,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "terreo" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,335.80,-580.14,43.29,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "3andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,335.80,-580.14,43.29,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "4andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,331.12,-593.15,43.28,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "5andar" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,-1096.06,-850.59,34.37,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)

	elseif data == "heli" then
		DoScreenFadeOut(1000)
		ToggleActionMenu()
		SetTimeout(1400,function()
			SetEntityCoords(ped,335.87,-579.97,74.07,0,0,0,0)
			SetEntityHeading(ped,32.76)
			TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
			DoScreenFadeIn(1000)
		end)
		
	elseif data == "nothing" then
		TriggerEvent("Notify","negado","Botão quebrado.")
	
	elseif data == "fechar" then
		ToggleActionMenu()
	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local elevator = {
	{ ['x'] = 331.18, ['y'] = -592.63, ['z'] = 28.9 }, -- -1

	{ ['x'] = 335.91, ['y'] = -580.07, ['z'] = 28.90 }, -- -2

	{ ['x'] = -1096.04, ['y'] = -850.32, ['z'] = 26.83 }, -- -3

	{ ['x'] = 335.80, ['y'] = -580.14, ['z'] = 43.29 }, -- T
	
	{ ['x'] = 335.80, ['y'] = -580.14, ['z'] = 48.29 }, -- 3

	{ ['x'] =  331.12, ['y'] = -593.15, ['z'] = 43.28 }, -- 4

	{ ['x'] = -1096.04, ['y'] = -850.32, ['z'] = 34.37 }, -- 5

	{ ['x'] = 335.87, ['y'] = -579.97, ['z'] = 74.07 }, -- HELI
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MENU ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000

		for k,v in pairs(elevator) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local elevator = elevator[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), elevator.x, elevator.y, elevator.z, true ) <= 2 then
				sleep = 5
				DrawText3D(elevator.x, elevator.y, elevator.z, "[~g~E~w~] Para ~g~ABRIR~w~ o elevador.")
			end
			
			if distance <= 15 then
				sleep = 5
				DrawMarker(30, elevator.x, elevator.y, elevator.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,140,255,90,0,0,0,1)
				if distance <= 2.3 then
					if IsControlJustPressed(0,38) then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end