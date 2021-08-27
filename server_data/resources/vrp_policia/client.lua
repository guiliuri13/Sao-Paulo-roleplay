local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")


-----------------------------------------------------------------------------------------------------------------------------------------
-- GPS ON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('gpsactivetoall')
AddEventHandler('gpsactivetoall', function(allServiceCops)
	for id, c in pairs(allServiceCops) do
		local ped = GetPlayerPed(id)
		if DoesBlipExist(blipCar) then
			RemoveBlip(blipCar)
		end
		blipCar = AddBlipForEntity(ped)
		SetBlipSprite(blipCar, 225)
		SetBlipAsShortRange(blipCar, true)
		SetBlipColour(blipCar, 4)
		SetBlipScale(blipCar, 0.6)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Veículo")
		EndTextCommandSetBlipName(blipCar)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /RMASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("rmascara")
AddEventHandler("rmascara",function()
	SetPedComponentVariation(PlayerPedId(),1,0,0,2)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /RCHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("rchapeu")
AddEventHandler("rchapeu",function()
	ClearPedProp(PlayerPedId(),0)
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
--------------------------------------------------------------------------------------------------------------------------------------------------
other = nil
drag = false
carregado = false
RegisterNetEvent("carregar")
AddEventHandler("carregar",function(p1)
    other = p1
    drag = not drag
end)

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(1)
		if drag and other then
			local ped = GetPlayerPed(GetPlayerFromServerId(other))
			Citizen.InvokeNative(0x6B9BBD38AB0796DF,GetPlayerPed(-1),ped,4103,11816,0.48,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
			carregado = true
        else
        	if carregado then
				DetachEntity(GetPlayerPed(-1),true,false)
				carregado = false
			end
        end
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- DISPAROS
--------------------------------------------------------------------------------------------------------------------------------------------------
local blacklistedWeapons = {
	"WEAPON_DAGGER",
	"WEAPON_BAT",
	"WEAPON_BOTTLE",
	"WEAPON_CROWBAR",
	"WEAPON_FLASHLIGHT",
	"WEAPON_GOLFCLUB",
	"WEAPON_HAMMER",
	"WEAPON_HATCHET",
	"WEAPON_KNUCKLE",
	"WEAPON_KNIFE",
	"WEAPON_MACHETE",
	"WEAPON_SWITCHBLADE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_WRENCH",
	"WEAPON_BATTLEAXE",
	"WEAPON_POOLCUE",
	"WEAPON_STONE_HATCHET",
	"WEAPON_STUNGUN",
	"WEAPON_FLARE",
	"GADGET_PARACHUTE",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_RAYPISTOL",
	"WEAPON_stickybomb",
	"WEAPON_rpg",
	"WEAPON_firework",
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local blacklistweapon = false
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

		for k,v in ipairs(blacklistedWeapons) do
			if GetSelectedPedWeapon(ped) == GetHashKey(v) then
				blacklistweapon = true
			end
		end

		if IsPedShooting(ped) and not blacklistweapon then
			TriggerServerEvent('atirando',x,y,z)
		end

		blacklistweapon = false
	end
end)

local blips = {}
RegisterNetEvent('notificacao')
AddEventHandler('notificacao',function(x,y,z,user_id)
	local distance = GetDistanceBetweenCoords(x,y,z,-186.1,-893.5,29.3,true)
	if distance <= 2100 then
		if not DoesBlipExist(blips[user_id]) then
			PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
			TriggerEvent('chatMessage',"COPOM",{245,0,0},"Disparos de arma de fogo aconteceram, verifique o ocorrido.")
			blips[user_id] = AddBlipForCoord(x,y,z)
			SetBlipScale(blips[user_id],0.5)
			SetBlipSprite(blips[user_id],153)
			SetBlipColour(blips[user_id],84)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Disparos de arma de fogo")
			EndTextCommandSetBlipName(blips[user_id])
			SetBlipAsShortRange(blips[user_id],false)
			SetTimeout(30000,function()
				if DoesBlipExist(blips[user_id]) then
					RemoveBlip(blips[user_id])
				end
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONE
-----------------------------------------------------------------------------------------------------------------------------------------
local cone = nil
RegisterNetEvent('cone')
AddEventHandler('cone',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-0.94)
	local prop = "prop_mp_cone_02"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		cone = CreateObject(GetHashKey(prop),coord.x,coord.y-0.5,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(cone)
		SetModelAsNoLongerNeeded(cone)
		SetEntityAsMissionEntity(cone,true,true)
		SetEntityHeading(cone,h)
		FreezeEntityPosition(cone,true)
		SetEntityAsNoLongerNeeded(cone)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			cone = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(cone))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARREIRA
-----------------------------------------------------------------------------------------------------------------------------------------
local barreira = nil
RegisterNetEvent('barreira')
AddEventHandler('barreira',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.5,-0.94)
	local prop = "prop_mp_barrier_02b"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		barreira = CreateObject(GetHashKey(prop),coord.x,coord.y-0.95,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(barreira)
		SetModelAsNoLongerNeeded(barreira)
		SetEntityAsMissionEntity(barreira,true,true)
		SetEntityHeading(barreira,h-180)
		FreezeEntityPosition(barreira,true)
		SetEntityAsNoLongerNeeded(barreira)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			barreira = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(barreira))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPIKE
-----------------------------------------------------------------------------------------------------------------------------------------
local spike = nil
RegisterNetEvent('spike')
AddEventHandler('spike',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,2.5,0.0)
	local prop = "p_ld_stinger_s"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		spike = CreateObject(GetHashKey(prop),coord.x,coord.y,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(spike)
		SetModelAsNoLongerNeeded(spike)
		SetEntityAsMissionEntity(spike,true,true)
		SetEntityHeading(spike,h-180)
		FreezeEntityPosition(spike,true)
		SetEntityAsNoLongerNeeded(spike)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			spike = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(spike))
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local veh = GetVehiclePedIsIn(PlayerPedId(),false)
		local vcoord = GetEntityCoords(veh)
		local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-0.94)
		if IsPedInAnyVehicle(PlayerPedId()) then
			if DoesObjectOfTypeExistAtCoords(vcoord.x,vcoord.y,vcoord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
				SetVehicleTyreBurst(veh,0,true,1000.0)
				SetVehicleTyreBurst(veh,1,true,1000.0)
				SetVehicleTyreBurst(veh,2,true,1000.0)
				SetVehicleTyreBurst(veh,3,true,1000.0)
				SetVehicleTyreBurst(veh,4,true,1000.0)
				SetVehicleTyreBurst(veh,5,true,1000.0)
				SetVehicleTyreBurst(veh,6,true,1000.0)
				SetVehicleTyreBurst(veh,7,true,1000.0)
				if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
					spike = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),false,false,false)
					TriggerServerEvent("trydeleteobj",ObjToNet(spike))
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISÃO
-----------------------------------------------------------------------------------------------------------------------------------------
local prisioneiro = false
local reducaopenal = false

RegisterNetEvent('prisioneiro')
AddEventHandler('prisioneiro',function(status)
	prisioneiro = status
	reducaopenal = false
	local ped = PlayerPedId()
	if prisioneiro then
		SetEntityInvincible(ped,true)
		FreezeEntityPosition(ped,true)
		SetEntityVisible(ped,false,false)
		SetTimeout(10000,function()
			SetEntityInvincible(ped,false)
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true,false)
		end)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		if prisioneiro then
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1700.5,2605.2,45.5,true)
			if distance >= 200 then
				SetEntityCoords(PlayerPedId(),1680.1,2513.0,45.5)
				TriggerEvent("Notify","aviso","O agente penitenciário encontrou você tentando escapar.")
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if prisioneiro then
			local distance01 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1691.59,2566.05,45.56,true)
			local distance02 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1669.51,2487.71,45.82,true)

			if GetEntityHealth(PlayerPedId()) <= 100 then
				reducaopenal = false
				vRP._DeletarObjeto()
			end

			if distance01 <= 100 and not reducaopenal then
				DrawMarker(21,1691.59,2566.05,45.56,0,0,0,0,180.0,130.0,1.0,1.0,0.5,255,255,255,100,1,0,0,1)
				if distance01 <= 1.2 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA CONCLUIR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						reducaopenal = true
						ResetPedMovementClipset(PlayerPedId(),0)
						SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
						vRP._CarregarObjeto("anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
					end
				end
			end

			if distance02 <= 100 and reducaopenal then
				DrawMarker(21,1669.51,2487.71,45.82,0,0,0,0,180.0,130.0,1.0,1.0,0.5,255,255,255,100,1,0,0,1)
				if distance02 <= 1.2 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA CONCLUIR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						reducaopenal = false
						TriggerServerEvent("diminuirpena")
						vRP._DeletarObjeto()
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if reducaopenal then
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,75,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,32,true)
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true)
			DisableControlAction(0,271,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,177,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,245,true)
			DisableControlAction(0,246,true)
			DisableControlAction(0,303,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
		end
	end
end)

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not IsPedInAnyVehicle(GetPlayerPed(-1),false) then
			if IsControlJustPressed(0,244) then
				TriggerServerEvent("vrp_policia:algemar")
			end
			if IsControlJustPressed(0,74) then
				TriggerServerEvent("vrp_policia:carregar")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANDAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("homem",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@confident")
	end
end)

