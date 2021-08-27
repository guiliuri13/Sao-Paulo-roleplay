local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {
	["MAFIA"] = {
		positionFrom = { ['x'] = 1395.45, ['y'] = 1141.90, ['z'] = 114.64 },
		positionTo = { ['x'] = 1397.02, ['y'] = 1141.87, ['z'] = 114.33 }
	}
}
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		for k,v in pairs(Teleport) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.positionFrom.x,v.positionFrom.y,v.positionFrom.z)
			local distance = GetDistanceBetweenCoords(v.positionFrom.x,v.positionFrom.y,cdz,x,y,z,true)
			local bowz,cdz2 = GetGroundZFor_3dCoord(v.positionTo.x,v.positionTo.y,v.positionTo.z)
			local distance2 = GetDistanceBetweenCoords(v.positionTo.x,v.positionTo.y,cdz2,x,y,z,true)

			if distance <= 10 then
				sleep = 5
				DrawMarker(1,v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) then
						SetEntityCoords(PlayerPedId(),v.positionTo.x,v.positionTo.y,v.positionTo.z-0.50)
					end
				end
			end

			if distance2 <= 10 then
				sleep = 5
				DrawMarker(1,v.positionTo.x,v.positionTo.y,v.positionTo.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance2 <= 1.5 then
					if IsControlJustPressed(0,38)  then
						SetEntityCoords(PlayerPedId(),v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS  
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1, ['x'] = 97.76, ['y'] = 6333.92, ['z'] = 31.37, ['text'] = "ADUBO", ['perm'] = "maconha.permissao" },  -- C.V
	{ ['id'] = 2, ['x'] = 102.60, ['y'] = 6329.33, ['z'] = 31.37, ['text'] = "FERTILIZANTE", ['perm'] = "maconha.permissao" },  -- C.V
	{ ['id'] = 3, ['x'] = 112.57, ['y'] = 6359.20, ['z'] = 32.31, ['text'] = "MACONHA", ['perm'] = "maconha.permissao" },  -- C.V
	--|2224.06,5576.97,53.84, "ADUBO" -- C.V
	--|1664.67,-49.47,168.31, "FERTILIZANTE" C.V
	--|1660.48,-49.54,168.31, "MACONHA" C.V

	{ ['id'] = 14, ['x'] = 1493.40, ['y'] = 6390.36, ['z'] = 21.25, ['text'] = "ANFETAMINA", ['perm'] = "meta.permissao" }, -- PCC Atualizado
	{ ['id'] = 15, ['x'] = 1502.39, ['y'] = 6393.71, ['z'] = 20.78, ['text'] = "metanfetamina", ['perm'] = "meta.permissao" }, -- PCC Atualizado
	--|79.68,3705.68,41.07, ['ANFETAMINA'] = "ANFETAMINA" -- P.C.C
    --|-291.70,-697.7,73.11, ['metanfetamina'] = "metanfetamina" -- P.C.C

	{ ['id'] = 10, ['x'] = -1107.03, ['y'] = 4951.26, ['z'] = 218.64, ['text'] = "COCA MOÍDA", ['perm'] = "cocaina.permissao" }, -- T.C.P
	{ ['id'] = 11, ['x'] = -1106.45, ['y'] = 4945.70, ['z'] = 218.64, ['text'] = "COCAÍNA", ['perm'] = "cocaina.permissao" }, -- T.C.P
	--|1998.01,4839.34,43.62, "COCA MOÍDA"  -- T.C.P
	--|1414.17,-706.13,73.95, "COCAÍNA" -- T.C.P
	
	--{ ['id'] = 17, ['x'] = 749.47, ['y'] = -1061.07, ['z'] = 21.85, ['text'] = "BICARBONATO", ['perm'] = "crack.permissao" }, -- Okaida
	--{ ['id'] = 18, ['x'] = 729.54, ['y'] = -1056.96, ['z'] = 22.04, ['text'] = "CLORIDRATO", ['perm'] = "crack.permissao" }, -- Okaida
	--{ ['id'] = 19, ['x'] = 1466.12, ['y'] = -2410.06, ['z'] = 66.58, ['text'] = "CRACK", ['perm'] = "crack.permissao" }, -- Okaida
	
	--{ ['id'] = 20, ['x'] = 1397.20, ['y'] = 3611.68, ['z'] = 34.98, ['text'] = "ACIDO", ['perm'] = "lsd.permissao" }, -- 
	--{ ['id'] = 21, ['x'] = 1389.94, ['y'] = 3608.77, ['z'] = 38.94, ['text'] = "LSD", ['perm'] = "lsd.permissao" }, -- 
	
	{ ['id'] = 30, ['x'] = 711.47, ['y'] = -969.38, ['z'] = 30.39, ['text'] = "TECIDO BALISTICO", ['perm'] = "cosanostra.permissao" }, -- vanilla
	{ ['id'] = 31, ['x'] = 716.58, ['y'] = -962.30, ['z'] = 30.39, ['text'] = "COLETE BALISTICO", ['perm'] = "cosanostra.permissao" }, -- vanilla
	{ ['id'] = 34, ['x'] = -580.02, ['y'] = 5354.68, ['z'] = 70.21, ['text'] = "RECEPIENTE MAÇARICO", ['perm'] = "vanilla.permissao" }, -- vanilla
	{ ['id'] = 35, ['x'] = -773.36, ['y'] = 5400.97, ['z'] = 38.82, ['text'] = "MAÇARICO", ['perm'] = "vanilla.permissao" }, -- vanilla
}
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 6.0 and not processo then
				sleep = 5
				DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				DrawText3D(v.x,v.y,v.z, "PRESSIONE  ~b~E~w~  PARA PRODUZIR "..v.text.."")
				if distance <= 1.2 and not processo then
					if IsControlJustPressed(0,38) and func.checkPermission(v.perm) then
						if func.checkPayment(v.id) then
							processo = true
							TriggerEvent('cancelando',true)
							TriggerEvent("progress",10000,"produzindo")
							SetTimeout(10000,function()
								processo = false
								TriggerEvent('cancelando',false)
							end)
						end
					end
				end
		end	end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
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