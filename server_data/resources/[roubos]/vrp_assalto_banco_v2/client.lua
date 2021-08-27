
--===============================================================--
--========================== NÃO MEXER ==========================--
--===============================================================--

PoliceDoors = {}
HEIST = {
    doorchecks = {
        {x = 257.10, y = 220.30, z = 106.28, he = 339.733, h = GetHashKey("hei_v_ilev_bk_gate_pris"), h1 = "hei_v_ilev_bk_gate_pris", h2 = "hei_v_ilev_bk_gate_molten", status = 0},
        {x = 236.91, y = 227.50, z = 106.29, he = 340.000, h = GetHashKey("v_ilev_bk_door"), status = 0},
        {x = 262.35, y = 223.00, z = 107.05, he = 249.731, h = GetHashKey("hei_v_ilev_bk_gate2_pris"), status = 0},
        {x = 252.72, y = 220.95, z = 101.68, he = 160.278, h = GetHashKey("hei_v_ilev_bk_safegate_pris"), h1 = "hei_v_ilev_bk_safegate_pris", h2 = "hei_v_ilev_bk_safegate_molten", status = 0},
        {x = 261.01, y = 215.01, z = 101.68, he = 250.082, h = GetHashKey("hei_v_ilev_bk_safegate_pris"), h1 = "hei_v_ilev_bk_safegate_pris", h2 = "hei_v_ilev_bk_safegate_molten", status = 0},
        {x = 253.92, y = 224.56, z = 101.88, he = 160.000, h = GetHashKey("v_ilev_bk_vaultdoor"), status = 0,}
    },
    enablesupersilent = false,
    enablextras = true,
    disableinput = false,
    hackfinish = false,
    initiator = false,
    stage0break = false,
    stage1break = false,
    stage2break = false,
    stage4break = false,
    stagelootbreak = false,
    startloot = false,
    grabber= false,
    info = {},
    loudstart = {x = 257.10, y = 220.30, z = 106.28, type = "hei_v_ilev_bk_gate_pris", h = 339.733},
    silentstart = {x = 236.91, y = 227.50, z = 106.29, type = "v_ilev_bk_door", h = 340.00},
    inside1 = {x = 252.72, y = 220.95, z = 101.68, type = "hei_v_ilev_bk_safegate_pris", h = 160.278},
    inside2 = {x = 261.01, y = 215.01, z = 101.68, h = 250.082},
    card1 = {x = 262.35, y = 223.00, z = 107.05},
    card2 = {x = 252.80, y = 228.55, z = 102.50},
    hack1 = {x = 262.35, y = 223.00, z = 107.05, type = "hei_v_ilev_bk_gate2_pris", h = 249.731},
    hack2 = {x = 252.80, y = 228.55, z = 102.50},
    vault = {x = 253.92, y = 224.56, z = 101.88, type = "v_ilev_bk_vaultdoor"},
    thermal1 = {x = 252.82, y = 221.07, z = 101.60},
    thermal2 = {x = 261.22, y = 215.43, z = 101.68},
    lockpick1 = {x = 252.82, y = 221.07, z = 101.60},
    lockpick2 = {x = 261.22, y = 215.43, z = 101.68},
    cash1 = {x = 257.40, y = 215.15, z = 101.68},
    cash2 = {x = 262.32, y = 213.31, z = 101.68},
    cash3 = {x = 263.54, y = 216.23, z = 101.68},
    gold = {x = 266.36, y = 215.31, z = 101.68},
    dia = {x = 265.11, y = 212.05, z = 101.68},
    cur = 7,
    starttimer = false,
    vaulttime = 0,
    searchlocations = {
        {coords = {x = 233.40, y = 221.53, z = 110.40}, status = false},
        {coords = {x = 240.93, y = 211.12, z = 110.40}, status = false},
        {coords = {x = 246.54, y = 208.86, z = 110.40}, status = false},
        {coords = {x = 264.33, y = 212.16, z = 110.40}, status = false},
        {coords = {x = 252.87, y = 222.36, z = 106.35}, status = false},
        {coords = {x = 249.71, y = 227.84, z = 106.35}, status = false},
        {coords = {x = 244.80, y = 229.70, z = 106.35}, status = false}
    },
    obj = {
        {x = 257.40, y = 215.15, z = 100.68, h = 269934519},
        {x = 262.32, y = 213.31, z = 100.68, h = 269934519},
        {x = 263.54, y = 216.23, z = 100.68, h = 269934519},
        {x = 266.36, y = 215.31, z = 100.68, h = 2007413986},
        {x = 265.11, y = 212.05, z = 100.68, h = 881130828}
    },
    emptyobjs = {
        {x = 257.40, y = 215.15, z = 100.68, h = 769923921},
        {x = 262.32, y = 213.31, z = 100.68, h = 769923921},
        {x = 263.54, y = 216.23, z = 100.68, h = 769923921},
        {x = 266.36, y = 215.31, z = 100.68, h = 2714348429},
        {x = 265.11, y = 212.05, z = 100.68, h = 2714348429}
    },
    checks = {
        hack1 = false,
        hack2 = false,
        thermal1 = false,
        thermal2 = false,
        id1 = false,
        id2 = false,
        idfound = false,
        grab1 = false,
        grab2 = false,
        grab3 = false,
        grab4 = false,
        grab5 = false
    },
    alarmblip
}
HEIST.searchinfo = {
    random = math.random(1, HEIST.cur),
    found = false
}
local GrabBag = nil
local PlaySound = false
local program = 0
local scaleform = nil
local lives = 5
local ClickReturn
local SorF = false
local Hacking = false
local Ipfinished = false
local UsingComputer = false
local text
local RouletteWords = {
    "ABSOLUTE",
    "ISTANBUL",
    "SUPERHOT",
    "DOCTRINE",
    "IMPERIUS",
    "DELIRIUM",
    "MAETHRIL"
}
local output = nil

function HEIST:GetInfo()
	TriggerServerEvent('lixeiroHeist:GetData')
end
RegisterNetEvent('lixeiroHeist:GetData')
AddEventHandler('lixeiroHeist:GetData', function(ret)
    HEIST.info = ret
    HEIST:HandleInfo()
end)

RegisterNetEvent('lixeiroHeist:GetDoors')
AddEventHandler('lixeiroHeist:GetDoors', function(ret)
    output = ret
end)

RegisterNetEvent('lixeiroHeist:startevent')
AddEventHandler('lixeiroHeist:startevent', function(ret)
    output = ret
end)

RegisterNetEvent('lixeiroHeist:checkItem')
AddEventHandler('lixeiroHeist:checkItem', function(ret)
    output = ret
end)

RegisterNetEvent('lixeiroHeist:gettotalcash')
AddEventHandler('lixeiroHeist:gettotalcash', function(ret)
    output = ret
end)

