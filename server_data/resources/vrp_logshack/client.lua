local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_logshack")

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,121) then -- INSERT
			func.buttonInsert()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,127) then -- NUMPAD 8
			func.buttonNumOito()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,125) then -- NUMPAD 6
			func.buttonNumSeis()
		end
	end
end)
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,172) then -- SETA CIMA
			func.buttonSetaCima()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,172) then -- SETA BAIXO
			func.buttonSetaBaixo()
		end
	end
end) --]]

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,288) then -- F1
			func.buttonfUm()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,344) then -- F1
			func.buttonfOnze()
		end
	end
end)

AddEventHandler('explosionEvent', function(sender, ev)
	local jogador = GetPlayerName(sender)
	local idExplosao = ev.explosionType
	local user_id = vRP.getUserId(sender)
	print(GetPlayerName(sender), json.encode(ev))
	if (idExplosao == 29) then
		PerformHttpRequest("https://discordapp.com/api/webhooks/760374659593273355/2_StZgbmFept_QFCoEalfkDMTudkVhn-0anWVw96HePDxEHTvVqtCqyFqoCxWLXdo9Ny", function(err, text, headers) end, 'POST', json.encode({content =  "**Explosões** ```" .. "ID: " .. user_id .. " Nome: " .. jogador .. "\nServidor: " .. GetConvar('sv_name', 'ND') .. "\nData: " .. os.date("%H:%M:%S %d/%m/%Y") .. "```"}), { ['Content-Type'] = 'application/json' })
	end
  CancelEvent(explosionEvent)
end)