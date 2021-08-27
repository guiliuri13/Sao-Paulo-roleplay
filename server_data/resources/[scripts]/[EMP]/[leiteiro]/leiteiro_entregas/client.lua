-- By Don_Speed    -      Don_Speed#6282
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

emp = Tunnel.getInterface("leiteiro_entregas")
vRP = Proxy.getInterface("vRP")

local emtrabalho = false
local minharota = 0
local quantidadeleite = 0

local Leite = {
	[1] = { ['x'] = 1135.35, ['y'] = -980.69, ['z'] = 46.41, ['valor'] = 100 },
	[2] = { ['x'] = 25.75, ['y'] = -1346.49, ['z'] = 29.49 , ['valor'] = 100 },
	[3] = { ['x'] = -48.54, ['y'] = -1758.17, ['z'] = 29.42 , ['valor'] = 100 },
	[4] = { ['x'] = 373.69, ['y'] = 325.99, ['z'] = 103.56 , ['valor'] = 100 },
	[5] = { ['x'] = 1163.37, ['y'] = -322.49, ['z'] = 69.20 , ['valor'] = 100 },
	[6] = { ['x'] = -1487.80, ['y'] = -378.52, ['z'] = 40.16 , ['valor'] = 100 },
	[7] = { ['x'] = -2967.94, ['y'] = 389.41, ['z'] = 15.04 , ['valor'] = 100 },
	[8] = { ['x'] = -707.40, ['y'] = -914.98, ['z'] = 19.21 , ['valor'] = 100 },
	[9] = { ['x'] = -1224.17, ['y'] = -908.10, ['z'] = 12.32 , ['valor'] = 100 }
}
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1)
		local DonLeite = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 173.03,-26.36,68.34, true)
		if DonLeite < 4.0  then
		    LeiteDrawText(173.03,-26.36,68.34, "[H] PARA INICIAR ENTREGA DE <b>GARRAFA DE LEITE</b>")
			DrawMarker(20,173.03,-26.36,68.34,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
			
		    if IsControlJustPressed(0,74) and emtrabalho == false then
			    emtrabalho = true
				minharota = math.random(1, 9)
				quantidadeleite = math.random(1, 7)
				LeiteCriandoBlip(Leite[minharota].x, Leite[minharota].y, Leite[minharota].z)
				TriggerEvent("Notify","sucesso","Siga para sua rota.") 
				PlaySoundFrontend(-1,"Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS",false)
		    end
		end
	end
end)
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1)
		if emtrabalho then 
		    local AlphaDonLeite = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Leite[minharota].x, Leite[minharota].y, Leite[minharota].z, true)
		    if AlphaDonLeite < 4.0  then
		        LeiteDrawText(Leite[minharota].x, Leite[minharota].y, Leite[minharota].z, "[H] PARA ENTREGAR <b>GARRAFA DE LEITE</b>")
			    DrawMarker(20,Leite[minharota].x, Leite[minharota].y, Leite[minharota].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
			
		        if IsControlJustPressed(0,74) and emtrabalho == true then
			        TriggerServerEvent('Don_Speed:LeiteEntrega', quantidadeleite, Leite[minharota].valor)
		        end
		    end
		end
	end
end)
Citizen.CreateThread(function() -- Don_Speed / Cancelar missao
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) and emtrabalho then
			RemoveBlip(blipdaqui)
            emtrabalho = false
	        minharota = 0
	        quantidadeleite = 0
			PlaySoundFrontend(-1,"ScreenFlash", "MissionFailedSounds",false)
		end
	end
end)
RegisterNetEvent("Don_Speed:StartLeite")
AddEventHandler("Don_Speed:StartLeite",function()

    TriggerEvent("Notify","sucesso","Siga para proxima.") 
	
    RemoveBlip(blipdaqui)
	minharota = math.random(1, 9)
	quantidadeleite = math.random(1, 7)
	
	LeiteCriandoBlip(Leite[minharota].x, Leite[minharota].y, Leite[minharota].z)
	
end)
function LeiteCriandoBlip(x,y,z)
	blipdaqui = AddBlipForCoord(x,y,z)
	SetBlipSprite(blipdaqui,1)
	SetBlipColour(blipdaqui, 4)
	SetBlipScale(blipdaqui,0.7)
	SetBlipAsShortRange(blipdaqui,false)
	SetBlipRoute(blipdaqui,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de leite")
	EndTextCommandSetBlipName(blipdaqui)
end

function LeiteDrawText(x,y,z, text)
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