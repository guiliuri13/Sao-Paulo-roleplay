-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA É 100% GRATUITO E OPEN SOURCE, SUA VENDA É PROIBIDA ] --
-- [ VISITE NOSSA LOJA E SAIBA MAIS SOBRE NOSSO TRABALHO - discord.gg/bABGBEX ] --
-- [ VISITE NOSSO GITHUB PARA TER ACESSO A MAIS SCRIPTS GRATUITOS COMO ESSE AQUI ] --
-- [ PARA CONSEGUIR AJUDA COM ESSE OU OUTRO DE NOSSOS SISTEMAS GRATUITOS, ACESSE NOSSO DISCORD ] --

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

local webhookarsenal = "https://discord.com/api/webhooks/795540489444524062/NrHAgnWVbMM8jxWJGnNxuLsAWkzyo48BhahUkDOXB7_7w7m6SSdm5t06zGiOuHJZfu_t"

vRPex = Tunnel.getInterface("bdl_pdsystem")

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end

-- [ Callback das ações dos botões ]
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	local identity = vRP.getUserIdentity(user_id)
	if data == "m4a1" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_CARBINERIFLE"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"),150,0,0)
			TriggerEvent("Notify", "sucesso", "Você pegou sua parafal!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma PARAFAL do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal",9000)
		end

	elseif data == "m4a4" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),150,0,0)
			TriggerEvent("Notify", "sucesso", "Você pegou sua imbel!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma IMBEL do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "mp5" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPDW"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),130,0,0)
			TriggerEvent("Notify", "sucesso", "Você pegou sua MP5!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma MP5 do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "mpx" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SMG"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),130,0,0) 
			TriggerEvent("Notify","sucesso","Você pegou sua MPX!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma MPX do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "shot45" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),10,0,0)
			TriggerEvent("Notify","sucesso","Você pegou sua PUMP CBC!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma PUMP CBC do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "shot12" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN"),10,0,0)
			TriggerEvent("Notify","sucesso","Você pegou sua PUMP MILITAR!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma PUMP MILITAR do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "fiveseven" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPISTOL"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),75,0,0)
			TriggerEvent("Notify","sucesso","Você pegou sua Five Seven!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma FIVE SEVEN do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "glock18" then
		if vRPex.checkPermission("policia.permissao") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PISTOL_MK2"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),75,0,0)
			TriggerEvent("Notify","sucesso","Você pegou sua Glock!")
			local msg = "```[Polícia Militar] "..identity44.name.." "..identity44.firstname.." pegou uma GLOCK do arsenal ás: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." !.```" 
			SendWebhookMessage(webhookarsenal,msg)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end
		
	elseif data == "take-kit" then
		if vRPex.checkPermission("policia.permissao") then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,0)
			GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,0)
			GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
			vRP.giveInventoryItem(user_id,"radio",1)
			TriggerEvent("Notify","sucesso","Você pegou seu kit basico!")
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end
		
	elseif data == "rem-kit" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_NIGHTSTICK"))
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_STUNGUN"))
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_FLASHLIGHT"))
		vRPex.tryGetInventoryItem(user_id,"radio",1)
		TriggerEvent("Notify","sucesso","Você guardou seu kit básico.")
		
	elseif data == "clear" then
		RemoveAllPedWeapons(ped,0)
		TriggerEvent("Notify","sucesso","Você guardou todos os equipamentos no arsenal.")

	elseif data == "on-duty" then
		TriggerServerEvent('bdl:onduty')

	elseif data == "off-duty" then
		TriggerServerEvent('bdl:offduty')
		
	elseif data == "onarmor" then
		if vRPex.checkPermission("policia.permissao") then
			TriggerServerEvent('bdl:onarmor')
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end
		
	elseif data == "offarmor" then
		TriggerServerEvent('bdl:offarmor')
	
	elseif data == "fechar" then
		ToggleActionMenu()
	
	end
end)

-- [ Coordenadas ] --
local system = {
	{ ['x'] = 460.20, ['y'] = -981.26, ['z'] = 30.68 },
	{ ['x'] = -1104.491, ['y'] = -822.17, ['z'] = 14.28 },
	--460.20913696289,-981.26800537109,30.689661026001
--	447.99829101562,-973.46228027344,30.689601898194
}



-- [ Thread do Menu ] --
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000
		for k,v in pairs(system) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local system = system[k]
			
			if distance <= 5 then
				DrawMarker(20, system.x, system.y, system.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				sleep = 5
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and vRPex.checkOfficer() then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
