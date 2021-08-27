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
	if data == "relogioroubado" then
		TriggerServerEvent("jewelry-vender","relogioroubado")
	elseif data == "pulseiraroubada" then
		TriggerServerEvent("jewelry-vender","pulseiraroubada")
	elseif data == "anelroubado" then
		TriggerServerEvent("jewelry-vender","anelroubado")
	elseif data == "colarroubado" then
		TriggerServerEvent("jewelry-vender","colarroubado")
	elseif data == "brincoroubado" then
		TriggerServerEvent("jewelry-vender","brincoroubado")
	elseif data == "carteiraroubada" then
		TriggerServerEvent("jewelry-vender","carteiraroubada")
	elseif data == "carregadorroubado" then
		TriggerServerEvent("jewelry-vender","carregadorroubado")
	elseif data == "tabletroubado" then
		TriggerServerEvent("jewelry-vender","tabletroubado")
	elseif data == "sapatosroubado" then
		TriggerServerEvent("jewelry-vender","sapatosroubado")
	elseif data == "vibradorroubado" then
		TriggerServerEvent("jewelry-vender","vibradorroubado")
	elseif data == "perfumeroubado" then
		TriggerServerEvent("jewelry-vender","perfumeroubado")
	elseif data == "maquiagemroubada" then
		TriggerServerEvent("jewelry-vender","maquiagemroubada")
	elseif data == "barra1roubada" then
		TriggerServerEvent("jewelry-vender","barradiamante")
	elseif data == "barra2roubada" then
		TriggerServerEvent("jewelry-vender","barraouro")

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),605.44598388672,-3093.1130371094,6.0692572593688,true)
		if distance <= 30 then
			DrawMarker(23,605.44598388672,-3093.1130371094,6.0692572593688-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,20,0,0,0,0)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)


-- 707.31,-966.99,30.41 Original
-- 607.010,-3091.285,6.069 Test

--Citizen.CreateThread(function()
--	SetNuiFocus(false,false)
--	while true do
--		Citizen.Wait(1)
--		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),707.31,-966.99,30.41,true)
--		if distance <= 30 then
--			DrawMarker(23,707.31,-966.99,30.41-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,20,0,0,0,0)
--			if distance <= 1.2 then
--				if IsControlJustPressed(0,38) then
--					ToggleActionMenu()
--				end
--			end
--		end
--	end
--end)