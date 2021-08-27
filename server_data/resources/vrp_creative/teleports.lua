local Teleport = {
	["gHospital"] = {
		positionFrom = { ['x'] = 332.31381225586, ['y'] = -595.71020507812, ['z'] = 43.283981323242 },  -- 332.31381225586,-595.71020507812,43.283981323242
		positionTo = { ['x'] = 319.9450378418, ['y'] = -559.9683227539, ['z'] = 28.743427276612 } -- 319.9450378418,-559.9683227539,28.743427276612
    }, 
    ["hHospital"] = {
    positionFrom = { ['x'] = 327.07550048828, ['y'] = -603.75970458984, ['z'] = 43.28398513794 }, --327.07550048828,-603.75970458984,43.28398513794
    positionTo = { ['x'] = 338.64337158204, ['y'] = -583.75299072266, ['z'] = 74.165573120118 } -- 338.64337158204,-583.75299072266,74.165573120118
},    
} 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        for k,j in pairs(Teleport) do
            local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId(),true))
            local distance = GetDistanceBetweenCoords(j.positionFrom.x,j.positionFrom.y,j.positionFrom.z,px,py,pz,true)
            local distance2 = GetDistanceBetweenCoords(j.positionTo.x,j.positionTo.y,j.positionTo.z,px,py,pz,true)

            if distance <= 0.5 then
                DrawMarker(1,j.positionFrom.x,j.positionFrom.y,j.positionFrom.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
                if distance <= 1.5 then
                    if IsControlJustPressed(0,38) then
                        SetEntityCoords(PlayerPedId(),j.positionTo.x,j.positionTo.y,j.positionTo.z-0.50)
                    end
                end
            end

            if distance2 <= 0.5 then
                DrawMarker(1,j.positionTo.x,j.positionTo.y,j.positionTo.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
                if distance2 <= 1.5 then
                    if IsControlJustPressed(0,38) then
                        SetEntityCoords(PlayerPedId(),j.positionFrom.x,j.positionFrom.y,j.positionFrom.z-0.50)
                    end
                end
            end
        end
    end
end)