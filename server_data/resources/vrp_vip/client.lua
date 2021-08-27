
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000) 
		TriggerServerEvent('Verificar')
	end
end)