-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local amenuactive = false
function ToggleActionMenu()
	amenuactive = not amenuactive
	if amenuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)

	if data == "armas-comprar-pistol" then
		TriggerServerEvent("armas-comprar","wbody|WEAPON_REVOLVER")
		
	elseif data == "armas-comprar-municaopistol" then
		TriggerServerEvent("armas-comprar","wammo|WEAPON_REVOLVER")
		
		
	elseif data == "armas-comprar-pistol2" then
		TriggerServerEvent("armas-comprar","wbody|WEAPON_COMBATPISTOL")
		
	elseif data == "armas-comprar-municaopistol2" then
		TriggerServerEvent("armas-comprar","wammo|WEAPON_COMBATPISTOL")
		
	elseif data == "armas-comprar-sub1" then
		TriggerServerEvent("armas-comprar","wbody|WEAPON_MICROSMG")
		
	elseif data == "armas-comprar-msub1" then
		TriggerServerEvent("armas-comprar","wammo|WEAPON_MICROSMG")	
		
	elseif data == "armas-comprar-branca1" then
		TriggerServerEvent("armas-comprar","wbody|WEAPON_DAGGER")	
    elseif data == "armas-comprar-branca2" then
		TriggerServerEvent("armas-comprar","wbody|WEAPON_KNUCKLE")			
	
	elseif data == "armas-comprar-machado1" then
		TriggerServerEvent("armas-comprar","wbody|WEAPON_HATCHET")		
	elseif data == "armas-comprar-machado2" then
		TriggerServerEvent("armas-comprar","wbody|WEAPON_BATTLEAXE")			
			
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 1692.62,3759.50,34.70 },
	{ 252.89,-49.25,69.94 },
	{ 843.28,-1034.02,28.19 },
	{ -331.35,6083.45,31.45 },
	{ -663.15,-934.92,21.82 },
	{ -1305.18,-393.48,36.69 },
	{ -1118.80,2698.22,18.55 },
	{ 2568.83,293.89,108.73 },
	{ -3172.68,1087.10,20.83 },
	{ 21.32,-1106.44,29.79 },
	{ 811.19,-2157.67,29.61 },
}

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(5)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 1.0 then
			    DrawText3D(x,y,z, "LOJA DE ARMAS")
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)
function DrawText3D(x,y,z, text)
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