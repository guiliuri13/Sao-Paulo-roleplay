local spawnRadius = 70 
drivingStyle = 786603  

--# Carrega Diretório de animações
function loadAnimDict(dict)
--Enquanto não carrega o diretorio:
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict) --FiveM/ Solicita diretorio da animação
        Citizen.Wait(0)
    end
end

--# Seta um caminho na direção
function GetVehicleInDirection(coordFrom, coordTo)
-- Traça um caminho para o veiculo
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle) -- verifica se o veiculo chegou no destino
    return vehicle
end

--# Cria a ambulancia no mapa com motorista.

function SpawnaAmbulancia(x, y, z, vehhash, motoristahash)                                                     
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(x + math.random(-spawnRadius, spawnRadius), y + math.random(-spawnRadius, spawnRadius), z, 0, 3, 0)
    if found and HasModelLoaded(vehhash) and HasModelLoaded(vehhash) then
        veiculoSamu = CreateVehicle(vehhash, spawnPos, spawnHeading, true, false) 
        -- Limpa area em um raio do veiculo
        ClearAreaOfVehicles(GetEntityCoords(veiculoSamu), 5000, false, false, false, false, false);  
        SetVehicleOnGroundProperly(veiculoSamu)  -- coloca o veiculo no chão corretamente
        
        medico = CreatePedInsideVehicle(veiculoSamu, 26, motoristahash, -1, true, false)              		
        samuBlip = AddBlipForEntity(veiculoSamu) --cria o blip no mapa                                                       	
        SetBlipFlashes(samuBlip, true)  -- provavelmente faz o blip piscar.
        SetBlipColour(samuBlip, 5) -- define a cor do blip ( cores na documentação )
    end
end

--# Deleta o Veiculo criado
function DeleteVeh(veiculo, motorista)
    SetEntityAsMissionEntity(veiculo, false, false)                            
    DeleteEntity(veiculo)
    SetEntityAsMissionEntity(motorista, false, false)                                  
    DeleteEntity(motorista)
    RemoveBlip(samuBlip)              
end

--# Leva veiculo até o destino

function GoToTarget(x, y, z, veiculo, motorista, vehhash, target)
    TaskVehicleDriveToCoord(motorista, veiculo, x, y, z, 17.0, 0, vehhash, drivingStyle, 1, true)
    emrota = true
    while emrota do
        Citizen.Wait(500)
        distanceToTarget = GetDistanceBetweenCoords(GetEntityCoords(target), GetEntityCoords(veiculo).x, GetEntityCoords(veiculo).y, GetEntityCoords(veiculo).z, true)
            if distanceToTarget < 20 then
                TaskVehicleTempAction(motorista, veiculo, 27, 6000)--FiveM/ Seta uma ação para o veiculo ( ver na documentação )
                SetVehicleUndriveable(veiculo, true)--FiveM/ Bloqueia o player a entrar no veiculo, a menos que você sete o player como passageiro
                GoToTargetWalking(target, veiculo, motorista)-- vai ate o destino 
        end
    end
end

function GoToTargetWalking(target, vehicle, motorista)
    while emrota do
        Citizen.Wait(500)
        engine = GetEntityCoords(target)

        TaskGoToCoordAnyMeans(motorista, engine, 2.0, 0, 0, 786603, 0xbf800000)
        distanceToTarget = GetDistanceBetweenCoords(GetEntityCoords(target).x, GetEntityCoords(target).y, GetEntityCoords(target).z, GetEntityCoords(motorista).x, GetEntityCoords(motorista).y, GetEntityCoords(motorista).z, true)
        norunrange = false 
        if distanceToTarget <= 2 and not norunrange then
			Citizen.Wait(1000)
			FreezeEntityPosition(motorista, true) --FiveM/ - Fixa posição de uma entidade(veiculo,player,pedestre), usando true ou false
            startAnim(motorista,"mini@repair","fixing_a_player")-- Usa a função criada por você para iniciar uma animação
            Citizen.Wait(5000)
            startAnimLooop(motorista)
            Citizen.Wait(7000)
            TriggerServerEvent("Reviver:revivere")
            ClearPedTasksImmediately(motorista) --FiveM/ limpa todas ações do ped
			norunrange = true
			FreezeEntityPosition(motorista, false)--FiveM/ Desfixa a posição de uma entidade 
            IrEmbora(vehicle, motorista) -- Função criada para o motorista retornar para o carro
            emrota = false
        end
        
    end
end


function startAnim(entity,lib, anim)
	RequestAnimDict(lib)
	while not HasAnimDictLoaded( lib) do
		Citizen.Wait(1)
	end

    TaskPlayAnim(entity, lib ,anim ,8.0, -8.0, -1, 0, 0, false, false, false )
    Citizen.Wait(1000)
end

function startAnimLooop(entity)
    local lib, anim = "mini@repair","fixing_a_player"
    RequestAnimDict(lib)
	while not HasAnimDictLoaded( lib) do
		Citizen.Wait(1)
	end
    for i=1, 18, 1 do
        Citizen.Wait(900)
        TaskPlayAnim(entity, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

    end 
end



DrawText3D = function(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local px, py, pz = table.unpack(GetGameplayCamCoords())
	local scale = 0.45
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x, _y)
		local factor = (string.len(text)) / 370
		DrawRect(_x, _y + 0.0150, 0.030 + factor, 0.030, 66, 66, 66, 150)
	end
end


function DrawText3Ds(x,y,z, text)
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
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end


function drawTxt(text, font, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end
