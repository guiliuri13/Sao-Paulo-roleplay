vRP.prepare("vRP/money_init_user","INSERT IGNORE INTO vrp_user_moneys(user_id,wallet,bank) VALUES(@user_id,@wallet,@bank)")
vRP.prepare("vRP/get_money","SELECT wallet,bank FROM vrp_user_moneys WHERE user_id = @user_id")
vRP.prepare("vRP/set_money","UPDATE vrp_user_moneys SET wallet = @wallet, bank = @bank WHERE user_id = @user_id")

local webhooklink1 = "https://discordapp.com/api/webhooks/761693733145018398/TOygZdwhYfR0nmcBVfrv6kJTk58j_E2xXsuJl1vJUiads3UufsDudTY3TAoys6kUYIme"

function vRP.getMoney(user_id)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		return tmp.wallet or 0
	else
		return 0
	end
end

function vRP.setMoney(user_id,value)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		tmp.wallet = value
	end
end

function vRP.tryPayment(user_id,amount)
	if amount >= 0 then
		local money = vRP.getMoney(user_id)
		if amount >= 0 and money >= amount then
			vRP.setMoney(user_id,money-amount)
			return true
		else
			return false
		end
	end
	return false
end

function vRP.giveMoney(user_id,amount)
	if amount >= 0 then
		local money = vRP.getMoney(user_id)
		vRP.setMoney(user_id,money+amount)
	end
end

function vRP.getBankMoney(user_id)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		return tmp.bank or 0
	else
		return 0
	end
end

function vRP.setBankMoney(user_id,value)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		tmp.bank = value
	end
end

function vRP.giveBankMoney(user_id,amount)
	if amount >= 0 then
		local money = vRP.getBankMoney(user_id)
		vRP.setBankMoney(user_id,money+amount)
	end
end

function vRP.tryWithdraw(user_id,amount)
	local money = vRP.getBankMoney(user_id)
	if amount >= 0 and money >= amount then
		vRP.setBankMoney(user_id,money-amount)
		vRP.giveMoney(user_id,amount)
		return true
	else
		return false
	end
end

function vRP.tryDeposit(user_id,amount)
	if amount >= 0 and vRP.tryPayment(user_id,amount) then
		vRP.giveBankMoney(user_id,amount)
		return true
	else
		return false
	end
end

function vRP.tryFullPayment(user_id,amount)
	if amount >= 0 then
		local money = vRP.getMoney(user_id)
		if money >= amount then
			return vRP.tryPayment(user_id,amount)
		else
			if vRP.tryWithdraw(user_id, amount-money) then
				return vRP.tryPayment(user_id,amount)
			end
		end
	end
	return false
end

AddEventHandler("vRP:playerJoin",function(user_id,source,name)
	vRP.execute("vRP/money_init_user",{ user_id = user_id, wallet = 1000, bank = 20000 })
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		local rows = vRP.query("vRP/get_money",{ user_id = user_id })
		if #rows > 0 then
			tmp.bank = rows[1].bank
			tmp.wallet = rows[1].wallet
			local identity = vRP.getUserIdentity(user_id)
			local data = os.date("**%d-%m-%Y** ás **%X**")
    		local content1 = "```[ID "..user_id.."]"..identity.name.." "..identity.firstname.." logou na cidade ás ("..data..") com R$"..tmp.wallet.." na mão e R$"..tmp.bank.." no banco.```"
    		PerformHttpRequest(webhooklink1, function(err, text, headers) end, 'POST', json.encode({username = "Administrador", content = content1}), { ['Content-Type'] = 'application/json' })
		
		end
	end
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp and tmp.wallet and tmp.bank then
		vRP.execute("vRP/set_money",{ user_id = user_id, wallet = tmp.wallet, bank = tmp.bank })
		local identity = vRP.getUserIdentity(user_id)
		local data = os.date("**%d-%m-%Y** ás **%X**")
    	local content1 = "```[ID "..user_id.."]"..identity.name.." "..identity.firstname.." deslogou da cidade ás ("..data..") com R$"..tmp.wallet.." na mão e R$"..tmp.bank.." no banco.```"
    	PerformHttpRequest(webhooklink1, function(err, text, headers) end, 'POST', json.encode({username = "Administrador", content = content1}), { ['Content-Type'] = 'application/json' })
		
	end
end)

AddEventHandler("vRP:save",function()
	for k,v in pairs(vRP.user_tmp_tables) do
		if v.wallet and v.bank then
			vRP.execute("vRP/set_money",{ user_id = k, wallet = v.wallet, bank = v.bank })
		end
	end
end)