RegisterCommand("mulher",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@heels@c")
	end
end)

RegisterCommand("depressivo",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@depressed@a")
	end
end)

RegisterCommand("depressiva",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@depressed@a")
	end
end)

RegisterCommand("empresario",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@business@a")
	end
end)

RegisterCommand("determinado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@brave@a")
	end
end)

RegisterCommand("descontraido",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@casual@a")
	end
end)

RegisterCommand("farto",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@fat@a")
	end
end)

RegisterCommand("estiloso",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hipster@a")
	end
end)

RegisterCommand("ferido",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@injured")
	end
end)

RegisterCommand("nervoso",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hurry@a")
	end
end)

RegisterCommand("desleixado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hobo@a")
	end
end)

RegisterCommand("infeliz",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@sad@a")
	end
end)

RegisterCommand("musculoso",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@muscle@a")
	end
end)

RegisterCommand("desligado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@shadyped@a")
	end
end)

RegisterCommand("fadiga",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@buzzed")
	end
end)

RegisterCommand("apressado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hurry_butch@a")
	end
end)

RegisterCommand("descolado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@money")
	end
end)

RegisterCommand("corridinha",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@quick")
	end
end)

RegisterCommand("piriguete",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@maneater")
	end
end)

RegisterCommand("petulante",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@sassy")
	end
end)

