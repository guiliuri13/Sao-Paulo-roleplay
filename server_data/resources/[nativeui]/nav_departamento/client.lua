-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
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
	if data == "utilidades-comprar-isca" then
		TriggerServerEvent("departamento-comprar","isca")
	elseif data == "utilidades-comprar-garrafa" then
		TriggerServerEvent("departamento-comprar","garrafavazia")
	elseif data == "utilidades-comprar-militec" then
		TriggerServerEvent("departamento-comprar","militec")
	elseif data == "utilidades-comprar-reparos" then
		TriggerServerEvent("departamento-comprar","repairkit")
	elseif data == "utilidades-comprar-ferramentas" then
		TriggerServerEvent("departamento-comprar","ferramenta")
	elseif data == "utilidades-comprar-bandagem" then
		TriggerServerEvent("departamento-comprar","bandagem")
	elseif data == "vestuario-comprar-radio" then
		TriggerServerEvent("departamento-comprar","radio")
	elseif data == "utilidades-comprar-serra" then
		TriggerServerEvent("departamento-comprar","serra")
	elseif data == "utilidades-comprar-furadeira" then
		TriggerServerEvent("departamento-comprar","furadeira")	
	elseif data == "utilidades-vender-isca" then
		TriggerServerEvent("departamento-vender","isca")
	elseif data == "utilidades-vender-garrafa" then
		TriggerServerEvent("departamento-vender","garrafavazia")
	elseif data == "utilidades-vender-militec" then
		TriggerServerEvent("departamento-vender","militec")
	elseif data == "utilidades-vender-reparos" then
		TriggerServerEvent("departamento-vender","repairkit")
	elseif data == "utilidades-vender-ferramentas" then
		TriggerServerEvent("departamento-vender","ferramenta")
	elseif data == "utilidades-vender-serra" then
		TriggerServerEvent("departamento-vender","serra")
	elseif data == "utilidades-vender-furadeira" then
		TriggerServerEvent("departamento-vender","furadeira")	
	elseif data == "vestuario-comprar-mochila" then
		TriggerServerEvent("departamento-comprar","mochila")
	elseif data == "vestuario-comprar-roupas" then
		TriggerServerEvent("departamento-comprar","roupas")	
	elseif data == "vestuario-comprar-alianca" then
		TriggerServerEvent("departamento-comprar","alianca")
	elseif data == "vestuario-vender-mochila" then
		TriggerServerEvent("departamento-vender","mochila")
	elseif data == "vestuario-vender-alianca" then
		TriggerServerEvent("departamento-vender","alianca")
	elseif data == "bebidas-comprar-cerveja" then
		TriggerServerEvent("departamento-comprar","cerveja")
	elseif data == "bebidas-comprar-tequila" then
		TriggerServerEvent("departamento-comprar","tequila")
	elseif data == "bebidas-comprar-vodka" then
		TriggerServerEvent("departamento-comprar","vodka")
	elseif data == "bebidas-comprar-whisky" then
		TriggerServerEvent("departamento-comprar","whisky")
	elseif data == "bebidas-comprar-conhaque" then
		TriggerServerEvent("departamento-comprar","conhaque")
	elseif data == "bebidas-comprar-absinto" then
		TriggerServerEvent("departamento-comprar","absinto")
	elseif data == "bebidas-comprar-energetico" then
		TriggerServerEvent("departamento-comprar","energetico")
	elseif data == "bebidas-vender-cerveja" then
		TriggerServerEvent("departamento-vender","cerveja")
	elseif data == "bebidas-vender-tequila" then
		TriggerServerEvent("departamento-vender","tequila")
	elseif data == "bebidas-vender-vodka" then
		TriggerServerEvent("departamento-vender","vodka")
	elseif data == "bebidas-vender-whisky" then
		TriggerServerEvent("departamento-vender","whisky")
	elseif data == "bebidas-vender-conhaque" then
		TriggerServerEvent("departamento-vender","conhaque")
	elseif data == "bebidas-vender-absinto" then
		TriggerServerEvent("departamento-vender","absinto")
	elseif data == "bebidas-vender-energetico" then
		TriggerServerEvent("departamento-vender","energetico")
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 25.65,-1346.58,29.49 },
	{ 2556.75,382.01,108.62 },
	{ 1163.54,-323.04,69.20 },
	{ -707.37,-913.68,19.21 },
	{ -47.73,-1757.25,29.42 },
	{ 373.90,326.91,103.56 },
	{ -3243.10,1001.23,12.83 },
	{ 1729.38,6415.54,35.03 },
	{ 547.90,2670.36,42.15 },
	{ 1960.75,3741.33,32.34 },
	{ 2677.90,3280.88,55.24 },
	{ 1698.45,4924.15,42.06 },
	{ -1820.93,793.18,138.11 },
	{ 1392.46,3604.95,34.98 },
	{ -2967.82,390.93,15.04 },
	{ -3040.10,585.44,7.90 },
	{ 1135.56,-982.20,46.41 },
	{ 1165.91,2709.41,38.15 },
	{ -1487.18,-379.02,40.16 },
	{ -1222.78,-907.22,12.32 },
	{ 269.78,-980.04,29.36 }, --praça
    { -1095.55,-2594.57,13.92 } -- aeroporto
}

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(5)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 4.0 then
				DrawMarker(21,x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,0,255,50,0,0,0,1)
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)