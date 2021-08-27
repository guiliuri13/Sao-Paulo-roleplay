-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA É 100% GRATUITO E OPEN SOURCE, SUA VENDA É PROIBIDA ] --
-- [ VISITE NOSSA LOJA E SAIBA MAIS SOBRE NOSSO TRABALHO - discord.gg/bABGBEX ] --
-- [ VISITE NOSSO GITHUB PARA TER ACESSO A MAIS SCRIPTS GRATUITOS COMO ESSE AQUI ] --
-- [ PARA CONSEGUIR AJUDA COM ESSE OU OUTRO DE NOSSOS SISTEMAS GRATUITOS, ACESSE NOSSO DISCORD ] --

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vCLIENT = Tunnel.getInterface("bdl_newcloak")

vRPex = {}
Tunnel.bindInterface("bdl_newcloak",vRPex)

local default = {
    [3] = {15,0,0},
    [4] = {6,1,0},
    [5] = {0,0,0},
    [6] = {24,0,0},
    [7] = {1,0,0},
    [8] = {31,0,0},
    [9] = {4,4,0},
    [10] = {0,0,0},
    [11] = {85,0,0},
    ["p0"] = {10,0,0},
    ["p6"] = {-1,0},
},


local default2 = {
    [3] = {0,0,0},
    [4] = {25,1,0},
    [5] = {0,0,0},
    [6] = {51,0,0},
    [7] = {1,0,0},
    [8] = {129,0,0},
    [9] = {11,0,2},
    [10] = {0,0,0},
    [11] = {93,0,0},
    ["p0"] = {114,0,0},
    ["p6"] = {-1,0},
},


local k9trainor = {
    [3] = {0,0,0},
    [4] = {25,1,0},
    [5] = {0,0,0},
    [6] = {24,0,0},
    [7] = {1,0,0},
    [8] = {54,0,0},
    [9] = {11,0,2},
    [10] = {0,0,0},
    [11] = {93,0,0},
    ["p0"] = {10,0,0},
    ["p6"] = {-1,0},
},


local tactical = {
    [3] = {15,0,0},
    [4] = {6,1,0},
    [5] = {0,0,0},
    [6] = {24,0,0},
    [7] = {1,0,0},
    [8] = {9,0,0},
    [9] = {-1,0,0},
    [10] = {0,0,0},
    [11] = {85,0,0},
    ["p0"] = {28,0,0},
    ["p6"] = {-1,0},
},
    

local gtm = {
    [3] = {0,0,0},
    [4] = {31,2,0},
    [5] = {0,0,0},
    [6] = {24,0,0},
    [7] = {1,0,0},
    [8] = {16,0,0},
    [10] = {0,0,0},
    [11] = {93,0,0},
    ["p0"] = {28,2,0},
    ["p6"] = {-1,0},
},

local transit = {
    [1885233650] = {
        [1] = { 121,0 },
        [5] = { -1,0 },
        [7] = { 0,0 },
        [3] = { 14,0 },
        [4] = { 25,0 },
        [8] = { 15,0 },
        [6] = { 25,0 },
        [11] = { 31,0 },
        [9] = { 10,0 },
        [10] = { -1,0 },
        ["p0"] = { 9,2 },
        ["p1"] = { -1,0 },
        ["p2"] = { -1,0 },
        ["p6"] = { -1,0 },
        ["p7"] = { -1,0 }
    },
	[-1667301416] = {
        [1] = { 121,0 },
        [5] = { -1,0 },
        [7] = { 8,0 },
        [3] = { 14,0 },
        [4] = { 105,1 },
        [8] = { 3,0 },
        [6] = { 25,0 },
        [9] = { 19,0 },
        [10] = { 16,0 },
        [11] = { 265,0 },
        ["p0"] = { -1,0 },
        ["p1"] = { -1,1 },
        ["p2"] = { -1,0 },
        ["p6"] = { -1,0 },
        ["p7"] = { -1,0 }
    }
}

local csi = {
    [1885233650] = {
        [1] = { 121,0 },
        [2] = { 4,0 },
        [3] = { 0,0 },
        [4] = { 25,2 },
        [5] = { -1,0 },
        [6] = { 25,0 },
        [7] = { 8,0 },			
        [8] = { 57,0 },
        [9] = { 29,0 },
        [10] = { -1,0 },
        [11] = { 38,4 },
		["p0"] = { -1,0 },		
        ["p1"] = { -1,0 },
        ["p2"] = { -1,0 },
        ["p6"] = { -1,0 },
        ["p7"] = { -1,0 }
    },
    [-1667301416] = {
        [1] = { 121,0 },
        [5] = { -1,0 },
        [7] = { 8,0 },
        [3] = { 14,0 },
        [4] = { 105,1 },
        [8] = { 6,0 },
        [6] = { 25,0 },
        [11] = { 266,0 },
        [9] = { 0,0 },
        [10] = { -1,0 },
        ["p0"] = { -1,0 },
        ["p1"] = { -1,1 },
        ["p2"] = { -1,0 },
        ["p6"] = { -1,0 },
        ["p7"] = { -1,0 }
    }
}

RegisterServerEvent("default")
AddEventHandler("default",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = default
    if custom then
		TriggerClientEvent("progress",source,15000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(15000,function()
			
			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
		end)
    end
end)

RegisterServerEvent("default2")
AddEventHandler("default2",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = default2
    if custom then
		TriggerClientEvent("progress",source,20000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(20000,function()
			TriggerClientEvent('cancelando',source,false)
			vRPclient._stopAnim(source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
		end)
    end
end)

RegisterServerEvent("k9trainor")
AddEventHandler("k9trainor",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = k9trainor
    if custom then
		TriggerClientEvent("progress",source,6000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(6000,function()
			TriggerClientEvent('cancelando',source,false)
			vRPclient._stopAnim(source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
		end)
    end
end)

RegisterServerEvent("tactical")
AddEventHandler("tactical",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = tactical
    if custom then
		TriggerClientEvent("progress",source,35000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(35000,function()
			TriggerClientEvent('cancelando',source,false)
			vRPclient._stopAnim(source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
		end)
    end
end)

RegisterServerEvent("gtm")
AddEventHandler("gtm",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gtm
    if custom then
		TriggerClientEvent("progress",source,25000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(25000,function()
			TriggerClientEvent('cancelando',source,false)
			vRPclient._stopAnim(source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
		end)
    end
end)

RegisterServerEvent("csi")
AddEventHandler("csi",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = csi
    if custom then
		TriggerClientEvent("progress",source,8000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(8000,function()
			TriggerClientEvent('cancelando',source,false)
			vRPclient._stopAnim(source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
		end)
    end
end)

RegisterServerEvent("transit")
AddEventHandler("transit",function()
    local user_id = vRP.getUserId(source)
    local custom = transit
    if custom then
        local old_custom = vRPclient.getCustomization(source)
        local idle_copy = {}

        idle_copy = vRP.save_idle_custom(source,old_custom)
        idle_copy.modelhash = nil

        for k,v in pairs(custom[old_custom.modelhash]) do
            idle_copy[k] = v
        end
        vRPclient._setCustomization(source,idle_copy)
    end
end)

RegisterServerEvent("off-uniform")
AddEventHandler("off-uniform",function()
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,2000,"vestindo")
	vCLIENT.closeMenu(source)
	TriggerClientEvent('cancelando',source,true)
	vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
	SetTimeout(2000,function()
		TriggerClientEvent('cancelando',source,false)
		vRPclient._stopAnim(source,false)
		vRP.removeCloak(source)
	end)
end)

function vRPex.checkOfficer()
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
        return true
	end
end

-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --