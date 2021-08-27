-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- RESOURCE TUNNEL/PROXY
vRPl = {}
Tunnel.bindInterface("vrp_leite",vRPl)
Proxy.addInterface("vrp_leite",vRPl)
Lserver = Tunnel.getInterface("vrp_leite")

cfg = module("vrp_leite", "cfg/config")

coletando = false
obj = 0

haspermission = false
notabate = true

Citizen.CreateThread(function()
	local vaca = 0
	notabate = true
    while true do
		Wait(0)
		
		local pos = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(cfg.vacas)do
			if(Vdist(pos.x, pos.y, pos.z, v[1], v[2], v[3]) < 20.0)then
				DrawMarker(27, v[1], v[2], v[3]-0.9, 0, 0, 0, 0, 0, 0, 2.0001, 2.0001, 0.5001, 132, 52, 0,255, 0, 0, 0,0)
			end
			if(Vdist(pos.x, pos.y, pos.z, v[1], v[2], v[3]) < 2.0)then
				DrawText3D(v[1], v[2], v[3], "~w~Pressione ~g~[E] ~w~para ~y~COLETAR~w~ leite.\nPressione ~g~[F]~w~ para ~r~ABATER~w~ a vaca.",255,255,255)
				if IsControlJustPressed(1, 38) and not coletando then
					if GetEntityHealth(vacas[k]) > 50 then
						x, y, z = table.unpack(GetEntityCoords(vacas[k], true))
						if(Vdist(x, y, z, v[1], v[2], v[3]) < 4.0)then
							Lserver._coletarLeite(true,k)
							coletando = true
							vaca = k
						else
							vRP._notify("A vaca não está no curral.")
						end
					else
						vRP._notify("Não é possivel tirar leite de uma vaca ~r~ferida~w~.")
					end
				end
				if IsControlJustPressed(1, 49) and not coletando then
					x, y, z = table.unpack(GetEntityCoords(vacas[k], true))
					if(Vdist(x, y, z, v[1], v[2], v[3]) < 4.0)then
						Lserver._coletarLeite(false,k)
						-- if haspermission then
							-- notabate = false
							FreezeEntityPosition(vacas[k], false)
							Lserver.conduzir(k)
						-- else
							-- vRP._notify("~r~Não possui permissão.")
						-- end
					else
						vRP._notify("A vaca não está no curral.")
					end
				end
			elseif coletando and vaca == k then
				coletando = false
				vaca = 0
				Lserver._coletarLeite(false,k)
				ClearPedTasks(GetPlayerPed(-1))
				TriggerEvent("leite:deleteprop")
			end
        end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1))
		if(Vdist(pos.x, pos.y, pos.z, cfg.abatedouro[1], cfg.abatedouro[2], cfg.abatedouro[3]) < 20.0)then
			DrawMarker(27, cfg.abatedouro[1], cfg.abatedouro[2], cfg.abatedouro[3]-0.9, 0, 0, 0, 0, 0, 0, 5.0001, 5.0001, 0.5001, 132, 52, 0,255, 0, 0, 0,0)
		end
		if(Vdist(pos.x, pos.y, pos.z, cfg.abatedouro[1], cfg.abatedouro[2], cfg.abatedouro[3]) < 10.0)then
			DrawText3D(cfg.abatedouro[1], cfg.abatedouro[2], cfg.abatedouro[3], "~r~ABATEDOURO",255,255,255)
		end
	end
end)

RegisterNetEvent('vrp:perm')
AddEventHandler("vrp:perm", function(bool)
	haspermission = bool
end)

RegisterNetEvent('leite:prop')
AddEventHandler("leite:prop", function()
	DeleteObject(obj)
	local pos = GetEntityCoords(GetPlayerPed(-1))
	obj = CreateObject(GetHashKey("prop_bucket_01a"), pos.x+0.5, pos.y, pos.z, true, true, true)
	PlaceObjectOnGroundProperly(obj)
	SetEntityRotation(obj, 0.00, 0.00, 340.00)
end)

RegisterNetEvent('leite:deleteprop')
AddEventHandler("leite:deleteprop", function()
	Wait(10000)
	DeleteObject(obj)
end)