function HEIST:HandleInfo()
	if self.info.stage == 0 then
		Citizen.CreateThread(function()
			while true do
				local coords = GetEntityCoords(PlayerPedId())

					local dst = GetDistanceBetweenCoords(coords, self.loudstart.x, self.loudstart.y, self.loudstart.z, true)

					if dst <= 6 then
						DrawText3D(self.loudstart.x, self.loudstart.y, self.loudstart.z, Config.text.loudstart, 0.40)
						if dst <= 1 and IsControlJustReleased(0,38) then
							output = nil
							TriggerServerEvent('lixeiroHeist:startevent', 1)
							while output == nil do 
								Wait(0)
							end
							if output == true then
								HEIST.initiator = true
								self.info.stage = 1
								self.info.style = 1
								self.currentplant = 0
								self:Plant()
							elseif output ~= true then
								notify(output)
							end
						end
					end
					local dst2 = GetDistanceBetweenCoords(coords, self.silentstart.x, self.silentstart.y, self.silentstart.z, true)

					if dst2 <= 6 then
						DrawText3D(self.silentstart.x, self.silentstart.y, self.silentstart.z, Config.text.silentstart, 0.40)
						if dst2 <= 1 and  IsControlJustReleased(0,38) then
							output = nil
							TriggerServerEvent('lixeiroHeist:startevent', 2)
							while output == nil do 
								Wait(0)
							end
							if output == true then
								HEIST.initiator = true
								self.info.stage = 1
								self.info.style = 2
								self.currentpick = 0
								self:Lockpick()
							elseif output ~= true then
								notify(output)
							end
						end
					end
				if HEIST.stage0break then
					HEIST.stage0break = false
					break
				end
				Citizen.Wait(1)
			end
		end)
	elseif self.info.stage == 1 then
		if HEIST.initiator then
			if self.info.style == 1 then
				Citizen.CreateThread(function()
					while true do
						local coords = GetEntityCoords(PlayerPedId())

						if not HEIST.checks.hack1 then
							local dst = GetDistanceBetweenCoords(coords, self.hack1.x, self.hack1.y, self.hack1.z, true)

							if dst <= 4 then
								DrawText3D(self.hack1.x, self.hack1.y, self.hack1.z, Config.text.usehack, 0.40)
								if dst <= 1 and IsControlJustReleased(0, 38) then
									output = nil
									TriggerServerEvent('lixeiroHeist:checkItem', Config.items.laptop)
									while output == nil do 
										Wait(0)
									end
									if output then
										HEIST.checks.hack1 = true
										self.currenthack = 0
										self:Hack()
									elseif not output then
										notify(Config.text.nolaptop)
									end
								end
							end
						end
						if HEIST.checks.hack1 and not HEIST.checks.hack2 then
							local dst = GetDistanceBetweenCoords(coords, self.hack2.x, self.hack2.y, self.hack2.z, true)

							if dst <= 4 then
								DrawText3D(self.hack2.x, self.hack2.y, self.hack2.z, Config.text.usehack, 0.40)
								if dst <= 1 and IsControlJustReleased(0, 38) then
									output = nil
									TriggerServerEvent('lixeiroHeist:checkItem', Config.items.laptop)
									while output == nil do 
										Wait(0)
									end
									if output then
										HEIST.checks.hack2 = true
										self.info.stage = 2
										self.currenthack = 1
										self:Hack()
									elseif not output then
										notify(Config.text.nolaptop)
									end
								end
							end
						end
						if HEIST.stage1break then
							HEIST.stage1break = false
							break
						end
						Citizen.Wait(1)
					end
				end)
			elseif self.info.style == 2 then
				Citizen.CreateThread(function()
					while true do
						local coords = GetEntityCoords(PlayerPedId())

						if not HEIST.checks.id1 then
							local dst = GetDistanceBetweenCoords(coords, self.card1.x, self.card1.y, self.card1.z, true)

							if dst <= 4 then
								DrawText3D(self.card1.x, self.card1.y, self.card1.z, Config.text.usecard, 0.40)
								if dst <= 1 and IsControlJustReleased(0, 38) then
									output = nil
									TriggerServerEvent('lixeiroHeist:checkItem', Config.items.id_card)
									while output == nil do 
										Wait(0)
									end
									if output then
										HEIST.checks.id1 = true
										self.currentid = 1
										self:IdCard()
									elseif not output then
										notify(Config.text.noidcard)
									end
								end
							end
						end
						if not HEIST.searchinfo.found then
							for i = 1, #HEIST.searchlocations, 1 do
								if not HEIST.searchlocations[i].status then
									if GetDistanceBetweenCoords(coords, HEIST.searchlocations[i].coords.x, HEIST.searchlocations[i].coords.y, HEIST.searchlocations[i].coords.z, true) <= 2.2 then
										DrawText3D(HEIST.searchlocations[i].coords.x, HEIST.searchlocations[i].coords.y, HEIST.searchlocations[i].coords.z, Config.text.usesearch, 0.40)
										if IsControlJustReleased(0, 38) then
											Search(HEIST.searchlocations[i])
											Citizen.Wait(1000)
										end
									end
								end
							end
						end
						if HEIST.checks.id1 and not HEIST.checks.id2 then
							local dst = GetDistanceBetweenCoords(coords, self.card2.x, self.card2.y, self.card2.z, true)

							if dst <= 4 then
								DrawText3D(self.card2.x, self.card2.y, self.card2.z, Config.text.usecard, 0.40)
								if dst <= 1 and IsControlJustReleased(0, 38) then
									output = nil
									TriggerServerEvent('lixeiroHeist:checkItem', Config.items.id_card)
									while output == nil do 
										Wait(0)
									end
									if output then
										HEIST.checks.id2 = true
										self.currentid = 2
										self:IdCard()
									elseif not output then
										notify(Config.text.noidcard)
									end
								end
							end
						end
						if HEIST.stage1break then
							HEIST.stage1break = false
							break
						end
						Citizen.Wait(1)
					end
				end)
			end
		end
	elseif self.info.stage == 2 then
		if HEIST.initiator then
			if self.info.style == 1 then
				Citizen.CreateThread(function()
					while true do
						local coords = GetEntityCoords(PlayerPedId())

						if not HEIST.checks.thermal1 then
							local dst = GetDistanceBetweenCoords(coords, self.thermal1.x, self.thermal1.y, self.thermal1.z, true)

							if dst <= 4 then
								DrawText3D(self.thermal1.x, self.thermal1.y, self.thermal1.z, Config.text.usethermal, 0.40)
								if dst <= 1 and IsControlJustReleased(0, 38) then
									output = nil
									TriggerServerEvent('lixeiroHeist:checkItem', Config.items.thermal)
									while output == nil do 
										Wait(0)
									end
									if output then
										HEIST.checks.thermal1 = true
										self.currentplant = 1
										self:Plant()
									elseif not output then
										notify(Config.text.nothermal)
									end
								end
							end
						end
						if HEIST.checks.thermal1 and not HEIST.checks.thermal2 then
							local dst = GetDistanceBetweenCoords(coords, self.thermal2.x, self.thermal2.y, self.thermal2.z, true)

							if dst <= 4 then
								DrawText3D(self.thermal2.x, self.thermal2.y, self.thermal2.z, Config.text.usethermal, 0.40)
								if dst <= 1 and IsControlJustReleased(0, 38) then
									output = nil
									TriggerServerEvent('lixeiroHeist:checkItem', Config.items.thermal)
									while output == nil do 
										Wait(0)
									end
									if output then
										HEIST.checks.thermal2 = true
										self.currentplant = 2
										self:Plant()
									elseif not output then
										notify(Config.text.nothermal)
									end
								end
							end
						end
						if HEIST.stage2break then
							HEIST.stage2break = false
							break
						end
						Citizen.Wait(1)
					end
				end)
			elseif self.info.style == 2 then
				if HEIST.initiator then
					Citizen.CreateThread(function()
						while true do
							local coords = GetEntityCoords(PlayerPedId())

							if not HEIST.checks.lockpick1 then
								local dst = GetDistanceBetweenCoords(coords, self.lockpick1.x, self.lockpick1.y, self.lockpick1.z, true)

								if dst <= 4 then
									DrawText3D(self.lockpick1.x, self.lockpick1.y, self.lockpick1.z, Config.text.uselockpick, 0.40)
									if dst <= 1 and IsControlJustReleased(0, 38) then
										output = nil
										TriggerServerEvent('lixeiroHeist:checkItem', Config.items.lockpick)
										while output == nil do 
											Wait(0)
										end
										if output then
											HEIST.checks.lockpick1 = true
											self.currentpick = 1
											self:Lockpick()
										elseif not output then
											notify(Config.text.nolockpick)
										end
									end
								end
							end
							if not HEIST.checks.lockpick2 then
								local dst = GetDistanceBetweenCoords(coords, self.lockpick2.x, self.lockpick2.y, self.lockpick2.z, true)

								if dst <= 4 then
									DrawText3D(self.lockpick2.x, self.lockpick2.y, self.lockpick2.z, Config.text.uselockpick, 0.40)
									if dst <= 1 and IsControlJustReleased(0, 38) then
										output = nil
										TriggerServerEvent('lixeiroHeist:checkItem', Config.items.lockpick)
										while output == nil do 
											Wait(0)
										end
										if output then
											HEIST.checks.lockpick2 = true
											self.currentpick = 2
											self:Lockpick()
										elseif not output then
											notify(Config.text.nolockpick)
										end
									end
								end
							end
							if HEIST.stage2break then
								HEIST.stage2break = false
								break
							end
							Citizen.Wait(1)
						end
					end)
				end
			end
		end
	end
