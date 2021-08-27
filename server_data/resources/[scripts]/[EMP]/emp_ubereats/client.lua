local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local quantidade = 0
local statuses = false
local nveh = nil
local pegando = false
local andamento = false
local andamento2 = false
local object = nil
local encomendapega = false
local npcoord = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local npclocal = {
	[1] = {x=152.42,y=-1478.68,z=29.35,hash=0xDB9C0997,hash2="s_m_m_linecook"}, 
	[2] = {x=-180.64,y=-1429.02,z=31.30,hash=0xED0CE4C6,hash2="s_m_m_migrant_01"},
	[3] = {x=-842.47,y=-1128.33,z=7.01,hash=0xD55B2BF5,hash2="s_f_y_migrant_01"},
	[4] = {x=804.11,y=-731.09,z=27.59,hash=0xDB9C0997,hash2="s_m_m_linecook"}, 
	[5] = {x=-627.66,y=239.05,z=81.89,hash=0xED0CE4C6,hash2="s_m_m_migrant_01"},
	[6] = {x=90.76,y=298.28,z=110.21,hash=0xD55B2BF5,hash2="s_f_y_migrant_01"}, 
	[7] = {x=1247.16,y=-349.87,z=69.20,hash=0xDB9C0997,hash2="s_m_m_linecook"}
}

local pegarlocal = {
	[1] = {x=147.10,y=-1463.41,z=29.14}, 
	[2] = {x=-187.12,y=-1423.76,z=31.47}, 
	[3] = {x=-845.79,y=-1141.37,z=6.75}, 
	[4] = {x=788.74,y=-733.80,z=27.70}, 
	[5] = {x=-641.96,y=236.11,z=81.69}, 
	[6] = {x=98.35,y=287.85,z=109.97}, 
	[7] = {x=1227.00,y=-353.99,z=69.11}
}

local motolocal = {
	[1] = {x=143.72,y=-1462.58,z=29.35},
	[2] = {x=-188.72,y=-1422.01,z=31.33}, 
	[3] = {x=-843.08,y=-1146.02,z=6.79}, 
	[4] = {x=785.54,y=-734.35,z=27.63}, 
	[5] = {x=-644.88,y=232.17,z=80.77}, 
	[6] = {x=95.43,y=285.05,z=110.20},
	[7] = {x=1223.85,y=-353.38,z=68.97} 
}

