local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local NameArma = { 
   [1] = { ['A'] = "wbody|WEAPON_COMBATPISTOL", ['B'] = "wammo|WEAPON_COMBATPISTOL" , ['C'] = "WEAPON_COMBATPISTOL"},
   [2] = { ['A'] = "wbody|WEAPON_CARBINERIFLE", ['B'] = "wammo|WEAPON_CARBINERIFLE", ['C'] = "WEAPON_CARBINERIFLE" },
   [3] = { ['A'] = "wbody|WEAPON_SPECIALCARBINE", ['B'] = "wammo|WEAPON_SPECIALCARBINE", ['C'] = "WEAPON_SPECIALCARBINE" },
   [4] = { ['A'] = "wbody|WEAPON_PUMPSHOTGUN_MK2", ['B'] = "wammo|WEAPON_PUMPSHOTGUN_MK2" , ['C'] = "WEAPON_PUMPSHOTGUN_MK2"},
   [5] = { ['A'] = "wbody|WEAPON_NIGHTSTICK", ['B'] = "wammo|WEAPON_NIGHTSTICK" , ['C'] = "WEAPON_NIGHTSTICK"},
   [6] = { ['A'] = "wbody|WEAPON_FLASHLIGHT", ['B'] = "wammo|WEAPON_FLASHLIGHT", ['C'] = "WEAPON_FLASHLIGHT" },
   [7] = { ['A'] = "wbody|WEAPON_STUNGUN", ['B'] = "wammo|WEAPON_STUNGUN", ['C'] = "WEAPON_STUNGUN" }
}

RegisterServerEvent('nav_armaspm:permissao')
AddEventHandler('nav_armaspm:permissao', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pm.permissao") or vRP.hasPermission(user_id,"forcanacional.permissao")then
		TriggerClientEvent('nav_armaspm:permissao', source)
	end
end)

