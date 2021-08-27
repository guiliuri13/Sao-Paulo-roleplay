-----------------------------------------------------------------------------------------------------------------------------------------
-- ITENSNOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("itensNotify")
AddEventHandler("itensNotify",function(mode,mensagem,item)
	TriggerEvent("vrp_sound:source",'notify',0.2)
	SendNUIMessage({ mode = mode, mensagem = mensagem, item = item })
end)