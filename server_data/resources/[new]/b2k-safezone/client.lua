-- DEFAULT
vRP = Proxy.getInterface("vRP")
SFzone = {}
Tunnel.bindInterface("b2k-safezone", SFzone)

SFServer = Tunnel.getInterface("b2k-safezone","b2k-safezone")

local fields = {
	{ name = "Praça", edges = {
			{ name = "1_1", x = 122.34084320068, y = -996.44873046875, z = 25.509115982056 },
			{ name = "1_2", x = 211.42227172852, y = -1026.5551757813, z = 25.504406738281 },
			{ name = "1_3", x = 267.73532104492, y = -871.75488281250, z = 25.501609420776 },
			{ name = "1_4", x = 178.92828369141, y = -839.59161376953, z = 27.401609420776 },
		}
	},
	{ name = "Hospital", edges = {
			{ name = "2_1", x = 265.38085937500, y = -612.80438232422, z = 39.385719299316 },
			{ name = "2_2", x = 356.81430053711, y = -620.72680664063, z = 38.675811767578 },
			{ name = "2_3", x = 370.19018554688, y = -573.62054443359, z = 38.675334930420 },
			{ name = "2_4", x = 289.18304443359, y = -553.53271484375, z = 40.127277374268 },
		}
	}
}

--[[ Halloween Event
local isHalloweenEvent = false
RegisterNetEvent("b2k:halloween")
AddEventHandler("b2k:halloween", function(cond)
    local status = false
    if cond == 1 then status = true end

    isHalloweenEvent = status
end)]]

--[[
    FIELD DETECTION
]]
-- Checks if point is within a triange. https://stackoverflow.com/questions/2049582/how-to-determine-if-a-point-is-in-a-2d-triangle
function isPointInTriangle(p, p0, p1, p2)
    local A = 1/2 * (-p1.y * p2.x + p0.y * (-p1.x + p2.x) + p0.x * (p1.y - p2.y) + p1.x * p2.y)
    local sign = 1
    if A < 0 then sign = -1 end
    local s = (p0.y * p2.x - p0.x * p2.y + (p2.y - p0.y) * p.x + (p0.x - p2.x) * p.y) * sign
    local t = (p0.x * p1.y - p0.y * p1.x + (p0.y - p1.y) * p.x + (p1.x - p0.x) * p.y) * sign
    
    return s > 0 and t > 0 and (s + t) < 2 * A * sign
end

function runOnFieldTriangles(field, cb)
    local edges = field.edges
    local num = #edges - 2
    local c = 1
    repeat 
        cb(edges[1], edges[c+1], edges[c+2])
        c = c + 1
    until c > num
end

-- Checks if a point is within a Field structure
function isPointInField(p, field)
    local edges = field.edges
    local within = false
    runOnFieldTriangles(field, function(p0,p1,p2)
        if isPointInTriangle(p, p0, p1, p2) then within = true end
    end)
    return within
end

function GetAreaOfField(field)
    local edges = field.edges
    return math.floor(getAreaOfTriangle(edges[1], edges[2], edges[3]) + getAreaOfTriangle(edges[1], edges[4], edges[3]))
end

function getAreaOfTriangle(p0, p1, p2)
    local b = GetDistanceBetweenCoords(p0.x, p0.y, 0, p1.x, p1.y, 0)
    local h = GetDistanceBetweenCoords(p2.x, p2.y, 0, p1.x, p1.y, 0)
    return (b * h) / 2
end

function debugDrawFieldMarkers(field, r, g, b, a)
    local v = field
    runOnFieldTriangles(v, function(p0,p1,p2) 
        DrawLine(p0.x, p0.y, p0.z + 3.0,
                 p1.x, p1.y, p1.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
        DrawLine(p2.x, p2.y, p2.z + 3.0,
                 p1.x, p1.y, p1.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
        DrawLine(p2.x, p2.y, p2.z + 3.0,
                 p0.x, p0.y, p0.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
    end)
end

function drawText(text)
    if text == "" then return end
    Citizen.InvokeNative(0xB87A37EEB7FAA67D,"STRING")
    AddTextComponentString(text .. "~n~~n~~n~")
    Citizen.InvokeNative(0x9D77056A530643F6, 200, true)
end

local isInSafezone = false

-- Main Thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ply = PlayerPedId()
		local pos = GetEntityCoords(ply)
		if IsPedInAnyVehicle(ply) then pos = GetEntityCoords(GetVehiclePedIsIn(ply, false)) end

        --if not isHalloweenEvent then
    		for k,v in next, fields do
    			if GetDistanceBetweenCoords(v.edges[1].x, v.edges[1].y,0,pos.x,pos.y,0) <= 500.0 then
    				if isPointInField(pos, v) then
    					isInSafezone = true
                        --debugDrawFieldMarkers(v,0,255)
                        TriggerClientEvent("Notify","sucesso","Você está em uma Safezone!")
    					drawText("~w~Você está em uma ~g~Safezone~w~!")
                        ClearPlayerWantedLevel(PlayerId())
                        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
                        --NetworkSetFriendlyFireOption(false)
                        DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
                        DisableControlAction(1, 45, true) -- disable reload
                        DisableControlAction(2, 80, true) -- disable reload
                        DisableControlAction(2, 140, true) -- disable reload
                        DisableControlAction(2, 250, true) -- disable reload
                        DisableControlAction(2, 263, true) -- disable reload
                        DisableControlAction(2, 310, true) -- disable reload
                        DisableControlAction(1, 140, true)
                        DisableControlAction(1, 141, true)
                        DisableControlAction(1, 142, true)
                        DisableControlAction(1, 143, true)
                        DisableControlAction(0, 24, true) -- disable attack
                        DisableControlAction(0, 25, true) -- disable aim
                        DisableControlAction(0, 47, true) -- disable weapon
                        DisableControlAction(0, 58, true) -- disable weapon

                        DisablePlayerFiring(PlayerPedId(), true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
                        DisableControlAction(0, 106, true) -- Disable in-game mouse controls
    				else
    					isInSafezone = false
                        --NetworkSetFriendlyFireOption(true)
    					--debugDrawFieldMarkers(v)
    				end
    			end
    		end
        --end
    end
end)