end
function HEIST:Plant()
    HEIST.disableinput = true
    local loc = {x,y,z,h}
    local ptfx
    local method
    local rotplus = 0
    local oldmodel
    local newmodel

    if self.currentplant == 0 then
        HEIST.stage0break = true
        loc.x = 257.40
        loc.y = 220.20
        loc.z = 106.35
        loc.h = 336.48
        ptfx = vector3(257.39, 221.20, 106.29)
        oldmodel = "hei_v_ilev_bk_gate_pris"
        newmodel = "hei_v_ilev_bk_gate_molten"
        method = 1
    elseif self.currentplant == 1 then
        loc.x = 252.95
        loc.y = 220.70
        loc.z = 101.76
        loc.h = 160
        ptfx = vector3(252.985, 221.70, 101.72)
        oldmodel = "hei_v_ilev_bk_safegate_pris"
        newmodel = "hei_v_ilev_bk_safegate_molten"
        rotplus = 170.0
        method = 2
    elseif self.currentplant == 2 then
        loc.x = 261.65
        loc.y = 215.60
        loc.z = 101.76
        loc.h = 252
        ptfx = vector3(261.68, 216.63, 101.75)
        oldmodel = "hei_v_ilev_bk_safegate_pris"
        newmodel = "hei_v_ilev_bk_safegate_molten"
        rotplus = 270.0
        method = 3
    end
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, loc.h)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(loc.x, loc.y, loc.z, rotx, roty, rotz + rotplus, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), loc.x, loc.y, loc.z,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    exports['progressBars']:startUI(4500, Config.text.thermal)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.2,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(4000)
    exports['progressBars']:startUI(12000, Config.text.burning)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("lixeiroHeist:ptfx", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    HEIST.disableinput = false
    if self.currentplant == 0 then
        TriggerServerEvent("lixeiroHeist:fixdoor", self.doorchecks[1].h, vector3(self.doorchecks[1].x, self.doorchecks[1].y, self.doorchecks[1].z), self.doorchecks[1].he)
    elseif self.currentplant == 1 then
        TriggerServerEvent("lixeiroHeist:fixdoor", self.doorchecks[4].h, vector3(self.doorchecks[4].x, self.doorchecks[4].y, self.doorchecks[4].z), self.doorchecks[4].he)
    elseif self.currentplant == 2 then
        TriggerServerEvent("lixeiroHeist:fixdoor", self.doorchecks[5].h, vector3(self.doorchecks[5].x, self.doorchecks[5].y, self.doorchecks[5].z), self.doorchecks[5].he)
    end
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(2000)
    ClearPedTasks(ped)
    Citizen.Wait(2000)
    if self.currentplant == 0 then
        TriggerServerEvent("lixeiroHeist:alarm_s", 1)
    end
    DeleteObject(bomba)
    TriggerServerEvent("lixeiroHeist:moltgate", loc.x, loc.y, loc.z, oldmodel, newmodel)
    Citizen.Wait(9000)
    notify(Config.text.melted)
    StopParticleFxLooped(effect, 0)
    if self.currentplant == 0 then
        --TriggerServerEvent("lixeiroHeist:toggleDoor", newmodel, vector3(self.loudstart.x, self.loudstart.y, self.loudstart.z), false)
        TriggerServerEvent("lixeiroHeist:policeDoor", 1, false)
        self:HandleInfo()
    elseif self.currentplant == 1 then
        --TriggerServerEvent("lixeiroHeist:toggleDoor", newmodel, vector3(self.inside1.x, self.inside1.y, self.inside1.z), false)
        TriggerServerEvent("lixeiroHeist:policeDoor", 4, false)
    elseif self.currentplant == 2 then
        --TriggerServerEvent("lixeiroHeist:toggleDoor", newmodel, vector3(self.inside2.x, self.inside2.y, self.inside2.z), false)
        TriggerServerEvent("lixeiroHeist:policeDoor", 5, false)
    end
end
function HEIST:Lockpick()
    HEIST.disableinput = true
    local loc = {x, y, z, h}
    if self.currentpick == 0 then
        loc.x = 236.22
        loc.y = 227.50
        loc.z = 105.00
        loc.h = 336.56
    elseif self.currentpick == 1 then
        loc.x = 253.28
        loc.y = 221.25
        loc.z = 100.50
        loc.h = 155.11
    elseif self.currentpick == 2 then
        loc.x = 260.91
        loc.y = 215.93
        loc.z = 100.50
        loc.h = 248.54
    end
    local ped = PlayerPedId()
    local animDict = "mp_arresting"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        RequestAnimDict(animDict)
        Citizen.Wait(10)
    end
    SetEntityCoords(ped, loc.x, loc.y, loc.z, 1, 0, 0, 1)
    SetEntityHeading(ped, loc.h)
    TaskPlayAnim(ped, animDict, "a_uncuff", 8.0, 8.0, 6000, 1, 1, 0, 0, 0)
    exports['progressBars']:startUI(6000, Config.text.lockpick..": "..Config.text.stage.." 1")
    Citizen.Wait(6500)
    notify(Config.text.stage.." 1 "..Config.text.stage_complete)
    SetEntityCoords(ped, loc.x, loc.y, loc.z, 1, 0, 0, 1)
    SetEntityHeading(ped, loc.h)
    TaskPlayAnim(ped, animDict, "a_uncuff", 8.0, 8.0, 6000, 1, 1, 0, 0, 0)
    exports['progressBars']:startUI(6000, Config.text.lockpick..": "..Config.text.stage.." 2")
    Citizen.Wait(6500)
    notify(Config.text.stage.." 2 "..Config.text.stage_complete)
    notify(Config.text.unlocked)
    HEIST.disableinput = false
    if self.currentpick == 0 then
        HEIST.stage0break = true
        --TriggerServerEvent("lixeiroHeist:toggleDoor", self.silentstart.type, vector3(self.silentstart.x, self.silentstart.y, self.silentstart.z), false, self.silentstart.h)
        TriggerServerEvent("lixeiroHeist:policeDoor", 2, false)
        self:HandleInfo()
    elseif self.currentpick == 1 then
        --TriggerServerEvent("lixeiroHeist:toggleDoor", self.inside1.type, vector3(self.inside1.x, self.inside1.y, self.inside1.z), false, self.inside1.h)
        TriggerServerEvent("lixeiroHeist:policeDoor", 4, false)
    elseif self.currentpick == 2 then
        --TriggerServerEvent("lixeiroHeist:toggleDoor", self.inside1.type, vector3(self.inside2.x, self.inside2.y, self.inside2.z), false, self.inside2.h)
        TriggerServerEvent("lixeiroHeist:policeDoor", 5, false)
    end
end
function HEIST:Hack()
    HEIST.hackfinish = false
    local loc = {x,y,z,h}

    if self.currenthack == 0 then
        HEIST.hackmethod = 1
        loc.x = 262.65
        loc.y = 222.75
        loc.z = 105.90
        loc.h = 244.19
    elseif self.currenthack == 1 then
        HEIST.hackmethod = 2
        loc.x = 253.34
        loc.y = 228.25
        loc.z = 101.39
        loc.h = 63.60
    end
    local animDict = "anim@heists@ornate_bank@hack"

    RequestAnimDict(animDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")
    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Citizen.Wait(100)
    end
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))

    SetEntityHeading(ped, loc.h)
    local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), targetPosition, 1, 1, 0)
    local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
    local card = CreateObject(GetHashKey("hei_prop_heist_card_hack_02"), targetPosition, 1, 1, 0)

    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)

    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)

    SetPedComponentVariation(ped, 5, 0, 0, 0)
    Citizen.Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Citizen.Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    Citizen.Wait(2000)
    Brute()
    notify(Config.text.hackconnect)
    while not HEIST.hackfinish do
        Citizen.Wait(1)
    end
    Citizen.Wait(1500)
    NetworkStartSynchronisedScene(netScene3)
    Citizen.Wait(4600)
    NetworkStopSynchronisedScene(netScene3)
    DeleteObject(bag)
    DeleteObject(laptop)
    DeleteObject(card)
    FreezeEntityPosition(ped, false)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
