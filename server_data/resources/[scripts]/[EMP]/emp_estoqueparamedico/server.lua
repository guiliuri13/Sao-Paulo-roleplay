local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local dsLiberadoPara = false

RegisterCommand('rebaparamedico',function(source,args,rawCommand)
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"owner.permissao") and dsLiberadoPara == false then
	    dsLiberadoPara = true
	    TriggerClientEvent('chatMessage',-1,"^9 [GOVERNO] Governo liberou uma remessa de medicamento para os medicos .")
	elseif vRP.hasPermission(user_id,"owner.permissao") and dsLiberadoPara == true then
	    dsLiberadoPara = false
	    TriggerClientEvent('chatMessage',-1,"^9 [GOVERNO] Governo bloqueou uma remessa de medicamento para os medicos .")
	end
end)
RegisterCommand('rotaparamedico',function(source,args,rawCommand)
    local source = source
	local user_id = vRP.getUserId(source)
	if dsLiberadoPara == true then
	    if vRP.hasPermission(user_id,"paramedico.permissao") then 
		    TriggerClientEvent('DonSpeed:InicioParamedico', source)
		end
	else 
	    TriggerClientEvent("Notify",source,"sucesso","Não tem permissao ou esta bloqueado .")
	end
end)
local NameVeh = nil

RegisterServerEvent('DonSpeed:CarregandoPara')
AddEventHandler('DonSpeed:CarregandoPara', function()
    local source = source
	local user_id = vRP.getUserId(source)
	
	local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
	local placa_user = vRP.getUserByRegistration(mPlaca)
	local identity = vRP.getUserIdentity(placa_user)
	
	local mala = "chest:u"..parseInt(user_id).."veh_"..mModel
	local data = vRP.getSData(mala)
	local items = json.decode(data) or {}
	
	NameVeh = mala
	
	items["morfina"] = { amount = parseInt(20) } 
    items["desfibrilador"] = { amount = parseInt(20) }
	items["bandagem"] = { amount = parseInt(20) } 
	items["pills"] = { amount = parseInt(20) }

	vRP.setSData(NameVeh,json.encode(items))
	
end)
local ParamedicoValor = { }
RegisterServerEvent('DonSpeed:DescarregandoPara')
AddEventHandler('DonSpeed:DescarregandoPara', function()
    local source = source
	local user_id = vRP.getUserId(source)
	
	local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
	local placa_user = vRP.getUserByRegistration(mPlaca)
	local identity = vRP.getUserIdentity(placa_user)
	
	local mala = "chest:u"..parseInt(user_id).."veh_"..mModel
	local data = vRP.getSData(mala)
	local items = json.decode(data) or {}
	
	NameVeh = mala
	
	ParamedicoValor[1] = parseInt(items["morfina"].amount)
	items["morfina"].amount = nil
	items["morfina"] = nil 

    ParamedicoValor[2] = parseInt(items["desfibrilador"].amount)
	items["desfibrilador"].amount = nil
	items["desfibrilador"] = nil 
	
	ParamedicoValor[3] = parseInt(items["bandagem"].amount)
	items["bandagem"].amount = nil
	items["bandagem"] = nil 
	
	ParamedicoValor[4] = parseInt(items["pills"].amount)
	items["pills"].amount = nil
	items["pills"] = nil 

    vRP.setSData(NameVeh,json.encode(items))
	
    TriggerClientEvent("Notify",source,"sucesso","Descarregou com sucesso")


	local sasadata = vRP.getSData("chest:"..tostring("static:3"))
    local dsitems = json.decode(sasadata) or {}
	
    if dsitems["morfina"] == nil then
	    dsitems["morfina"] = { amount = parseInt(ParamedicoValor[1]) } 
    else
	    dsitems["morfina"].amount = dsitems["morfina"].amount + ParamedicoValor[1]
    end
	if dsitems["desfibrilador"] == nil then
	    dsitems["desfibrilador"] = { amount = parseInt(ParamedicoValor[2]) } 
    else
	    dsitems["desfibrilador"].amount = dsitems["desfibrilador"].amount + ParamedicoValor[1]
    end
	if dsitems["bandagem"] == nil then
	    dsitems["bandagem"] = { amount = parseInt(ParamedicoValor[1]) } 
    else
	    dsitems["bandagem"].amount = dsitems["bandagem"].amount + ParamedicoValor[1]
    end
	if dsitems["pills"] == nil then
	    dsitems["pills"] = { amount = parseInt(ParamedicoValor[1]) } 
    else
	    dsitems["pills"].amount = dsitems["pills"].amount + ParamedicoValor[1]
    end
	
    vRP.setSData("chest:"..tostring("static:3"),json.encode(dsitems))

end)