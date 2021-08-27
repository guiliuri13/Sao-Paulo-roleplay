local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista")


local aaa = false
function ToggleActionMenu()
	aaa = not aaa
	if aaa then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local CoordenadaX = 453.48
local CoordenadaY = -607.74
local CoordenadaZ = 28.57
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	
	--rota 1
    [1] = { x=384.47677612305, y=-672.04638671875, z=28.799530029297},
    [2] = { x=286.87847900391, y=-830.50689697266, z=28.804233551025},
    [3] = { x=114.97171020508, y=-783.53234863281, z=30.846706390381},
    [4] = { x=-59.160495758057, y=-570.31195068359, z=37.643592834473},
    [5] = { x=32.529594421387, y=-304.78872680664, z=46.748195648193},
    [6] ={ x=-79.274604797363, y=-230.32312011719, z=44.428340911865},
    [7] ={ x=-288.06753540039, y=-619.0751953125, z=32.992897033691},
    [8] ={ x=-427.70443725586, y=-650.63287353516, z=30.263391494751},
    [9] ={ x=-609.82482910156, y=-650.19165039063, z=31.246574401855},
    [10] ={  x=-839.96978759766, y=-652.84521484375, z=27.457897186279},
    [11] ={ x=-862.34387207031, y=-812.87237548828, z=18.903995513916},
    [12] ={ x=-831.40509033203, y=-1020.0682983398, z=12.905180931091},
    [13] ={ x=-648.58209228516, y=-1292.8444824219, z=10.240081787109},
    [14] ={ x=-527.89904785156, y=-1108.4794921875, z=21.731967926025},
    [15] ={  x=-300.62353515625, y=-1148.0377197266, z=22.822778701782},
    [16] ={ x=33.120254516602, y=-1143.6287841797, z=28.8779296875},
    [17] ={ x=401.72378540039, y=-1082.0087890625, z=28.932962417603},
    [18] ={ x=408.47021484375, y=-876.44030761719, z=28.909284591675},
    [19] ={ x=409.41796875, y=-694.66937255859, z=28.779878616333},
	
	-- rota 2
	[21] = { x=850.61328125,y=69.799438476563,z=67.542724609375},
	[22] = { x=717.00653076172,y=7.0212593078613,z=83.383476257324},
	[23] = { x=1017.6552124023,y=474.69067382813,z=95.634811401367},
	[24] = { x=1523.5881347656,y=824.99542236328,z=76.865333557129},
	[25] = { x=2431.8544921875,y=2861.3100585938,z=48.44787979126},
	[26] = { x=2296.7021484375,y=2999.2827148438,z=46.022369384766},
	[27] = { x=2245.2395019531,y=3235.6735839844,z=47.543769836426},
	[28] = { x=1923.8132324219,y=3257.2685546875,z=45.112487792969},
	[29] = { x=1176.2513427734,y=2975.5048828125,z=39.921745300293},
	[30] = { x=1141.6080322266,y=2695.2421875,z=37.550636291504},
	[31] = { x=611.53448486328,y=2700.6689453125,z=40.699077606201},
	[32] = { x=296.60238647461,y=2641.9306640625,z=44.070949554443},
	[33] = { x=-470.04107666016,y=2855.0844726563,z=33.628940582275},
	[34] = { x=-1107.3537597656,y=2681.9357910156,z=18.383943557739},
	[35] = { x=-2541.7404785156,y=2294.9780273438,z=32.23872756958},
	[36] = { x=-3091.546875,y=1335.8004150391,z=19.644758224487},
	[37] = { x=-3208.6750488281,y=1118.4012451172,z=9.5712099075317},
	[38] = { x=-3172.0280761719,y=907.31793212891,z=13.927681922913},
	[39] = { x=-3004.1076660156,y=409.40283203125,z=14.349877357483},
	[40] = { x=-2200.2512207031,y=-355.58557128906,z=12.590641975403},
	[41] = { x=-658.15679931641,y=-559.52203369141,z=34.149471282959},
	[42] = { x=-652.58679199219,y=-606.70764160156,z=32.659557342529},
	[43] = { x=-149.21115112305,y=-715.42248535156,z=34.135692596436},
	[44] = { x=-58.893852233887,y=-568.96771240234,z=37.705894470215},
	[45] = { x=467.64831542969,y=-624.27209472656,z=27.912242889404}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not emservico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(23,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR ROTA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
					    ToggleActionMenu()
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if emservico then
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),entregas[destino].x,entregas[destino].y,entregas[destino].z,true)
			if distance <= 50 then
				DrawMarker(21,entregas[destino].x,entregas[destino].y,entregas[destino].z-0.70,0,0,0,0,180.0,130.0,2.0,2.0,1.0,211,176,72,100,1,0,0,1)
				if distance <= 2.5 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA CONTINUAR A ROTA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						if IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("mi4")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("coach"))then
							RemoveBlip(blip)
							if destino == 20 then
								emP.checkPayment(300)
								destino = 1
--								emservico = false
--				                RemoveBlip(blip)
							end
							if destino == 45 then
								emP.checkPayment(500)
								destino = 21
--								emservico = false
--				                RemoveBlip(blip)
                            end								
							emP.checkPayment(0)
							destino = destino + 1
							CriandoBlip(entregas,destino)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if emservico then
			if IsControlJustPressed(0,168) then
				emservico = false
				RemoveBlip(blip)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
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

function CriandoBlip(entregas,destino)
	blip = AddBlipForCoord(entregas[destino].x,entregas[destino].y,entregas[destino].z)
	SetBlipSprite(blip,1)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Motorista")
	EndTextCommandSetBlipName(blip)
end
RegisterNUICallback("ButtonClick",function(data,cb)
    local ped = PlayerPedId()
	if data == "rota1" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
        emservico = true
		destino = 1
		CriandoBlip(entregas,destino)
		ToggleActionMenu()
	elseif data == "rota2" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		emservico = true
		destino = 21
		CriandoBlip(entregas,destino)
		CriandoBlip(locs,selecionado)
		ToggleActionMenu()
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)