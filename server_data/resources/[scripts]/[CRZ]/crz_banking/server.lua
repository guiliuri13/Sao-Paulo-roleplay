local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	local user_id = vRP.getUserId(_source)
	if amount == nil or amount <= 0 or amount > vRP.getMoney(user_id) then
		TriggerClientEvent('bank:result', _source, "error", "Montante invalido.")
	else
		vRP.tryDeposit(user_id, tonumber(amount))
		TriggerClientEvent('bank:result', _source, "success", "Deposito Efetutado.")
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local user_id = vRP.getUserId(_source)
	local base = 0
	amount = tonumber(amount)
	local getbankmoney = vRP.getBankMoney(user_id)
	if amount == nil or amount <= 0 or amount > getbankmoney then
		TriggerClientEvent('bank:result', _source, "error", "Montante invalido.")
	else
		vRP.tryWithdraw(user_id,amount)
		TriggerClientEvent('bank:result', _source, "success", "Saque efetuado.")
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local user_id = vRP.getUserId(_source)
	getbankmoney = vRP.getBankMoney(user_id)
	TriggerClientEvent('currentbalance1', _source, getbankmoney)
end)


RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
local _source = source
	local user_id = vRP.getUserId(_source)
	local nplayer = vRP.getUserSource(parseInt(to))
	if nplayer then
		if(to == nil or to == "") then
			TriggerClientEvent('bank:result', _source, "error", "Destinatário inválido.")
		else
			balance = vRP.getBankMoney(user_id)
			nbalance = vRP.getBankMoney(tonumber(to))
			if tonumber(to) == tonumber(user_id) then
				TriggerClientEvent('bank:result', _source, "error", "Você não pode transferir para si mesmo.")
			else
				if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
					TriggerClientEvent('bank:result', _source, "error", "Você não tem dinheiro suficiente no banco.")
				else
					vRP.setBankMoney(user_id,balance-tonumber(amountt))
					vRP.setBankMoney(tonumber(to),nbalance+tonumber(amountt))
					local identity = vRP.getUserIdentity(user_id)
					local identity2 = vRP.getUserIdentity(to)
					TriggerClientEvent('chatMessage',_source,"ALERTA",{255,70,50},"Voce transferiu ^1$"..amountt.." ^0para conta bancária de ^1"..identity2.name.." "..identity2.firstname..".")
					TriggerClientEvent('chatMessage',nplayer,"ALERTA",{255,70,50},"Voce recebeu ^1$"..amountt.." ^0por meio de transferência bancária de ^1"..identity.name.." "..identity.firstname..".")
				end
			end
		end
	else
		TriggerClientEvent('bank:result', _source, "error", "Destinatário offline.")
	end
end)