end
function HEIST:IdCard()
    HEIST.disableinput = true
    RequestModel("p_ld_id_card_01")
    while not HasModelLoaded("p_ld_id_card_01") do
        Citizen.Wait(1)
    end
    local ped = PlayerPedId()
    if self.currentid == 1 then
        SetEntityCoords(ped, 261.89, 223.5, 105.30, 1, 0, 0, 1)
        SetEntityHeading(ped, 255.92)
    elseif self.currentid == 2 then
        SetEntityCoords(ped, 253.39, 228.12, 100.75, 1, 0, 0, 1)
        SetEntityHeading(ped, 71.72)
    end
    Citizen.Wait(100)
    local pedco = GetEntityCoords(PlayerPedId())
    local IdProp = CreateObject(GetHashKey("p_ld_id_card_01"), pedco, true, true, false)
    local boneIndex = GetPedBoneIndex(PlayerPedId(), 28422)
    local panel = GetClosestObject(("hei_prop_hei_securitypanel"), pedco)

    AttachEntityToEntity(IdProp, ped, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_ATM", 0, true)
    exports['progressBars']:startUI(2000, Config.text.card)
    Citizen.Wait(1500)
    AttachEntityToEntity(IdProp, panel, boneIndex, -0.09, -0.02, -0.08, 270.0, 0.0, 270.0, true, true, false, true, 1, true)
    FreezeEntityPosition(IdProp)
    Citizen.Wait(500)
    ClearPedTasksImmediately(ped)
    Citizen.Wait(1500)
    PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    if self.currentid == 1 then
        HEIST.disableinput = false
        notify(Config.text.unlocked)
        --TriggerServerEvent("lixeiroHeist:toggleDoor", HEIST.hack1.type, vector3(HEIST.hack1.x, HEIST.hack1.y, HEIST.hack1.z), false, HEIST.hack1.h)
        TriggerServerEvent("lixeiroHeist:policeDoor", 3, false)
    elseif self.currentid == 2 then
        HEIST.stage1break = true
        HEIST.disableinput = false
        exports['progressBars']:startUI(4000, Config.text.using)
        local count = 4
        repeat
            Citizen.Wait(1000)
            count = count - 1
        until count == 0
        notify(Config.text.used)
        SpawnObj()
        TriggerServerEvent("lixeiroHeist:openvault", 1)
        TriggerEvent("lixeiroHeist:vaulttimer", 2)
        TriggerServerEvent("lixeiroHeist:alarm_s", 1)
        self.info.stage = 2
        self.info.style = 2
        self:HandleInfo()
    end
end

--======================--
--== GetClosestObject ==--
--======================--
local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end
function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
function GetObjects()
	local objects = {}

	for object in EnumerateObjects() do
		table.insert(objects, object)
	end

	return objects
end
function GetClosestObject(filter, coords)
	local objects         = GetObjects()
	local closestDistance = -1
	local closestObject   = -1
	local filter          = filter
	local coords          = coords

	if type(filter) == 'string' then
		if filter ~= '' then
			filter = {filter}
		end
	end

	if coords == nil then
		local playerPed = PlayerPedId()
		coords          = GetEntityCoords(playerPed)
	end

	for i=1, #objects, 1 do

		local foundObject = false

		if filter == nil or (type(filter) == 'table' and #filter == 0) then
			foundObject = true
		else

			local objectModel = GetEntityModel(objects[i])

			for j=1, #filter, 1 do
				if objectModel == GetHashKey(filter[j]) then
					foundObject = true
				end
			end

		end

		if foundObject then
			local objectCoords = GetEntityCoords(objects[i])
			local distance     = GetDistanceBetweenCoords(objectCoords, coords.x, coords.y, coords.z, true)

			if closestDistance == -1 or closestDistance > distance then
				closestObject   = objects[i]
				closestDistance = distance
			end
		end

	end

	return closestObject, closestDistance
end

function SpawnObj()
    if not HEIST.enablextras then
        RequestModel("hei_prop_hei_cash_trolly_01")
        Citizen.Wait(100)
        Trolley1 = CreateObject(269934519, 257.44, 215.07, 100.68, 1, 0, 0)
        Trolley2 = CreateObject(269934519, 262.34, 213.28, 100.68, 1, 0, 0)
        Trolley3 = CreateObject(269934519, 263.45, 216.05, 100.68, 1, 0, 0)
        local heading = GetEntityHeading(Trolley3)

        SetEntityHeading(Trolley3, heading + 150)
    elseif HEIST.enablextras then
        RequestModel("hei_prop_hei_cash_trolly_01")
        RequestModel("ch_prop_gold_trolly_01a")
        Citizen.Wait(100)
        Trolley1 = CreateObject(269934519, 257.44, 215.07, 100.68, 1, 0, 0)
        Trolley2 = CreateObject(269934519, 262.34, 213.28, 100.68, 1, 0, 0)
        Trolley3 = CreateObject(269934519, 263.45, 216.05, 100.68, 1, 0, 0)
        Trolley4 = CreateObject(2007413986, 266.02, 215.34, 100.68, 1, 0, 0)
        Trolley5 = CreateObject(881130828, 265.11, 212.05, 100.68, 1, 0, 0)
        local heading = GetEntityHeading(Trolley3)
        local heading2 = GetEntityHeading(Trolley4)

        SetEntityHeading(Trolley3, heading + 150)
        SetEntityHeading(Trolley4, heading2 + 150)
    end
    TriggerServerEvent("lixeiroHeist:startloot")
end
function Loot(currentgrab)
    Grab2clear = false
    Grab3clear = false
    HEIST.grabber = true
    Trolley = nil
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"

    if currentgrab == 1 then
        Trolley = GetClosestObjectOfType(257.44, 215.07, 100.68, 1.0, 269934519, false, false, false)
    elseif currentgrab == 2 then
        Trolley = GetClosestObjectOfType(262.34, 213.28, 100.68, 1.0, 269934519, false, false, false)
    elseif currentgrab == 3 then
        Trolley = GetClosestObjectOfType(263.45, 216.05, 100.68, 1.0, 269934519, false, false, false)
    elseif currentgrab == 4 then
        Trolley = GetClosestObjectOfType(266.02, 215.34, 100.68, 1.0, 2007413986, false, false, false)
        model = "ch_prop_gold_bar_01a"
    elseif currentgrab == 5 then
        Trolley = GetClosestObjectOfType(265.11, 212.05, 100.68, 1.0, 881130828, false, false, false)
        model = "ch_prop_vault_dimaondbox_01a"
    end
	local CashAppear = function()
	    local pedCoords = GetEntityCoords(ped)
        local grabmodel = GetHashKey(model)

        RequestModel(grabmodel)
        while not HasModelLoaded(grabmodel) do
            Citizen.Wait(100)
        end
	    local grabobj = CreateObject(grabmodel, pedCoords, true)

	    FreezeEntityPosition(grabobj, true)
	    SetEntityInvincible(grabobj, true)
	    SetEntityNoCollisionEntity(grabobj, ped)
	    SetEntityVisible(grabobj, false, false)
	    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	    local startedGrabbing = GetGameTimer()

	    Citizen.CreateThread(function()
		    while GetGameTimer() - startedGrabbing < 37000 do
			    Citizen.Wait(1)
			    DisableControlAction(0, 73, true)
			    if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
				    if not IsEntityVisible(grabobj) then
					    SetEntityVisible(grabobj, true, false)
				    end
			    end
			    if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
				    if IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, false, false)
                        if currentgrab < 4 then
                            TriggerServerEvent("lixeiroHeist:rewardCash")
                        elseif currentgrab == 4 then
                            TriggerServerEvent("lixeiroHeist:rewardGold")
                        elseif currentgrab == 5 then
                            TriggerServerEvent("lixeiroHeist:rewardDia")
                        end
				    end
			    end
		    end
		    DeleteObject(grabobj)
	    end)
    end
    local emptyobj = 769923921

    if currentgrab == 4 or currentgrab == 5 then
        emptyobj = 2714348429
    end
	if IsEntityPlayingAnim(Trolley, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
		return
    end
    local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

    RequestAnimDict("anim@heists@ornate_bank@grab_cash")
    RequestModel(baghash)
    RequestModel(emptyobj)
    while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
        Citizen.Wait(100)
    end
    while not NetworkHasControlOfEntity(Trolley) do
		Citizen.Wait(1)
		NetworkRequestControlOfEntity(Trolley)
	end
	GrabBag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
    Grab1 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(ped, Grab1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(GrabBag, Grab1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
	NetworkStartSynchronisedScene(Grab1)
	Citizen.Wait(1500)
	CashAppear()
    if not Grab2clear then
        Grab2 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(Trolley, Grab2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab2)
        Citizen.Wait(37000)
    end
    if not Grab3clear then
        Grab3 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab3)
        NewTrolley = CreateObject(emptyobj, GetEntityCoords(Trolley) + vector3(0.0, 0.0, - 0.985), true, false, false)
        SetEntityRotation(NewTrolley, GetEntityRotation(Trolley))
        while not NetworkHasControlOfEntity(Trolley) do
            Citizen.Wait(1)
            NetworkRequestControlOfEntity(Trolley)
        end
        DeleteObject(Trolley)
        while DoesEntityExist(Trolley) do
            Citizen.Wait(1)
            DeleteObject(Trolley)
        end
        PlaceObjectOnGroundProperly(NewTrolley)
    end
	Citizen.Wait(1800)
	if DoesEntityExist(GrabBag) then
        DeleteEntity(GrabBag)
    end
    SetPedComponentVariation(ped, 5, 45, 0, 0)
	RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
	SetModelAsNoLongerNeeded(emptyobj)
	SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
end
function Search(location)
    HEIST.disableinput = true
    RequestAnimDict('mp_arresting')
    while not HasAnimDictLoaded('mp_arresting') do
        Citizen.Wait(10)
    end
    EnterAnim(vector3(location.coords.x, location.coords.y, location.coords.z))
    Citizen.Wait(1500)
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    exports['progressBars']:startUI(15000, Config.text.search)
    Citizen.Wait(15000)
    if HEIST.searchinfo.random ~= 1 then
        location.status = true
        notify(Config.text.nothing)
        HEIST.searchinfo.random = math.random(1, HEIST.cur - 1)
        HEIST.cur = HEIST.cur - 1
    else
        HEIST.searchinfo.found = true
        notify(Config.text.found)
        TriggerServerEvent("lixeiroHeist:giveidcard")
    end
    ClearPedTasks(PlayerPedId())
    HEIST.disableinput = false
end

function Process(ms, text) exports['progressBars']:startUI(ms, text) Citizen.Wait(ms) end
function DrawText3D(x, y, z, text, scale) local onScreen, _x, _y = World3dToScreen2d(x, y, z) local pX, pY, pZ = table.unpack(GetGameplayCamCoords()) SetTextScale(scale, scale) SetTextFont(4) SetTextProportional(1) SetTextEntry("STRING") SetTextCentre(true) SetTextColour(255, 255, 255, 215) AddTextComponentString(text) DrawText(_x, _y) local factor = (string.len(text)) / 700 DrawRect(_x, _y + 0.0150, 0.095 + factor, 0.03, 41, 11, 41, 100) end
function ShowVaultTimer() SetTextFont(0) SetTextProportional(0) SetTextScale(0.42, 0.42) SetTextDropShadow(0, 0, 0, 0,255) SetTextEdge(1, 0, 0, 0, 255) SetTextEntry("STRING") AddTextComponentString("~r~"..HEIST.vaulttime.."~w~") DrawText(0.682, 0.96) end
function DisableControl() DisableControlAction(0, 73, false) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 25, true) DisableControlAction(0, 263, true) DisableControlAction(0, 32, true) DisableControlAction(0, 34, true) DisableControlAction(0, 31, true) DisableControlAction(0, 30, true) DisableControlAction(0, 45, true) DisableControlAction(0, 22, true) DisableControlAction(0, 44, true) DisableControlAction(0, 37, true) DisableControlAction(0, 23, true) DisableControlAction(0, 288, true) DisableControlAction(0, 289, true) DisableControlAction(0, 170, true) DisableControlAction(0, 167, true) DisableControlAction(0, 73, true) DisableControlAction(2, 199, true) DisableControlAction(0, 47, true) DisableControlAction(0, 264, true) DisableControlAction(0, 257, true) DisableControlAction(0, 140, true) DisableControlAction(0, 141, true) DisableControlAction(0, 142, true) DisableControlAction(0, 143, true) end
function EnterAnim(coords) TaskTurnPedToFaceCoord(PlayerPedId(), coords, 1000) end

Citizen.CreateThread(function()
    function Initialize(scaleform)
        local scaleform = RequestScaleformMovieInteractive(scaleform)
        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end

        local CAT = 'hack'
        local CurrentSlot = 0
        while HasAdditionalTextLoaded(CurrentSlot) and not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
            Citizen.Wait(0)
            CurrentSlot = CurrentSlot + 1
        end

        if not HasThisAdditionalTextLoaded(CAT, CurrentSlot) then
            ClearAdditionalText(CurrentSlot, true)
            RequestAdditionalText(CAT, CurrentSlot)
            while not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
                Citizen.Wait(0)
            end
        end
        PushScaleformMovieFunction(scaleform, "SET_LABELS")
        ScaleformLabel("H_ICON_1")
        ScaleformLabel("H_ICON_2")
        ScaleformLabel("H_ICON_3")
        ScaleformLabel("H_ICON_4")
        ScaleformLabel("H_ICON_5")
        ScaleformLabel("H_ICON_6")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_BACKGROUND")
        PushScaleformMovieFunctionParameterInt(1)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(1.0)
        PushScaleformMovieFunctionParameterFloat(4.0)
        PushScaleformMovieFunctionParameterString("My Computer")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterString("Power Off")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_LIVES")
        PushScaleformMovieFunctionParameterInt(lives)
        PushScaleformMovieFunctionParameterInt(5)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(1)
        PushScaleformMovieFunctionParameterInt(math.random(160,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(2)
        PushScaleformMovieFunctionParameterInt(math.random(170,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(3)
        PushScaleformMovieFunctionParameterInt(math.random(190,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(4)
        PushScaleformMovieFunctionParameterInt(math.random(200,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(5)
        PushScaleformMovieFunctionParameterInt(math.random(210,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(6)
        PushScaleformMovieFunctionParameterInt(math.random(220,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(7)
        PushScaleformMovieFunctionParameterInt(255)
        PopScaleformMovieFunctionVoid()
        return scaleform
    end
    scaleform = Initialize("HACKING_PC")
    while true do
        Citizen.Wait(0)
        if UsingComputer then
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            PushScaleformMovieFunction(scaleform, "SET_CURSOR")
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 239))
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 240))
            PopScaleformMovieFunctionVoid()

            if IsDisabledControlJustPressed(0,24) and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 176) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 25) and not Hacking and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_BACK")
                PopScaleformMovieFunctionVoid()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 172) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(8)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 173) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(9)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 174) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(10)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 175) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(11)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            end
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if HasScaleformMovieLoaded(scaleform) and UsingComputer then
            HEIST.disableinput = true
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)

            if GetScaleformMovieFunctionReturnBool(ClickReturn) then
                program = GetScaleformMovieFunctionReturnInt(ClickReturn)
                if program == 82 and not Hacking then
                    lives = 5
                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(lives)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "OPEN_APP")
                    PushScaleformMovieFunctionParameterFloat(0.0)
                    PopScaleformMovieFunctionVoid()
                    Hacking = true
                    notify(Config.text.ip)
                elseif program == 83 and not Hacking and Ipfinished then

                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(lives)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "OPEN_APP")
                    PushScaleformMovieFunctionParameterFloat(1.0)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_WORD")
                    PushScaleformMovieFunctionParameterString(RouletteWords[math.random(#RouletteWords)])
                    PopScaleformMovieFunctionVoid()

                    Hacking = true
                    notify(Config.text.password)
                elseif Hacking and program == 87 then
                    lives = lives - 1
                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(lives)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                elseif Hacking and program == 84 then
                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                    PushScaleformMovieFunction(scaleform, "SET_IP_OUTCOME")
                    PushScaleformMovieFunctionParameterBool(true)
                    ScaleformLabel(0x18EBB648)
                    PopScaleformMovieFunctionVoid()
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                    Ipfinished = true
                    notify(Config.text.bruteforce)
                elseif Hacking and program == 85 then
                    PlaySoundFrontend(-1, "HACKING_FAILURE", "", false)
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                    SorF = false
                elseif Hacking and program == 86 then
                    SorF = true
                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                    PushScaleformMovieFunctionParameterBool(true)
                    ScaleformLabel("WINBRUTE")
                    PopScaleformMovieFunctionVoid()
                    Wait(0)
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                    SorF = false
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DisableControlAction(0, 24, false)
                    DisableControlAction(0, 25, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                    if HEIST.hackmethod == 1 then
                        --TriggerServerEvent("lixeiroHeist:toggleDoor", HEIST.hack1.type, vector3(HEIST.hack1.x, HEIST.hack1.y, HEIST.hack1.z), false, HEIST.hack1.h)
                        TriggerServerEvent("lixeiroHeist:policeDoor", 3, false)
                        notify(Config.text.hacked)
                        UsingComputer = false
                        HEIST.disableinput = false
                        HEIST.hackfinish = true
                        Ipfinished = false
                    elseif HEIST.hackmethod == 2 then
                        SpawnObj()
                        UsingComputer = false
                        Ipfinished = false
                        Process(25000, Config.text.syshack)
                        TriggerEvent("lixeiroHeist:vaulttimer", 1)
                        TriggerServerEvent("lixeiroHeist:openvault", 1)
                        notify(Config.text.hacked)
                        HEIST.disableinput = false
                        HEIST.hackfinish = true
                        HEIST.info.stage = 2
                        HEIST.info.style = 1
                        HEIST.stage1break = true
                        HEIST:HandleInfo()
                    end
                elseif program == 6 then
                    TriggerServerEvent("lixeiroHeist:upVar_s", "hacking_s", false)
                    UsingComputer = false
                    HEIST.hackfinish = true
                    HEIST.disableinput = false
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DisableControlAction(0, 24, false)
                    DisableControlAction(0, 25, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                end

                if Hacking then
                    PushScaleformMovieFunction(scaleform, "SHOW_LIVES")
                    PushScaleformMovieFunctionParameterBool(true)
                    PopScaleformMovieFunctionVoid()
                    if lives <= 0 then
                        SorF = true
                        PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                        PushScaleformMovieFunctionParameterBool(false)
                        ScaleformLabel("LOSEBRUTE")
                        PopScaleformMovieFunctionVoid()
                        Wait(1000)
                        PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                        PopScaleformMovieFunctionVoid()
                        TriggerServerEvent("lixeiroHeist:upVar_s", "hacking_s", false)
                        HEIST.disableinput = false
                        Hacking = false
                        SorF = false
                    end
                end
            end
        else
            Wait(250)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local enabled = false

        Citizen.Wait(1)
        if HEIST.disableinput then
            enabled = true
            DisableControl()
        end
        if not enabled then
            Citizen.Wait(1000)
        end
    end
end)
function Brute()
    scaleform = Initialize("HACKING_PC")
    UsingComputer = true
end
function ScaleformLabel(label)
    BeginTextCommandScaleformString(label)
    EndTextCommandScaleformString()
end
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    HEIST.stage0break = true
    HEIST.stage1break = true
    HEIST.stage2break = true
    HEIST.stage3break = true
    HEIST.stage4break = true
    HEIST.stagelootbreak = true
    HEIST.disableinput = false
    HEIST.cur = 7
    HEIST.starttimer = false
    HEIST.vaulttime = 0
    HEIST.alarmblip = nil
    HEIST.grabber = false
    HEIST.searchlocations = {
        {coords = {x = 233.40, y = 221.53, z = 110.40}, status = false},
        {coords = {x = 240.93, y = 211.12, z = 110.40}, status = false},
        {coords = {x = 246.54, y = 208.86, z = 110.40}, status = false},
        {coords = {x = 264.33, y = 212.16, z = 110.40}, status = false},
        {coords = {x = 252.87, y = 222.36, z = 106.35}, status = false},
        {coords = {x = 249.71, y = 227.84, z = 106.35}, status = false},
        {coords = {x = 244.80, y = 229.70, z = 106.35}, status = false}
    }
    HEIST.checks.hack1 = false
    HEIST.checks.hack2 = false
    HEIST.checks.thermal1 = false
    HEIST.checks.thermal2 = false
    HEIST.checks.id1 = false
    HEIST.checks.id2 = false
    HEIST.checks.idfound = false
    HEIST.checks.grab1 = false
    HEIST.checks.grab2 = false
    HEIST.checks.grab3 = false
    HEIST.checks.grab4 = false
    HEIST.checks.grab5 = false
    HEIST.searchinfo = {
        random = math.random(1, HEIST.cur),
        found = false
    }
    program = 0
    scaleform = nil
    lives = 5
    ClickReturn = nil
    SorF = false
    Hacking = false
    UsingComputer = false
    Citizen.Wait(5000)
    HEIST.hackfinish = false
    HEIST.stagelootbreak = false
    HEIST.stage0break = false
    HEIST.stage1break = false
    HEIST.stage2break = false
    HEIST.stage3break = false
    HEIST.stage4break = false
    HEIST.initiator = false
    HEIST:GetInfo()
end)
RegisterNetEvent("lixeiroHeist:policeDoor_c")
AddEventHandler("lixeiroHeist:policeDoor_c", function(doornum, status)
    PoliceDoors[doornum].locked = status
end)
RegisterNetEvent("lixeiroHeist:openvault_c")
AddEventHandler("lixeiroHeist:openvault_c", function(method)
    TriggerEvent("lixeiroHeist:vault", method)
    TriggerEvent("lixeiroHeist:vaultsound")
end)
RegisterNetEvent("lixeiroHeist:vault")
AddEventHandler("lixeiroHeist:vault", function(method)
	local obj = GetClosestObject(HEIST.vault.type, vector3(HEIST.vault.x, HEIST.vault.y, HEIST.vault.z))
    local count = 0

    if method == 1 then
        repeat
	        local rotation = GetEntityHeading(obj) - 0.05

            SetEntityHeading(obj, rotation)
            count = count + 1
            Citizen.Wait(10)
        until count == 1100
    else
        repeat
	        local rotation = GetEntityHeading(obj) + 0.05

            SetEntityHeading(obj, rotation)
            count = count + 1
            Citizen.Wait(10)
        until count == 1100
    end
    FreezeEntityPosition(obj, true)
end)
RegisterNetEvent("lixeiroHeist:vaultsound")
AddEventHandler("lixeiroHeist:vaultsound", function()
    local coords = GetEntityCoords(PlayerPedId())
    local count = 0

    if GetDistanceBetweenCoords(coords, HEIST.vault.x, HEIST.vault.y, HEIST.vault.z, true) <= 10 then
        repeat
            PlaySoundFrontend(-1, "OPENING", "MP_PROPERTIES_ELEVATOR_DOORS" , 1)
            Citizen.Wait(900)
            count = count + 1
        until count == 17
    end
end)
RegisterNetEvent('lixeiroHeist:alarm')
AddEventHandler('lixeiroHeist:alarm', function(status)
    if status == 1 then
        PlaySound = true
    elseif status == 2 then
        PlaySound = false
        SendNUIMessage({transactionType = 'stopSound'})
    end
end)
RegisterNetEvent("lixeiroHeist:updatecheck_c")
AddEventHandler("lixeiroHeist:updatecheck_c", function(var, status)
    HEIST.checks[var] = status
end)
RegisterNetEvent("lixeiroHeist:startloot_c")
AddEventHandler("lixeiroHeist:startloot_c", function()
    HEIST.startloot = true
end)
function GroupDigits(value)
	local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')

	return left..(num:reverse():gsub('(%d%d%d)','%1'):reverse())..right
end
RegisterNetEvent("lixeiroHeist:vaulttimer")
AddEventHandler("lixeiroHeist:vaulttimer", function(method)
    if method == 1 then
        notify(Config.text.vaulttime)
        HEIST.starttimer = true
        HEIST.vaulttime = Config.vaulttime
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1)
                if HEIST.starttimer then
                    ShowVaultTimer()
                elseif not HEIST.starttimer then
                    break
                end
            end
        end)
        repeat
            Citizen.Wait(1000)
            HEIST.vaulttime = HEIST.vaulttime - 1
        until HEIST.vaulttime == 0
        TriggerServerEvent("lixeiroHeist:ostimer")
        TriggerServerEvent("lixeiroHeist:gas")
        Citizen.CreateThread(function()
            RequestNamedPtfxAsset("core")
            while not HasNamedPtfxAssetLoaded("core") do
                Citizen.Wait(10)
            end
            while true do
                Citizen.Wait(1)
                if HEIST.begingas then
                    SetPtfxAssetNextCall("core")
                    Gas = StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", 262.78, 213.22, 101.68, 0.0, 0.0, 0.0, 0.80, false, false, false, false)
                    SetPtfxAssetNextCall("core")
                    Gas2 = StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", 257.71, 216.64, 101.68, 0.0, 0.0, 0.0, 1.50, false, false, false, false)
                    SetPtfxAssetNextCall("core")
                    Gas3 = StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", 252.71, 218.22, 101.68, 0.0, 0.0, 0.0, 1.50, false, false, false, false)
                    Citizen.Wait(5000)
                    StopParticleFxLooped(Gas, 0)
                    StopParticleFxLooped(Gas2, 0)
                    StopParticleFxLooped(Gas3, 0)
                end
            end
        end)
        Citizen.Wait(5000)
        HEIST.starttimer = false
        Citizen.Wait(30000)
        HEIST.begingas = false
        TriggerServerEvent("lixeiroHeist:alarm_s", 2)
		
		output = nil
		TriggerServerEvent('lixeiroHeist:gettotalcash')
		while output == nil do 
			Wait(0)
		end
		local result = output
		text = "$"..GroupDigits(result)
		notify(Config.text.stole.." "..text)
    else
		notify(Config.text.vaulttime)
        HEIST.starttimer = true
        HEIST.vaulttime = Config.vaulttime
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1)
                if HEIST.starttimer then
                    ShowVaultTimer()
                elseif not HEIST.starttimer then
                    break
                end
            end
        end)
        repeat
            Citizen.Wait(1000)
            HEIST.vaulttime = HEIST.vaulttime - 1
        until HEIST.vaulttime == 0
        TriggerServerEvent("lixeiroHeist:ostimer")
        TriggerServerEvent("lixeiroHeist:gas")
        Citizen.CreateThread(function()
            RequestNamedPtfxAsset("core")
            while not HasNamedPtfxAssetLoaded("core") do
                Citizen.Wait(10)
            end
            while true do
                Citizen.Wait(1)
                if HEIST.begingas then
                    SetPtfxAssetNextCall("core")
                    Gas = StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", 262.78, 213.22, 101.68, 0.0, 0.0, 0.0, 0.80, false, false, false, false)
                    SetPtfxAssetNextCall("core")
                    Gas2 = StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", 257.71, 216.64, 101.68, 0.0, 0.0, 0.0, 1.50, false, false, false, false)
                    SetPtfxAssetNextCall("core")
                    Gas3 = StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", 252.71, 218.22, 101.68, 0.0, 0.0, 0.0, 1.50, false, false, false, false)
                    Citizen.Wait(5000)
                    StopParticleFxLooped(Gas, 0)
                    StopParticleFxLooped(Gas2, 0)
                    StopParticleFxLooped(Gas3, 0)
                end
            end
        end)
        Citizen.Wait(5000)
        HEIST.starttimer = false
        Citizen.Wait(30000)
        HEIST.begingas = false
        TriggerServerEvent("lixeiroHeist:alarm_s", 2)
		output = nil
		TriggerServerEvent('lixeiroHeist:gettotalcash')
		while output == nil do 
			Wait(0)
		end
		local result = output
        text = "$"..GroupDigits(result)
        notify(Config.text.stole.." "..text)
    end
end)
RegisterNetEvent("lixeiroHeist:gas_c")
AddEventHandler("lixeiroHeist:gas_c", function()
    Citizen.CreateThread(function()
        HEIST.begingas = true
        notify(Config.text.vaultclose)
        while true do
            Citizen.Wait(1)
            if HEIST.begingas then
                local playerloc = GetEntityCoords(PlayerPedId())
                local dst1 = GetDistanceBetweenCoords(playerloc, 252.71, 218.22, 101.68, true)
                local dst2 = GetDistanceBetweenCoords(playerloc, 262.78, 213.22, 101.68, true)

                if dst1 <= 5 or dst2 <= 6.5 then
                    ApplyDamageToPed(PlayerPedId(), 3, false)
                    Citizen.Wait(500)
                end
            end
        end
    end)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            if HEIST.begingas then
				Grab2clear = true
                Grab3clear = true
                if DoesEntityExist(GrabBag) then
                    DeleteEntity(GrabBag)
                end
                SetPedComponentVariation(ped, 5, 45, 0, 0)
                NetworkStopSynchronisedScene(Grab1)
                NetworkStopSynchronisedScene(Grab2)
                NetworkStopSynchronisedScene(Grab3)
                Citizen.Wait(12000)
                for i = 1, #HEIST.obj, 1 do
                    local entity = GetClosestObjectOfType(HEIST.obj[i].x, HEIST.obj[i].y, HEIST.obj[i].z, 1.0, HEIST.obj[i].h, false, false, false)

                    if DoesEntityExist(entity) then
                        DeleteEntity(entity)
                    end
                end
                for j = 1, #HEIST.emptyobjs, 1 do
                    local entity = GetClosestObjectOfType(HEIST.emptyobjs[j].x, HEIST.emptyobjs[j].y, HEIST.emptyobjs[j].z, 1.0, HEIST.emptyobjs[j].h, false, false, false)

                    if DoesEntityExist(entity) then
                        DeleteEntity(entity)
                    end
                end
				HEIST.stagelootbreak = true
				Citizen.Wait(48000)
                HEIST.stage2break = true
                HEIST.stage4break = true
                notify(Config.text.vaultclose2)
                TriggerEvent("lixeiroHeist:vault", 2)
                TriggerEvent("lixeiroHeist:vaultsound")
                for k, v in ipairs(HEIST.doorchecks) do
                    if k == 1 or k == 4 or k == 5 then
                        TriggerEvent("lixeiroHeist:moltgate_c", v.x, v.y, v.z, v.h1, v.h2, 2)
                    end
                end
                HEIST.begingas = false
                if HEIST.grabber then
					output = nil
					TriggerServerEvent('lixeiroHeist:gettotalcash')
					while output == nil do 
						Wait(0)
					end
					local result = output
					text = "$"..GroupDigits(result)
					notify(Config.text.stole.." "..text)
                end
                return
            end
        end
    end)
end)
RegisterNetEvent("lixeiroHeist:policenotify")
AddEventHandler("lixeiroHeist:policenotify", function(toggle)
    -- local player = ESX.GetPlayerData()
    -- if player.job.name == "police" then
        if toggle == 1 then
            notify(Config.text.alarm)
            if not DoesBlipExist(HEIST.alarmblip) then
                HEIST.alarmblip = AddBlipForCoord(HEIST.loudstart.x, HEIST.loudstart.y, HEIST.loudstart.z)
                SetBlipSprite(HEIST.alarmblip, 161)
	            SetBlipScale(HEIST.alarmblip, 2.0)
	            SetBlipColour(HEIST.alarmblip, 1)

	            PulseBlip(HEIST.alarmblip)
            end
        elseif toggle == 2 then
            if DoesBlipExist(HEIST.alarmblip) then
                RemoveBlip(HEIST.alarmblip)
            end
        end
    -- end
end)
RegisterNetEvent("lixeiroHeist:moltgate_c")
AddEventHandler("lixeiroHeist:moltgate_c", function(x, y, z, oldmodel, newmodel, method)
    if method == 2 then
        CreateModelSwap(x, y, z, 5, GetHashKey(newmodel), GetHashKey(oldmodel), 1)
    else
        CreateModelSwap(x, y, z, 5, GetHashKey(oldmodel), GetHashKey(newmodel), 1)
    end
end)
RegisterNetEvent("lixeiroHeist:fixdoor_c")
AddEventHandler("lixeiroHeist:fixdoor_c", function(hash, coords, heading)
    local door = GetClosestObjectOfType(coords, 2.0, hash, false, false, false)

    Citizen.Wait(250)
    SetEntityHeading(door, heading)
    FreezeEntityPosition(door, true)
end)
RegisterNetEvent("lixeiroHeist:ptfx_c")
AddEventHandler("lixeiroHeist:ptfx_c", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
    if method == 1 then
        ptfx = vector3(257.39, 221.20, 106.29)
    elseif method == 2 then
        ptfx = vector3(252.985, 221.70, 101.72)
    elseif method == 3 then
        ptfx = vector3(261.68, 216.63, 101.75)
    end
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(13000)
    StopParticleFxLooped(effect, 0)
end)
RegisterNetEvent("lixeiroHeist:reset")
AddEventHandler("lixeiroHeist:reset", function()
    HEIST.stage1break = true
    HEIST.stage2break = true
    HEIST.stage4break = true
    HEIST.stagelootbreak = false
    HEIST.disableinput = false
    HEIST.info = {stage = 0, style = nil, locked = false}
    HEIST.cur = 7
    HEIST.starttimer = false
    HEIST.vaulttime = 0
    HEIST.alarmblip = nil
    HEIST.grabber = false
    HEIST.doorchecks = {
        {x= 257.10, y = 220.30, z = 106.28, he = 339.733, h = GetHashKey("hei_v_ilev_bk_gate_pris"), status = 0},
        {x = 236.91, y = 227.50, z = 106.29, he = 340.000, h = GetHashKey("v_ilev_bk_door"), status = 0},
        {x = 262.35, y = 223.00, z = 107.05, he = 249.731, h = GetHashKey("hei_v_ilev_bk_gate2_pris"), status = 0},
        {x = 252.72, y = 220.95, z = 101.68, he = 160.278, h = GetHashKey("hei_v_ilev_bk_safegate_pris"), status = 0},
        {x = 261.01, y = 215.01, z = 101.68, he = 250.082, h = GetHashKey("hei_v_ilev_bk_safegate_pris"), status = 0},
        {x = 253.92, y = 224.56, z = 101.88, he = 160.000, h = GetHashKey("v_ilev_bk_vaultdoor"), status = 0}
    }
    HEIST.searchlocations = {
        {coords = {x = 233.40, y = 221.53, z = 110.40}, status = false},
        {coords = {x = 240.93, y = 211.12, z = 110.40}, status = false},
        {coords = {x = 246.54, y = 208.86, z = 110.40}, status = false},
        {coords = {x = 264.33, y = 212.16, z = 110.40}, status = false},
        {coords = {x = 252.87, y = 222.36, z = 106.35}, status = false},
        {coords = {x = 249.71, y = 227.84, z = 106.35}, status = false},
        {coords = {x = 244.80, y = 229.70, z = 106.35}, status = false}
    }
    HEIST.checks = {
        hack1 = false,
        hack2 = false,
        thermal1 = false,
        thermal2 = false,
        id1 = false,
        id2 = false,
        idfound = false,
        grab1 = false,
        grab2 = false,
        grab3 = false,
        grab4 = false,
        grab5 = false
    }
    HEIST.searchinfo = {
        random = math.random(1, HEIST.cur),
        found = false
    }
    program = 0
    scaleform = nil
    lives = 5
    ClickReturn = nil
    SorF = false
    Hacking = false
    UsingComputer = false
    Citizen.Wait(1000)
    HEIST.hackfinish = false
    HEIST.stage0break = false
    HEIST.stage1break = false
    HEIST.stage2break = false
    HEIST.stage4break = false
    HEIST.initiator = false
    HEIST:HandleInfo()
end)
Citizen.CreateThread(function()
    if HEIST.enablextras then
        while true do
            if HEIST.startloot then
                local coords = GetEntityCoords(PlayerPedId())

                if not HEIST.checks.grab1 then
                    local dst1 = GetDistanceBetweenCoords(coords, HEIST.cash1.x, HEIST.cash1.y, HEIST.cash1.z, true)

                    if dst1 <= 4 then
                        DrawText3D(HEIST.cash1.x, HEIST.cash1.y, HEIST.cash1.z, Config.text.lootcash, 0.40)
                        if dst1 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab1 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab1", true)
                            Loot(1)
                        end
                    end
                end
                if not HEIST.checks.grab2 then
                    local dst2 = GetDistanceBetweenCoords(coords, HEIST.cash2.x, HEIST.cash2.y, HEIST.cash2.z, true)

                    if dst2 <= 4 then
                        DrawText3D(HEIST.cash2.x, HEIST.cash2.y, HEIST.cash2.z, Config.text.lootcash, 0.40)
                        if dst2 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab2 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab2", true)
                            Loot(2)
                        end
                    end
                end
                if not HEIST.checks.grab3 then
                    local dst3 = GetDistanceBetweenCoords(coords, HEIST.cash3.x, HEIST.cash3.y, HEIST.cash3.z, true)

                    if dst3 <= 4 then
                        DrawText3D(HEIST.cash3.x, HEIST.cash3.y, HEIST.cash3.z, Config.text.lootcash, 0.40)
                        if dst3 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab3 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab3", true)
                            Loot(3)
                        end
                    end
                end
                if not HEIST.checks.grab4 then
                    local dst4 = GetDistanceBetweenCoords(coords, HEIST.gold.x, HEIST.gold.y, HEIST.gold.z, true)

                    if dst4 <= 4 then
                        DrawText3D(HEIST.gold.x, HEIST.gold.y, HEIST.gold.z, Config.text.lootgold, 0.40)
                        if dst4 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab4 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab4", true)
                            Loot(4)
                        end
                    end
                end
                if not HEIST.checks.grab5 then
                    local dst5 = GetDistanceBetweenCoords(coords, HEIST.dia.x, HEIST.dia.y, HEIST.dia.z, true)

                    if dst5 <= 4 then
                        DrawText3D(HEIST.dia.x, HEIST.dia.y, HEIST.dia.z, Config.text.lootdia, 0.40)
                        if dst5 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab5 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab5", true)
                            Loot(5)
                        end
                    end
                end
                if HEIST.stagelootbreak then
                    return
                end
            end
            Citizen.Wait(1)
        end
    elseif not HEIST.enablextras then
        while true do
            if HEIST.startloot then
                local coords = GetEntityCoords(PlayerPedId())

                if not HEIST.checks.grab1 then
                    local dst1 = GetDistanceBetweenCoords(coords, HEIST.cash1.x, HEIST.cash1.y, HEIST.cash1.z, true)

                    if dst1 <= 4 then
                        DrawText3D(HEIST.cash1.x, HEIST.cash1.y, HEIST.cash1.z, Config.text.lootcash, 0.40)
                        if dst1 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab1 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab1", true)
                            Loot(1)
                        end
                    end
                end
                if not HEIST.checks.grab2 then
                    local dst2 = GetDistanceBetweenCoords(coords, HEIST.cash2.x, HEIST.cash2.y, HEIST.cash2.z, true)

                    if dst2 <= 4 then
                        DrawText3D(HEIST.cash2.x, HEIST.cash2.y, HEIST.cash2.z, Config.text.lootcash, 0.40)
                        if dst2 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab2 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab2", true)
                            Loot(2)
                        end
                    end
                end
                if not HEIST.checks.grab3 then
                    local dst3 = GetDistanceBetweenCoords(coords, HEIST.cash3.x, HEIST.cash3.y, HEIST.cash3.z, true)

                    if dst3 <= 4 then
                        DrawText3D(HEIST.cash3.x, HEIST.cash3.y, HEIST.cash3.z, Config.text.lootcash, 0.40)
                        if dst3 < 1 and IsControlJustReleased(0, 38) then
                            HEIST.checks.grab3 = true
                            TriggerServerEvent("lixeiroHeist:updatecheck", "grab3", true)
                            Loot(3)
                        end
                    end
                end
                if HEIST.stagelootbreak then
                    return
                end
            end
            Citizen.Wait(1)
        end
    end
end)
Citizen.CreateThread(function()
	output = nil
	TriggerServerEvent('lixeiroHeist:GetDoors')
	while output == nil do 
		Wait(0)
	end
	PoliceDoors = output
    while PoliceDoors == {} do
        Citizen.Wait(1)
    end
    while true do
        for k, v in ipairs(PoliceDoors) do
            if PoliceDoors[k].obj == nil or not DoesEntityExist(PoliceDoors[k].obj) then
                PoliceDoors[k].obj = GetClosestObjectOfType(v.loc, 1.0, GetHashKey(v.model), false, false, false)
                PoliceDoors[k].obj2 = GetClosestObjectOfType(v.loc, 1.0, GetHashKey(v.model2), false, false, false)
            end
        end
        Citizen.Wait(1000)
    end
end)
Citizen.CreateThread(function()
    -- while PlayerData == nil do
        -- Citizen.Wait(500)
    -- end
    while true do
        local coords = GetEntityCoords(PlayerPedId())
        local doortext = nil
        local state = nil

        for k, v in ipairs(PoliceDoors) do
            local dst = GetDistanceBetweenCoords(coords, v.loc, true)

            if dst <= 50 then
                if v.locked then
                    FreezeEntityPosition(v.obj, true)
                    doortext = Config.text.unlockdoor
                    state = false
                elseif not v.locked then
                    FreezeEntityPosition(v.obj, false)
                    doortext = Config.text.lockdoor
                    state = true
                end
                -- if PlayerData.job.name == "police" then
                    -- if dst <= 1.5 then
                        -- local x, y, z = table.unpack(v.loc)

                        -- DrawText3D(x, y, z, doortext, 0.40)
                        -- if IsControlJustReleased(0, 38)  then
                            -- TriggerServerEvent("lixeiroHeist:policeDoor", k, state)
                        -- end
                    -- end
                -- end
            end
        end
        Citizen.Wait(1)
    end
end)
Citizen.CreateThread(function() 
	while true do 
		Citizen.Wait(1) 
		if PlaySound then 
			local lCoords = GetEntityCoords(GetPlayerPed(-1)) 
			local eCoords = vector3(257.10, 220.30, 106.28) 
			local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords) 
			if(distIs <= 50) then 
				SendNUIMessage({transactionType = 'playSound'}) 
				Citizen.Wait(28000) 
			else 
				SendNUIMessage({transactionType = 'stopSound'}) 
			end 
		end 
	end 
end)
Citizen.CreateThread(function() 
	Citizen.Wait(10000) 
	HEIST:GetInfo() 
end)

function notify(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end
