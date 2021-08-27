local Tunnel = module("vrp", "lib/Tunnel")
vRPidd = {}
Tunnel.bindInterface("vrp_id_display_new",vRPidd)
users = {}

function vRPidd.insertUser(user_id,source)
	users[user_id] = GetPlayerFromServerId(source)
end

function vRPidd.removeUser(user_id)
	users[user_id] = nil
end




function DrawText3D(x,y,z, text, r,g,b) -- some useful function, use it if you want!
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
      --SetTextScale(0.0*scale, 1.0*scale)
        SetTextFont(6)
        SetTextProportional(1)
        SetTextScale(0.0, 1.55)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end



Citizen.CreateThread(function()
    while true do
        if IsControlPressed(1, 212) then
            x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
            for k,v in pairs(users) do
                if v ~= nil then
                        x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( v ), true ) )
                        distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                    if ((distance < cfg.distance)) then
                        if NetworkIsPlayerTalking( v ) then
                            DrawText3D(x2, y2, z2+1, k, cfg.talker.r, cfg.talker.g, cfg.talker.b) -- talker color
                        else
                            DrawText3D(x2, y2, z2+1, k, cfg.default.r, cfg.default.g, cfg.default.b)
                        end
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)
