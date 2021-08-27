RegisterNetEvent('Notify')
AddEventHandler('Notify', function(css,mensagem)
	SendNUIMessage({
		type = css,
		text = mensagem
	})
end)