local entregalocal = {
	[1] = {x=8.68,y=-243.38,z=47.66}, 
	[2] = {x=66.41,y=-255.80,z=52.35},
	[3] = {x=85.61,y=-272.27,z=47.41}, 
	[4] = {x=18.69,y=-209.50,z=52.85}, 
	[5] = {x=-44.81,y=-180.49,z=54.26}, 
	[6] = {x=-40.96,y=-58.68,z=63.81}, 
	[7] = {x=-333.12,y=101.46,z=71.21}, 
	[8] = {x=-383.78,y=152.68,z=65.53}, 
	[9] = {x=-598.77,y=147.34,z=61.67}, 
	[10] = {x=-628.07,y=169.60,z=61.15}, 
	[11] = {x=-620.04,y=209.05,z=74.20}, 
	[12] = {x=479.64,y=-1735.80,z=29.15}, 
	[13] = {x=495.33,y=-1823.41,z=28.86}, 
	[14] = {x=437.81,y=-1876.05,z=27.60}, 
	[15] = {x=324.34,y=-1937.30,z=25.01}, 
	[16] = {x=200.18,y=-2002.28,z=18.86},
	[17] = {x=1203.61,y=-598.37,z=68.06},
	[18] = {x=414.99,y=-217.31,z=59.91},
	[19] = {x=-664.49,y=-391.42,z=34.59},
	[20] = {x=-668.29,y=-971.36,z=22.34}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO TRABALHO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('emp_ubereats:permissao')
AddEventHandler('emp_ubereats:permissao',function()
	if not emservico then
		emservico = true
		parte = 0
		TriggerEvent("Notify","importante","Voce iniciou seu <b>trabalho</b>, pegue a <b>Moto</b> na garagem!")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local coordsx,coordsy,coordsz = table.unpack(GetEntityCoords(ped))
		if GetDistanceBetweenCoords(GetEntityCoords(ped), 219.39,106.35,100.74,true) <= 5 then
		    draw3DText(219.39408874512,106.35223388672,100.74636077881+0.54, "Aperte [~r~E~w~] Para Acessar o Uber Eats")
		    DrawMarker(37, 219.39408874512,106.35223388672,100.74636077881-0.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 4, 4, 50, 0, true, false, false)
		    if GetDistanceBetweenCoords(GetEntityCoords(ped), 219.39408874512,106.35223388672,100.74636077881,true) <= 1 then
                if IsControlJustPressed(0,38) then	
				    TriggerServerEvent('emp_ubereats:permissao')
				end
			end
		end
		if emservico and parte == 0 then
			local ui = GetMinimapAnchor()
            if statuses then	
				statuses = not statuses
			else
			   if IsPedInAnyVehicle(PlayerPedId()) then
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   else
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   end
			end
			if GetDistanceBetweenCoords(GetEntityCoords(ped), 232.85075378418,101.00042724609,93.835861206055,true) <= 20 then
		        draw3DText(232.85075378418,101.00042724609,93.835861206055+0.47, "Aperte [~r~E~w~] Para Pegar Sua Moto")
		        if GetDistanceBetweenCoords(GetEntityCoords(ped), 232.85075378418,101.00042724609,93.835861206055,true) <= 1 then
                    if IsControlJustPressed(0,38) then	
                    	Fade(1200)
				        TriggerEvent("Notify","importante","Voce pegou a <b>Moto</b> na garagem, espere um <b>chamado</b>!")
		                spawnMoto()
		                Wait(10)
		                vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
		                TriggerEvent("Notify","bom","Chamado recebido, vá até o <b>local</b> e pegue a <b>comida</b>!")
                        parte = 1
                        destino = math.random(1,7)
		                CriandoBlipPegar(motolocal,destino)
				    end
			    end
		    end
		end
		if emservico and parte == 1 then
		    local veh = GetMotoPosition(10)
			local coordsMoto = GetOffsetFromEntityInWorldCoords(veh, 0.0, -0.9, 0.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),motolocal[destino].x,motolocal[destino].y,motolocal[destino].z,true)
			local distance2 = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsMoto.x,coordsMoto.y,coordsMoto.z,true)
			local distance3 = GetDistanceBetweenCoords(GetEntityCoords(ped),pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z,true)
			local distancecar = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsMoto.x,coordsMoto.y,coordsMoto.z, true)
			local ui = GetMinimapAnchor()
            if statuses then	
				statuses = not statuses
			else
			   if IsPedInAnyVehicle(PlayerPedId()) then
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   else
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   end
			end
			if distance <= 50 and not pegando and not npcoord then
				DrawMarker(21,motolocal[destino].x,motolocal[destino].y,motolocal[destino].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,65,105,255,50,0,0,0,1)
                if IsControlJustPressed(0,38) and not andamento and not andamento2 and distance <= 2.0 then
                	Fade(1200)
                	RequestModel(GetHashKey(npclocal[destino].hash2))
					while not HasModelLoaded(GetHashKey(npclocal[destino].hash2)) do
						Citizen.Wait(1)
					end
                    npc = CreatePed(4,npclocal[destino].hash,npclocal[destino].x,npclocal[destino].y,npclocal[destino].z-1,3374176,true,false)
					SetBlockingOfNonTemporaryEvents(npc,true)
					SetPedSeeingRange(npc,0.0)
					SetPedHearingRange(npc,0.0)
					SetPedFleeAttributes(npc,0,false)
					SetPedKeepTask(npc,true)
					SetEntityInvincible(npc,true)
					SetPedCanRagdoll(npc,false)
					SetPedDiesWhenInjured(npc,false)
					SetPedCombatMovement(npc,false)
					numero = math.random(1,3)
                    if numero == 1 then
                        RequestModel(GetHashKey("prop_paper_bag_01"))
                        while not HasModelLoaded(GetHashKey("prop_paper_bag_01")) do
                            Citizen.Wait(10)
                        end
                        local coords = GetOffsetFromEntityInWorldCoords(npc,0.0,0.0,-5.0)
                        object = CreateObject(GetHashKey("prop_paper_bag_01"),coords.x,coords.y,coords.z,true,true,true)
                        SetEntityCollision(object,false,false)
                        AttachEntityToEntity(object,npc,GetPedBoneIndex(npc,28422),0.25,0.0,0.06,65.0,-130.0,-65.0,true,true,false,true,0,true)
                        SetEntityAsMissionEntity(object,true,true)
                    elseif numero == 2 then
                        vRP.CarregarAnim("anim@heists@box_carry@")
                        RequestModel(GetHashKey("prop_pizza_box_02"))
                        while not HasModelLoaded(GetHashKey("prop_pizza_box_02")) do
                            Citizen.Wait(10)
                        end
                        TaskPlayAnim(npc,"anim@heists@box_carry@","idle",3.0,3.0,-1,50,0,0,0,0)
                        local coords = GetOffsetFromEntityInWorldCoords(npc,0.0,0.0,-5.0)
                        object = CreateObject(GetHashKey("prop_pizza_box_02"),coords.x,coords.y,coords.z,true,true,true)
                        SetEntityCollision(object,false,false)
                        AttachEntityToEntity(object,npc,GetPedBoneIndex(npc,11816),-0.05,0.38,-0.050,15.0,285.0,270.0,true,false,false,true,1,true)
                        SetEntityAsMissionEntity(object,true,true)
                        SetEntityAsMissionEntity(object,true,true)
                    elseif numero == 3 then
                        vRP.CarregarAnim("anim@heists@box_carry@")
                        RequestModel(GetHashKey("prop_pizza_box_01"))
                        while not HasModelLoaded(GetHashKey("prop_pizza_box_01")) do
                            Citizen.Wait(10)
                        end
                        TaskPlayAnim(npc,"anim@heists@box_carry@","idle",3.0,3.0,-1,50,0,0,0,0)
                        local coords = GetOffsetFromEntityInWorldCoords(npc,0.0,0.0,-5.0)
                        object = CreateObject(GetHashKey("prop_pizza_box_01"),coords.x,coords.y,coords.z,true,true,true)
                        SetEntityCollision(object,false,false)
                        AttachEntityToEntity(object,npc,GetPedBoneIndex(npc,11816),-0.05,0.38,-0.050,15.0,285.0,270.0,true,false,false,true,1,true)
                        SetEntityAsMissionEntity(object,true,true)
                    end
					TaskGoToCoordAnyMeans(npc, pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z, 1.0, 0, 0, 786603, 0xbf800000)
					npcoord = true
				end
			end
			if distance3 <= 50 and not pegando and npcoord then
				if distance3 < 1.3 and not IsPedInAnyVehicle(ped) and npcoord and GetDistanceBetweenCoords(GetEntityCoords(npc),pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z,true) <= 0.5 then
					FreezeEntityPosition(npc,true)
					DrawText3Ds(pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z+0.35,"~b~[E] ~w~Pegar Comida")
                    if IsControlJustPressed(0,38) and not andamento and not andamento2 then
                    	quantidade = 0
                        TriggerEvent('cancelando',true)
                        Wait(10)
                        pegando = true
                        ClearPedTasksImmediately(ped)
                        vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        if DoesEntityExist(object) then
                            DetachEntity(object,false,false)
                            TriggerServerEvent("trydeleteobj",ObjToNet(object))
                            object = nil
                        end
                        ClearPedSecondaryTask(npc)
                        ClearPedTasks(npc)
                        FreezeEntityPosition(npc,false)
                        TaskGoToCoordAnyMeans(npc, npclocal[destino].x,npclocal[destino].y,npclocal[destino].z, 1.0, 0, 0, 786603, 0xbf800000)
                        npcoord = false
                        RemoveBlip(blip)
                        TriggerEvent("Notify","importante","<b>Comida</b> pegue, guarde na sua <b>Moto</b>!")
                        if numero == 1 then
                            RequestModel(GetHashKey("prop_paper_bag_01"))
                            while not HasModelLoaded(GetHashKey("prop_paper_bag_01")) do
                                Citizen.Wait(10)
                            end
                        	local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
                            object = CreateObject(GetHashKey("prop_paper_bag_01"),coords.x,coords.y,coords.z,true,true,true)
                            SetEntityCollision(object,false,false)
                            AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,28422),0.25,0.0,0.06,65.0,-130.0,-65.0,true,true,false,true,0,true)
                            SetEntityAsMissionEntity(object,true,true)
                        	andamento = true
                        elseif numero == 2 then
                        	vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_pizza_box_02",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	andamento2 = true
                        elseif numero == 3 then
                        	vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_pizza_box_01",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	andamento2 = true
                        end
					end
				end
			end
			if distancecar <= 1.0 and not IsPedInAnyVehicle(ped) and pegando then
				if model == 55628203 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
					DrawText3Ds(coordsMoto.x,coordsMoto.y,coordsMoto.z+0.80,"~b~[E] ~w~Guardar")
					local ui = GetMinimapAnchor()
            if statuses then	
				statuses = not statuses
			else
			   if IsPedInAnyVehicle(PlayerPedId()) then
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   else
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   end
			end
	                TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) then
                        if quantidade == 0 then
                            quantidade = quantidade + 1
                            andamento = false
                            andamento2 = false
                            encomendapega = false
				            ClearPedTasksImmediately(ped)
				            vRP._DeletarObjeto()
				            vRP.stopAnim(true)
                            if DoesEntityExist(object) then
                                DetachEntity(object,false,false)
                                TriggerServerEvent("trydeleteobj",ObjToNet(object))
                                object = nil
                            end
                            vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                            TriggerEvent("Notify","importante","<b>Comida</b> guardada, entre na sua <b>Moto</b> e espere receber a <b>localizaçao</b> da <b>entrega</b>!")
                            time = math.random(5000,10000)
                            destinoantigo2 = destino2
                            destino2 = math.random(1,20)
                            while true do
                                if destinoantigo2 == destino2 then
                                    destino2 = math.random(1,20)
                                else
                                    break
                                end
                                Citizen.Wait(1)
                            end
                            SetTimeout(400,function()
                        	    pegando = false
                                parte = 2
                            end)
                            Wait(time)
                            vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                            TriggerEvent("Notify","bom","Localizaçao recebida, vá até o <b>local</b> e entregue a <b>comida</b>!")
                            CriandoBlipEntrega(entregalocal,destino2)
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                            TriggerEvent("Notify","aviso","Erro, <b>reinicie</b> o seu <b>emprego</b>!")
                            quantidade = 0
                        end
	                end
				end
			end
			if pegando and not npcoord then
				if GetDistanceBetweenCoords(GetEntityCoords(npc),npclocal[destino].x,npclocal[destino].y,npclocal[destino].z,true) <= 1.1 then
					Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(npc))
                    npc = nil
                end
            end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		if emservico and parte == 2 then
		    local veh = GetMotoPosition(10)
			local coordsMoto = GetOffsetFromEntityInWorldCoords(veh, 0.0, -0.9, 0.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z,true)
			local distancecar = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsMoto.x,coordsMoto.y,coordsMoto.z, true)
			local ui = GetMinimapAnchor()
            if statuses then	
				statuses = not statuses
			else
			   if IsPedInAnyVehicle(PlayerPedId()) then
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   else
			   drawTxt(ui.right_x+0.0015,ui.bottom_y-0.060,1.0,1.0,0.45,"~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",255,255,255,200)
			   end
			end
			if distancecar <= 1.0 and not IsPedInAnyVehicle(ped) and not pegando then
				if model == 55628203 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
	                DrawText3Ds(coordsMoto.x,coordsMoto.y,coordsMoto.z+0.80,"~b~[E] ~w~Pegar")
                    if IsControlJustPressed(0,38) and not andamento and not andamento2 and not encomendapega then
                        if quantidade > 0 then
                    	    quantidade = quantidade - 1
                    	    pegando = true
                            TriggerEvent('cancelando',true)
				            ClearPedTasksImmediately(ped)
				            FreezeEntityPosition(ped,false)
                            vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                            TriggerEvent("Notify","importante","<b>Comida</b> pegue!")
                            SetTimeout(400,function()
                        	    encomendapega = true
                            end)
                            if numero == 1 then
                                RequestModel(GetHashKey("prop_paper_bag_01"))
                                while not HasModelLoaded(GetHashKey("prop_paper_bag_01")) do
                                    Citizen.Wait(10)
                                end
                        	    local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
                                object = CreateObject(GetHashKey("prop_paper_bag_01"),coords.x,coords.y,coords.z,true,true,true)
                                SetEntityCollision(object,false,false)
                                AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,28422),0.25,0.0,0.06,65.0,-130.0,-65.0,true,true,false,true,0,true)
                                SetEntityAsMissionEntity(object,true,true)
                        	    andamento = true
                            elseif numero == 2 then
                        	    vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_pizza_box_02",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	    andamento2 = true
                            elseif numero == 3 then
                        	    vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_pizza_box_01",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	    andamento2 = true
                            end
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                            TriggerEvent("Notify","aviso","Voce entregou todas as suas <b>comidas</b>!")
                            quantidade = 0
					    end
				    end
				end
			end
			if distancecar <= 1.0 and not IsPedInAnyVehicle(ped) and pegando then
				if model == 55628203 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
	                DrawText3Ds(coordsMoto.x,coordsMoto.y,coordsMoto.z+0.80,"~b~[E] ~w~Guardar")
	                TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) and encomendapega then
                        if quantidade >= 0  then
                            quantidade = quantidade + 1
                            pegando = false
                            andamento = false
                            andamento2 = false
                            FreezeEntityPosition(ped,true)
                            RequestAnimDict("pickup_object")
				            while not HasAnimDictLoaded("pickup_object") do
					            Citizen.Wait(0) 
				            end
				            TaskPlayAnim(ped,"pickup_object","pickup_low",100.0,200.0,0.3,120,0.2,0,0,0)
				            ClearPedTasksImmediately(ped)
				            FreezeEntityPosition(ped,false)
				            vRP._DeletarObjeto()
				            vRP.stopAnim(true)
                            if DoesEntityExist(object) then
                                DetachEntity(object,false,false)
                                TriggerServerEvent("trydeleteobj",ObjToNet(object))
                                object = nil
                            end
                            vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                            TriggerEvent("Notify","importante","<b>Comida</b> guardada!")
                            SetTimeout(400,function()
                                encomendapega = false
                            end)
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                            TriggerEvent("Notify","aviso","Erro, <b>reinicie</b> o seu <b>emprego</b>!")
                            quantidade = 0
                        end
					end
				end
	        end
			if distance <= 50 and pegando and encomendapega then
				if distance < 1.5 and not IsPedInAnyVehicle(ped) then
					DrawText3Ds(entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z+0.35,"~b~[E] ~w~Entregar")
					TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) then
                    	if quantidade == 0 then
                    		Fade(1200)
                    		local pagamento = math.random(55,175)
                    		destinoantigo = destino
							pegando = false
							encomendapega = false
                            andamento = false
                            andamento2 = false
                            vRP._DeletarObjeto()
                            vRP.stopAnim(true)
                            if DoesEntityExist(object) then
                                DetachEntity(object,false,false)
                                TriggerServerEvent("trydeleteobj",ObjToNet(object))
                                object = nil
                            end
                            ClearPedTasksImmediately(ped)
                            TriggerServerEvent("emp_ubereats:receber",pagamento)
                            TriggerEvent("Notify","bom","<b>Comida</b> entregue, voce ganhou <b>$"..pagamento.."</b>!")
                            TriggerEvent("Notify","importante","Entre na <b>Moto</b> e aguarde até receber uma <b>Entrega</b>!")
                            RemoveBlip(blip)
                            time = math.random(20000,30000)
                        	vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                        	TriggerEvent("Notify","bom","Chamado recebido, vá até o <b>local</b> e pegue a <b>comida</b>!")
                            while true do
                                if destinoantigo == destino then
                                    destino = math.random(1,7)
                                else
                                    break
                                end
                                Citizen.Wait(1)
                            end
                            CriandoBlipPegar(motolocal,destino)
		                    parte = 1
                        else
                        	parte = 1
                        	vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	quantidade = 0
                        	TriggerEvent("Notify","aviso","Erro, <b>reinicie</b> o seu <b>emprego</b>!")
                        end
					end
				end
			elseif distance <= 50 and not pegando and not encomendapega then
				DrawMarker(21,entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,65,105,255,50,0,0,0,1)
				if distance < 1.5 and not IsPedInAnyVehicle(ped) then
					DrawMarker(21,entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,65,105,255,50,0,0,0,1)
					DrawText3Ds(entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z+0.35,"~w~ Pegue a Comida na ~b~Moto")
			    end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if andamento then
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,22,true)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if andamento2 then
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,22,true)
		end
	end