RegisterNetEvent('leite:anim')
AddEventHandler("leite:anim", function()
	while coletando do
		local ad = "anim@heists@heist_safehouse_intro@phone_couch@male"
		local player = GetPlayerPed( -1 )
		loadAnimDict(ad)
		TaskPlayAnim( player, ad, "phone_couch_male_idle", 8.0, 1.0, 5000, 49, 0, 0, 0, 0 )
		Wait(5000)
	end
end)

RegisterNetEvent('leite:stopanim')
AddEventHandler("leite:stopanim", function()
	ClearPedTasks(GetPlayerPed(-1))
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do 
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

RegisterNetEvent('vrp:abater')
AddEventHandler("vrp:abater", function(k)
	notabate = false
	TaskGoToCoordAnyMeans(vacas[k], cfg.abatedouro[1], cfg.abatedouro[2], cfg.abatedouro[3], 1.0, 0, 0, 786603, 1.0)
	if cfg.follow_player then
		showScaleform("~r~Abate","Conduza a vaca ao abatedouro",2)
	end
	while true do
		if cfg.follow_player then
			TaskGoToEntity(vacas[k], GetPlayerPed(-1), -1, 1.0, 10.0, 1073741824.0, 0)
		end
		
		if (GetEntityHealth(vacas[k])) == 0 then
			vRP._notify("A vaca ~r~morreu ~w~fora do abatedouro")
			return
		end
		x, y, z = table.unpack(GetEntityCoords(vacas[k], true))
		if(Vdist(x, y, z, cfg.abatedouro[1], cfg.abatedouro[2], cfg.abatedouro[3]) < 5.0)then
			ClearPedTasks(vacas[k])
			SetPedAsNoLongerNeeded(vacas[k])
			SetEntityAsMissionEntity(vacas[k], true, true)
			SetEntityHealth(vacas[k],0)
			Lserver.abater()
			return
		end
		Wait(4000)
	end
	notabate = true
end)

vacas = {}

-- Citizen.CreateThread(function()
	-- RequestModel( GetHashKey( "a_c_cow" ) )
	-- while ( not HasModelLoaded( GetHashKey( "a_c_cow" ) ) ) do
		-- Citizen.Wait( 1 )
	-- end
	-- while true do
		-- for k,v in pairs(cfg.vacas)do
			-- DeleteEntity(vacas[k])
			-- vacas[k] = CreatePed(4, "a_c_cow", v[1], v[2], v[3]-1, 0.0, true, true)
			-- FreezeEntityPosition(vacas[k], true)
		-- end
		-- Citizen.Wait(1000*cfg.spawn_timer)
	-- end
-- end)

RegisterNetEvent('vrp:spawnped')
AddEventHandler("vrp:spawnped", function()
	RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(1)
	end

	for k, v in pairs(cfg.vacas) do
		if vacas[k] then
			DeleteEntity(vacas[k])
		end
		vacas[k] = CreatePed(4, GetHashKey( "a_c_cow" ), v[1], v[2], v[3]-1, 0.0, false, false)
		FreezeEntityPosition(vacas[k], true)
	end
end)

Citizen.CreateThread(function()
	RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(1)
	end

	for k, v in pairs(cfg.vacas) do
		if vacas[k] then
			DeleteEntity(vacas[k])
		end
		vacas[k] = CreatePed(4, GetHashKey( "a_c_cow" ), v[1], v[2], v[3]-1, 0.0, false, false)
		FreezeEntityPosition(vacas[k], true)
	end
end)

Citizen.CreateThread(function()
	while true do
		while notabate do
			for k,v in pairs(cfg.vacas)do
				ClearPedTasks(vacas[k])
			end
			Citizen.Wait(0)
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent("vrp:perm")
		Citizen.Wait(10000)
	end
end)

function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
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

function showScaleform(title, desc, sec)
    function Initialize(scaleform)
        local scaleform = RequestScaleformMovie(scaleform)

        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
        PushScaleformMovieFunctionParameterString(title)
        PushScaleformMovieFunctionParameterString(desc)
        PopScaleformMovieFunctionVoid()
        return scaleform
    end
    scaleform = Initialize("mp_big_message_freemode")
    while sec > 0 do
		sec = sec - 0.02
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
	SetScaleformMovieAsNoLongerNeeded(scaleform)
end