RegisterServerEvent('nav_armaspm:Arsenal')
AddEventHandler('nav_armaspm:Arsenal', function(idDon)

    local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getSData("chest:"..tostring("static:1"))
    local items = json.decode(data) or {}
	if idDon and items[NameArma[idDon].A] and parseInt(items[NameArma[idDon].A].amount) >= 1 then 
	    local dsPode = false
	    local dsdsdsweapons = vRPclient.getWeapons(source)
		for k,v in pairs(dsdsdsweapons) do
		    if k == NameArma[idDon].C then	
				dsPode = false
				--TriggerClientEvent("Notify",source,"sucesso",""..k.." "..NameArma[idDon].C.."")
            else
                dsPode = true
            end	
        end			
		
		
		if dsPode == false then		
		    if items[NameArma[idDon].B] and parseInt(items[NameArma[idDon].B].amount) >= 1 then 
			    TriggerClientEvent('nav_armaspm:permissao', source)
			    local quantidade = vRP.prompt(source, "Quanto de munição deseja tirar ? EX 1 a 100","")
				local quantidade = parseInt(quantidade)
				if quantidade > 0 and quantidade < 101 then
			
			        items[NameArma[idDon].B].amount = items[NameArma[idDon].B].amount - quantidade
			        
			        TriggerClientEvent("Notify",source,"sucesso","".. items[NameArma[idDon].A].amount.." Unidades restantes")
	                TriggerClientEvent('nav_armaspm:equipar', source, idDon, quantidade)
					
					if items[NameArma[idDon].B].amount < 1 then
					    items[NameArma[idDon].B].amount = nil
					    items[NameArma[idDon].B] = nil
					end
					vRP.setSData("chest:"..tostring("static:1"),json.encode(items))
				else
		            TriggerClientEvent("Notify",source,"negado","Digite valor valido . 1 a 100")
					TriggerClientEvent('nav_armaspm:permissao', source)
		        end
		    else
		        TriggerClientEvent("Notify",source,"negado","Sem estoque desta munição.")
		    end
		else
	        if idDon == 6 then
			
		        items[NameArma[idDon].A].amount = items[NameArma[idDon].A].amount - 1
			
			    TriggerClientEvent('nav_armaspm:equiparca', source)
			    if items[NameArma[idDon].A].amount < 1 then 
			        items[NameArma[idDon].A].amount = nil
			        items[NameArma[idDon].A] = nil
			    end
			    vRP.setSData("chest:"..tostring("static:1"),json.encode(items))
			    TriggerClientEvent('nav_armaspm:permissao', source)
			
	        elseif idDon == 5 then
			
		        items[NameArma[idDon].A].amount = items[NameArma[idDon].A].amount - 1
			
			    TriggerClientEvent('nav_armaspm:equiparlanterna', source)
			    if items[NameArma[idDon].A].amount < 1 then 
			        items[NameArma[idDon].A].amount = nil
			        items[NameArma[idDon].A] = nil
			    end
			    vRP.setSData("chest:"..tostring("static:1"),json.encode(items))
			    TriggerClientEvent('nav_armaspm:permissao', source)
		    else
		
		        if items[NameArma[idDon].B] and parseInt(items[NameArma[idDon].B].amount) >= 1 then 
				    TriggerClientEvent('nav_armaspm:permissao', source)
			        local quantidade = vRP.prompt(source, "Quanto de munição deseja tirar ? EX 1 a 100","")
				    local quantidade = parseInt(quantidade)
				    if quantidade > 0 and quantidade < 101 then

			            items[NameArma[idDon].B].amount = items[NameArma[idDon].B].amount - quantidade
			            items[NameArma[idDon].A].amount = items[NameArma[idDon].A].amount - 1
						
			            TriggerClientEvent("Notify",source,"sucesso","".. items[NameArma[idDon].A].amount.."Unidades restantes")
	                    TriggerClientEvent('nav_armaspm:equipar', source, idDon, quantidade)
						
					    if items[NameArma[idDon].A].amount < 1 then
					        items[NameArma[idDon].A].amount = nil
					        items[NameArma[idDon].A] = nil
					    end
					    
						if items[NameArma[idDon].B].amount < 1 then
					        items[NameArma[idDon].B].amount = nil
					        items[NameArma[idDon].B] = nil
					    end
					    vRP.setSData("chest:"..tostring("static:1"),json.encode(items))
				    else
		                TriggerClientEvent("Notify",source,"negado","Digite valor valido . 1 a 100")
					    TriggerClientEvent('nav_armaspm:permissao', source)
					end
		        else
		            TriggerClientEvent("Notify",source,"negado","Sem estoque desta minição.")
		        end
		    end
		end
	else
		TriggerClientEvent("Notify",source,"negado","Sem estoque deste armamento.")
	end
end)
RegisterServerEvent('nav_armaspm:colete')
AddEventHandler('nav_armaspm:colete', function()
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasGroup(user_id,"Policia") or vRP.hasGroup(user_id,"Forca")then
	    if vRPclient.getArmour(source) < 1 then 
	        local data = vRP.getSData("chest:"..tostring("static:1"))
		    local items = json.decode(data) or {}
		    if items["colete1"] and items["colete1"].amount >= 1 then
		
		        local colete = 100
		        vRPclient.setArmour(source,100)
		        vRP.setUData(user_id,"vRP:colete", json.encode(colete))
		   
		        items["colete1"].amount = items["colete1"].amount - 1
		        TriggerClientEvent("Notify",source,"sucesso","Colete equipado")
		   
		        if items["colete1"].amount < 1 then 
			       items["colete1"].amount = nil
			       items["colete1"] = nil
			    end
			    vRP.setSData("chest:"..tostring("static:1"),json.encode(items))

		    else
		       TriggerClientEvent("Notify",source,"sucesso","Sem estoque deste armamento.")
		    end
		else
		    TriggerClientEvent("Notify",source,"sucesso","Ja esta de colete.")
		end
	end
end)