end)

function Fade(time)
	DoScreenFadeOut(800)
	Wait(time)
	DoScreenFadeIn(800)
end

function spawnMoto()
	local mhash = "faggio2"
	if not nveh then
	 while not HasModelLoaded(mhash) do
	  RequestModel(mhash)
	    Citizen.Wait(10)
	 end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,237.9354095459,94.705406188965,93.681739807129+0.5,162.92,true,false)
		SetVehicleIsStolen(nveh,false)
		SetVehicleOnGroundProperly(nveh)
		SetEntityInvincible(nveh,false)
		SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
		Citizen.InvokeNative(0xAD738C3085FE7E11,nveh,true,true)
		SetVehicleHasBeenOwnedByPlayer(nveh,true)
		SetVehicleDirtLevel(nveh,0.0)
		SetVehRadioStation(nveh,"OFF")
		SetVehicleEngineOn(GetVehiclePedIsIn(ped,false),true)
		SetModelAsNoLongerNeeded(mhash)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) and emservico and (nveh) then
			emservico = false
			pegando = false
			andamento = false
			andamento2 = false
			quantidade = 0
			parte = 0
			encomendapega = false
			npcoord = false
			TriggerEvent('cancelando',false)
			RemoveBlip(blip)
			vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
			if nveh then
			   DeleteVehicle(nveh)
			   nveh = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