RegisterCommand("arrogante",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@arrogant@a")
	end
end)

RegisterCommand("bebado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@drunk@slightlydrunk")
	end
end)

RegisterCommand("bebado2",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@drunk@verydrunk")
	end
end)

RegisterCommand("bebado3",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@drunk@moderatedrunk")
	end
end)

RegisterCommand("irritado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@fire")
	end
end)

RegisterCommand("intimidado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@intimidation@cop@unarmed")
	end
end)

RegisterCommand("poderosa",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@handbag")
	end
end)

RegisterCommand("chateado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@injured")
	end
end)

RegisterCommand("estilosa",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@posh@")
	end
end)

RegisterCommand("sensual",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@sexy@a")
	end
end) 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
			local dds = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),441.36297607422,-978.64581298828,30.68967628479,true)
			local d2 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),305.55200195312,-598.03039550782,43.29280090332,true)
			local d3 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),953.3265991211,-954.31188964844,39.753105163574,true)
			local drota = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1099.2423095704,-841.03912353516,19.00,true)
			local carta = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),208.69497680664,-1382.5930175781,30.583532333374,true)
			local porte = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),447.35006713867,-975.84020996094,30.689661026001,true)
			local hsp = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),310.67031860352,-595.67059326172,43.29277420044,true)
			
			local slot2 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-30.02339553833,-1105.16796875,26.422353744507,true)
			
			
			if hsp <= 1.0  then
				DrawText3D(310.67031860352,-595.67059326172,43.29277420044, "PRESSIONE  ~b~E~w~  PARA INICIAR TRATAMENTO ")
				if IsControlJustPressed(0,38) then
				    SetEntityInvincible(GetPlayerPed(-1),true)
					PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
					SetEntityCoords(PlayerPedId(),361.15,-579.38,44.21,344.71)
					TriggerEvent('tratamento-hospital')
				end
			end
			if dds <= 3.0  then
			    
				DrawText3D(441.36297607422,-978.64581298828,30.68967628479, "PRESSIONE  ~b~E~w~  PARA BATER O CARTAO ")
				if IsControlJustPressed(0,38) then
				    TriggerServerEvent("vrp_policia:servicos")
					PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
				end
			end
			if d2 <= 1.0  then
			    DrawText3D(305.55200195312,-598.03039550782,43.29280090332, "PRESSIONE  ~b~E~w~  PARA BATER O CARTAO ")
				if IsControlJustPressed(0,38) then
				    TriggerServerEvent("vrp_medico:servicos")
					PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
				end
			end
			if d3 <= 3.0  then
			    DrawText3D(953.3265991211,-954.31188964844,39.753105163574, "PRESSIONE  ~b~E~w~  PARA BATER O CARTAO ")
				if IsControlJustPressed(0,38) then
				    TriggerServerEvent("vrp_mecanico:servicos")
					PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
				end
			end
			if drota <= 3.0  then
			    DrawText3D(-1099.2423095704,-841.03912353516,19.00, "PRESSIONE  ~b~E~w~  PARA BATER O CARTAO ")
				if IsControlJustPressed(0,38) then
				    TriggerServerEvent("vrp_rota:servicos")
					PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
				end
			end
			if carta <= 3.0  then
			    DrawText3D(240.4373626709,-1379.279296875,33.741832733154, "PRESSIONE  ~b~E~w~  PARA COMPRAR CARTA ")
				if IsControlJustPressed(0,38) then
				    TriggerServerEvent("vrp_carta")
					PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
				end
			end
			if porte <= 3.0  then
			    DrawText3D(449.90365600586,-973.57598876954,30.689666748046, "PRESSIONE  ~b~E~w~  PARA COMPRAR PORTE DE ARMAS ")
				if IsControlJustPressed(0,38) then
				    TriggerServerEvent("vrp_porte")
					PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
				end
			end
			if slot2 <= 3.0  then
			    DrawText3D(-30.02339553833,-1105.16796875,26.422353744507, "PRESSIONE  ~b~E~w~  PARA COMPRAR SLOT ")
				if IsControlJustPressed(0,38) then
				    TriggerServerEvent("vrp_slot2")
				end
			end
		end
end)
function DrawText3D(x,y,z, text)
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
end
RegisterNetEvent('tratamento-hospital')
AddEventHandler('tratamento-hospital',function()
    SetEntityInvincible(GetPlayerPed(-1),true)
    vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
	Citizen.Wait(10000)
		SetEntityInvincible(GetPlayerPed(-1),false)
		SetEntityHealth(PlayerPedId(),400)
		PlaySoundFrontend(-1, "Bed", "WastedSounds", false)
		vRP.loadAnimSet("move_m@confident")
end)