RegisterServerEvent('nav_armaspm:zerocolete')
AddEventHandler('nav_armaspm:zerocolete', function()
    local source = source
	local user_id = vRP.getUserId(source)
	
    local data = vRP.getSData("chest:"..tostring("static:1"))
    local items = json.decode(data) or {}
	
	if vRP.hasPermission(user_id,"pm.permissao") then
	
	    local dsdsdsweapons = vRPclient.getWeapons(source)
		for k,v in pairs(dsdsdsweapons) do

            if k == "WEAPON_COMBATPISTOL" then 
			    if items["wbody|WEAPON_COMBATPISTOL"] == nil then
					items["wbody|WEAPON_COMBATPISTOL"] = { amount = parseInt(1) } 
					TriggerClientEvent("Notify",source,"sucesso","1")
		        else
			         items["wbody|WEAPON_COMBATPISTOL"].amount = items["wbody|WEAPON_COMBATPISTOL"].amount + 1	
					 TriggerClientEvent("Notify",source,"sucesso","1")
				end
				if v.ammo > 1 then
				    if items["wammo|WEAPON_COMBATPISTOL"] == nil then
		    	        items["wammo|WEAPON_COMBATPISTOL"] = { amount = { amount = parseInt(v.ammo) }  } 
		            else
			            items["wammo|WEAPON_COMBATPISTOL"].amount = items["wammo|WEAPON_COMBATPISTOL"].amount + v.ammo
					end
				end
		    end
			if k == "WEAPON_CARBINERIFLE" then 
			    if items["wbody|WEAPON_CARBINERIFLE"] == nil then
		    	    items["wbody|WEAPON_CARBINERIFLE"] = { amount = parseInt(1) } 
		        else
			         items["wbody|WEAPON_CARBINERIFLE"].amount = items["wbody|WEAPON_CARBINERIFLE"].amount + 1
				end
				if v.ammo > 1 then
				    if items["wammo|WEAPON_CARBINERIFLE"] == nil then
		    	        items["wammo|WEAPON_CARBINERIFLE"] = { amount = parseInt(v.ammo) }  
		            else
			            items["wammo|WEAPON_CARBINERIFLE"].amount = items["wammo|WEAPON_CARBINERIFLE"].amount + v.ammo
					end
				end
		    end
			if k == "WEAPON_SPECIALCARBINE" then 
			    if items["wbody|WEAPON_SPECIALCARBINE"] == nil then
		    	    items["wbody|WEAPON_SPECIALCARBINE"] = { amount = parseInt(1) } 
		        else
			         items["wbody|WEAPON_SPECIALCARBINE"].amount = items["wbody|WEAPON_SPECIALCARBINE"].amount + 1
				end
				if v.ammo > 1 then
				    if items["wammo|WEAPON_SPECIALCARBINE"] == nil then
		    	        items["wammo|WEAPON_SPECIALCARBINE"] = { amount = parseInt(v.ammo) }  
		            else
			            items["wammo|WEAPON_SPECIALCARBINE"].amount = items["wammo|WEAPON_SPECIALCARBINE"].amount + v.ammo
					end
				end
		    end
			if k == "WEAPON_PUMPSHOTGUN_MK2" then 
			    if items["wbody|WEAPON_PUMPSHOTGUN_MK2"] == nil then
		    	    items["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { amount = parseInt(1) }  
		        else
			         items["wbody|WEAPON_PUMPSHOTGUN_MK2"].amount = items["wbody|WEAPON_PUMPSHOTGUN_MK2"].amount + 1
				end
				if v.ammo > 1 then
				    if items["wammo|WEAPON_PUMPSHOTGUN_MK2"] == nil then
		    	        items["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { amount = parseInt(v.ammo) }  
		            else
			            items["wammo|WEAPON_PUMPSHOTGUN_MK2"].amount = items["wammo|WEAPON_PUMPSHOTGUN_MK2"].amount + v.ammo
					end
				end
				vRP.setSData("chest:"..tostring("static:1"),json.encode(items))	
		    end
			if k == "WEAPON_NIGHTSTICK" then 
			    if items["wbody|WEAPON_NIGHTSTICK"] == nil then
		    	    items["wbody|WEAPON_NIGHTSTICK"] = { amount = parseInt(1) } 
		        else
			         items["wbody|WEAPON_NIGHTSTICK"].amount = items["wbody|WEAPON_NIGHTSTICK"].amount + 1
				end
		    end
			if k == "WEAPON_FLASHLIGHT" then 
			    if items["wbody|WEAPON_FLASHLIGHT"] == nil then
		    	    items["wbody|WEAPON_FLASHLIGHT"] = { amount = parseInt(1) }  
		        else
			         items["wbody|WEAPON_FLASHLIGHT"].amount = items["wbody|WEAPON_FLASHLIGHT"].amount + 1
				end
		    end
			if k == "WEAPON_STUNGUN" then 
			    if items["wbody|WEAPON_STUNGUN"] == nil then
		    	    items["wbody|WEAPON_STUNGUN"] = { amount = parseInt(1) } 
		        else
			         items["wbody|WEAPON_STUNGUN"].amount = items["wbody|WEAPON_STUNGUN"].amount + 1
				end
				if v.ammo > 1 then
				    if items["wammo|WEAPON_STUNGUN"] == nil then
		    	        items["wammo|WEAPON_STUNGUN"] = { amount = parseInt(v.ammo) }  
		            else
			            items["wammo|WEAPON_STUNGUN"].amount = items["wammo|WEAPON_STUNGUN"].amount + v.ammo
					end
				end	
		    end
			vRP.setSData("chest:"..tostring("static:1"),json.encode(items))	
	    end
		if vRPclient.getArmour(source) >= 70 then 
		    local colete = 0
		    vRPclient.setArmour(source,0)
		    vRP.setUData(user_id,"vRP:colete", json.encode(colete))
			
		    if items["colete1"] == nil then
			   items["colete1"] = { amount = parseInt(1) }
			else
			   items["colete1"].amount =  items["colete1"].amount + 1
			end
		end
        vRP.setSData("chest:"..tostring("static:1"),json.encode(items))	
	end
end)