-----------------------------------------------------------------------------------------------------------------------------------------
function GetMotoPosition(radius)
	local ped = PlayerPedId()
	local coordsx = GetEntityCoords(ped, 1)
	local coordsy = GetOffsetFromEntityInWorldCoords(ped, 0.0, radius+0.00001, 0.0)
	local nearVehicle = GetMotoDirection(coordsx, coordsy)
	if IsEntityAVehicle(nearVehicle) then
	    return nearVehicle
	else
		local x,y,z = table.unpack(coordsx)
	    if IsPedSittingInAnyVehicle(ped) then
	        local veh = GetVehiclePedIsIn(ped,true)
	        return veh
	    else
	        local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,8192+4096+4+2+1) 
	        if not IsEntityAVehicle(veh) then 
	        	veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,4+2+1) 
	        end 
	        return veh
	    end
	end
end

function GetMotoDirection(coordFrom,coordTo)
	local position = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a,b,c,d,vehicle = GetRaycastResult(position)
	return vehicle
end

function DrawText3D(x,y,z, text, scl, font) 
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

	local scale = (1/dist)*scl
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	if onScreen then
		SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 180)
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

function drawTxt(x,y,width,height,scale,text,r,g,b,a)
    SetTextFont(4)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextDropShadow(0, 0, 0, 0, 200)
    SetTextDropShadow()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end

function GetMinimapAnchor()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end


function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.028, 0, 0, 0, 78)
end

function CriandoBlipPegar(motolocal,destino)
	blip = AddBlipForCoord(motolocal[destino].x,motolocal[destino].y,motolocal[destino].z)
	SetBlipSprite(blip,162)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Pegar Comida")
	EndTextCommandSetBlipName(blip)
end

function CriandoBlipEntrega(entregalocal,destino2)
	blip = AddBlipForCoord(entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z)
	SetBlipSprite(blip,162)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Comida")
	EndTextCommandSetBlipName(blip)
end

function draw3DText(x,y,z, text)
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