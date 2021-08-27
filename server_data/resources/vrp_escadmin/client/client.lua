RegisterCommand("setgroup", function(source, args)
    local id = args[1]
    if (id ~= nil) then
        TriggerServerEvent('vrp_escadmin:buscarGrupos', id)
    end
end)

RegisterNetEvent('vrp_escadmin:abrirAdminG')
AddEventHandler('vrp_escadmin:abrirAdminG',function(sgrupos, pgrupos, playerId)
    local itens = {
        pgrupos,
        sgrupos,
        playerId
    }

    SetNuiFocus(true,true)
    SendNUIMessage({
      conce = true,
      data = itens
    })
end)

RegisterNUICallback('close', function(data, cb)
  limparHTML()
end)

RegisterNUICallback('aceitar', function(data, cb)
    TriggerServerEvent("vrp_escadmin:aceito", data.valores, data.player)
    limparHTML()
end)

function limparHTML() 
    SetNuiFocus(false)
end