local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_caminhao",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local gas = 1
local cars = 1
local show = 1
local woods = 1
local diesel = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local paylist = {
	["diesel"] = {
		[1] = { pay = math.random(800,1400) },
		[2] = { pay = math.random(800,1400) },
		[3] = { pay = math.random(800,1400) },
		[4] = { pay = math.random(800,1400) },
		[5] = { pay = math.random(800,1400) },
		[6] = { pay = math.random(800,1400) }
	},
	["gas"] = {
		[1] = { pay = math.random(1000,1500) },
		[2] = { pay = math.random(1000,1500) },
		[3] = { pay = math.random(1000,1500) },
		[4] = { pay = math.random(1000,1500) },
		[5] = { pay = math.random(1000,1500) },
		[6] = { pay = math.random(1000,1500) },
		[7] = { pay = math.random(1000,1500) },
		[8] = { pay = math.random(1000,1500) },
		[9] = { pay = math.random(1000,1500) },
		[10] = { pay = math.random(1000,1500) },
		[11] = { pay = math.random(1000,1500) },
		[12] = { pay = math.random(1000,1500) }
	},
	["cars"] = {
		[1] = { pay = math.random(700,1200) },
		[2] = { pay = math.random(700,1200) },
		[3] = { pay = math.random(700,1200) },
		[4] = { pay = math.random(700,1200) },
		[5] = { pay = math.random(700,1200) }
	},
	["woods"] = {
		[1] = { pay = math.random(900,1400) },
		[2] = { pay = math.random(900,1400) },
		[3] = { pay = math.random(900,1400) },
		[4] = { pay = math.random(900,1400) }
	},
	["show"] = {
		[1] = { pay = math.random(400,700) },
		[2] = { pay = math.random(400,700) },
		[3] = { pay = math.random(400,700) },
		[4] = { pay = math.random(400,700) }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment(id,mod,health)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveMoney(user_id,parseInt(paylist[mod][id].pay+health))
		if mod == "cars" then
			local value = vRP.getSData("meta:concessionaria")
			local metas = json.decode(value) or 0
			if metas then
				vRP.setSData("meta:concessionaria",json.encode(parseInt(metas+1)))
			end
		end
		if vRP.tryGetInventoryItem(user_id,"rebite",1) then
			vRP.giveInventoryItem(user_id,"dinheirosujo",math.random(500,800))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300000)
		diesel = math.random(#paylist["diesel"])
		gas = math.random(#paylist["gas"])
		cars = math.random(#paylist["cars"])
		woods = math.random(#paylist["woods"])
		show = math.random(#paylist["show"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETTRUCKPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.getTruckpoint(point)
	if point == "diesel" then
		return parseInt(diesel)
	elseif point == "gas" then
		return parseInt(gas)
	elseif point == "cars" then
		return parseInt(cars)
	elseif point == "woods" then
		return parseInt(woods)
	elseif point == "show" then
		return parseInt(show)
	end
end