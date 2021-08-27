
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
emp = Tunnel.getInterface("don_emp_cc")
--cc = Tunnel.getInterface("don_emp_cc")
vRP = Proxy.getInterface("vRP")

local cctrabalho = false
local ccrotaid = 0

local ccrotas = {
	[1] = { ['x'] = -1170.98,['y'] =-1380.94,['z'] =4.96},
	[2] = { ['x'] = -989.18,['y'] =-1575.93,['z'] =5.17},
	[3] = { ['x'] = -2205.62,['y'] =-373.88,['z'] =13.32},
	[4] = { ['x'] = -1996.31,['y'] =591.15,['z'] =118.10},
	[5] = { ['x'] = -867.30,['y'] =784.75,['z'] =191.93},
	[6] = { ['x'] = 164.26,['y'] =151.98,['z'] =105.17},
	[7] = { ['x'] = 759.08,['y'] =-694.33,['z'] =28.80},
	[8] = { ['x'] = 869.25,['y'] =-1639.68,['z'] =30.52},
	[9] = { ['x'] = 456.95,['y'] =-2059.28,['z'] =23.97},
	[10] = { ['x'] = -9.32,['y'] =-2536.08,['z'] =7.38},
	
}
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1)
		local GetCartao = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -1150.6586914062,-1567.6627197266,4.4282183647156, true)
		if GetCartao < 4.0  then
		    CCDrawText(-1150.6586914062,-1567.6627197266,4.4282183647156, "[H] PARA INICIAR ENTREGA DE <b>CARTAO</b>")
			DrawMarker(20,-1150.6586914062,-1567.6627197266,4.4282183647156,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
			
		    if IsControlJustPressed(0,74) and cctrabalho == false then
			    cctrabalho = true
				ccrotaid = math.random(1, 10)
				
				CCCriandoBlip(ccrotas[ccrotaid].x, ccrotas[ccrotaid].y, ccrotas[ccrotaid].z)
				
				TriggerEvent("Notify","sucesso","Siga para sua rota.") 
				PlaySoundFrontend(-1,"Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS",false)
		    end
		end
	end
end)
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1)
		if cctrabalho then 
		    local AlphaDonCC = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), ccrotas[ccrotaid].x, ccrotas[ccrotaid].y, ccrotas[ccrotaid].z, true)
		    if AlphaDonCC < 4.0  then
		        CCDrawText(ccrotas[ccrotaid].x, ccrotas[ccrotaid].y, ccrotas[ccrotaid].z, "[H] PARA ENTREGAR <b>CARTAO</b>")
			    DrawMarker(20,ccrotas[ccrotaid].x, ccrotas[ccrotaid].y, ccrotas[ccrotaid].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
			
		        if IsControlJustPressed(0,74) and cctrabalho == true then
				    local vvss = math.random(1000, 3500)  -- local vvss = math.random(1000, 5000)
			        TriggerServerEvent('Don_Speed:CCEntrega', vvss)
		        end
		    end
		end
	end
end)
RegisterNetEvent("Don_Speed:StartCC")
AddEventHandler("Don_Speed:StartCC",function()

    TriggerEvent("Notify","sucesso","Siga para proxima.") 
	
    RemoveBlip(blipdaqui)
    ccrotaid = math.random(1, 10)
				
	CCCriandoBlip(ccrotas[ccrotaid].x, ccrotas[ccrotaid].y, ccrotas[ccrotaid].z)
	
end)
Citizen.CreateThread(function() -- Don_Speed / Cancelar missao
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) and cctrabalho then
			RemoveBlip(blipdaqui)
            cctrabalho = false
	        ccrotaid = 0
			PlaySoundFrontend(-1,"ScreenFlash", "MissionFailedSounds",false)
		end
	end
end)
Citizen.CreateThread(function() -- pegar 
	while true do
	    Citizen.Wait(1)
		local GetItem = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -1165.1284179688,-1566.8427734375,4.4512815475464, true)
			if GetItem < 4.0 then
				DrawMarker(1, -1165.1284179688,-1566.8427734375,4.4512815475464-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				CCDrawText(-1165.1284179688,-1566.8427734375,4.4512815475464, "PRESSIONE  ~b~H~w~  PARA PEGAR CARTÃO")			
			    if IsControlJustPressed(0,74) and emp.checkPermission() then
				    TriggerServerEvent('Don_Speed:CCPegar')
			    end
			end
	end
end)
function CCCriandoBlip(x,y,z)
	blipdaqui = AddBlipForCoord(x,y,z)
	SetBlipSprite(blipdaqui,1)
	SetBlipColour(blipdaqui, 6)
	SetBlipScale(blipdaqui,0.7)
	SetBlipAsShortRange(blipdaqui,false)
	SetBlipRoute(blipdaqui,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Cartão")
	EndTextCommandSetBlipName(blipdaqui)
end

function CCDrawText(x,y,z, text)
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