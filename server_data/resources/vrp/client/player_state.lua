local state_ready = false

function tvRP.playerStateReady(state)
	state_ready = state
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if IsPlayerPlaying(PlayerId()) and state_ready then
			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
			vRPserver._updatePos(x,y,z)
			vRPserver._updateHealth(tvRP.getHealth())
			vRPserver._updateWeapons(tvRP.getWeapons())
			vRPserver._updateCustomization(tvRP.getCustomization())
			vRPserver._updateArmor(tvRP.getArmour())
		end
	end
end)

local weapon_types = {
	"WEAPON_DAGGER",
	"WEAPON_BAT",
	"WEAPON_BOTTLE",
	"WEAPON_CROWBAR",
	"WEAPON_FLASHLIGHT",
	"WEAPON_GOLFCLUB",
	"WEAPON_HAMMER",
	"WEAPON_HATCHET",
	"WEAPON_KNUCKLE",
	"WEAPON_KNIFE",
	"WEAPON_MACHETE",
	"WEAPON_SWITCHBLADE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_WRENCH",
	"WEAPON_BATTLEAXE",
	"WEAPON_POOLCUE",
	"WEAPON_STONE_HATCHET",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_SNSPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_MUSKET",
	"WEAPON_FLARE",
	"GADGET_PARACHUTE",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_MICROSMG",
	"WEAPON_SMG",
	"WEAPON_ASSAULTSMG",
	"WEAPON_COMBATPDW",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_GUSENBERG",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_PETROLCAN"
}

function tvRP.getWeapons()
	local player = PlayerPedId()
	local ammo_types = {}
	local weapons = {}
	for k,v in pairs(weapon_types) do
		local hash = GetHashKey(v)
		if HasPedGotWeapon(player,hash) then
			local weapon = {}
			weapons[v] = weapon
			local atype = Citizen.InvokeNative(0x7FEAD38B326B9F74,player,hash)
			if ammo_types[atype] == nil then
				ammo_types[atype] = true
				weapon.ammo = GetAmmoInPedWeapon(player,hash)
			else
				weapon.ammo = 0
			end
		end
	end
	return weapons
end

function tvRP.replaceWeapons(weapons)
	local old_weapons = tvRP.getWeapons()
	tvRP.giveWeapons(weapons,true)
	return old_weapons
end

function tvRP.giveWeapons(weapons,clear_before)
	local player = PlayerPedId()
	if clear_before then
		RemoveAllPedWeapons(player,true)
	end

	for k,weapon in pairs(weapons) do
		local hash = GetHashKey(k)
		local ammo = weapon.ammo or 0
		GiveWeaponToPed(player,hash,ammo,false)
	end
end

function tvRP.setArmour(amount)
	SetPedArmour(PlayerPedId(),amount)
end

function tvRP.getArmour()
	return GetPedArmour(PlayerPedId())
end

local function parse_part(key)
	if type(key) == "string" and string.sub(key,1,1) == "p" then
		return true,tonumber(string.sub(key,2))
	else
		return false,tonumber(key)
	end
end

function tvRP.getDrawables(part)
	local isprop, index = parse_part(part)
	if isprop then
		return GetNumberOfPedPropDrawableVariations(PlayerPedId(),index)
	else
		return GetNumberOfPedDrawableVariations(PlayerPedId(),index)
	end
end

function tvRP.getDrawableTextures(part,drawable)
	local isprop, index = parse_part(part)
	if isprop then
		return GetNumberOfPedPropTextureVariations(PlayerPedId(),index,drawable)
	else
		return GetNumberOfPedTextureVariations(PlayerPedId(),index,drawable)
	end
end

function tvRP.getCustomization()
	local ped = PlayerPedId()
	local custom = {}
	custom.modelhash = GetEntityModel(ped)

	for i = 0,20 do
		custom[i] = { GetPedDrawableVariation(ped,i),GetPedTextureVariation(ped,i),GetPedPaletteVariation(ped,i) }
	end

	for i = 0,10 do
		custom["p"..i] = { GetPedPropIndex(ped,i),math.max(GetPedPropTextureIndex(ped,i),0) }
	end
	return custom
end

function tvRP.setCustomization(custom)
	local r = async()
	Citizen.CreateThread(function()
		if custom then
			local ped = PlayerPedId()
			local mhash = nil

			if custom.modelhash then
				mhash = custom.modelhash
			elseif custom.model then
				mhash = GetHashKey(custom.model)
			end

			if mhash then
				local i = 0
				while not HasModelLoaded(mhash) and i < 10000 do
					RequestModel(mhash)
					Citizen.Wait(10)
				end

				if HasModelLoaded(mhash) then
					local weapons = tvRP.getWeapons()
					local armour = GetPedArmour(ped)
					local health = tvRP.getHealth()
					SetPlayerModel(PlayerId(),mhash)
					tvRP.setHealth(health)
					tvRP.giveWeapons(weapons,true)
					tvRP.setArmour(armour)
					SetModelAsNoLongerNeeded(mhash)
				end
			end

			ped = PlayerPedId()
			SetPedMaxHealth(ped,200)------- aAQUI

			for k,v in pairs(custom) do
				if k ~= "model" and k ~= "modelhash" then
					local isprop, index = parse_part(k)
					if isprop then
						if v[1] < 0 then
							ClearPedProp(ped,index)
						else
							SetPedPropIndex(ped,index,v[1],v[2],v[3] or 2)
						end
					else
						SetPedComponentVariation(ped,index,v[1],v[2],v[3] or 2)
					end
					TriggerEvent("reloadtattos")
				end
			end
		end
		r()
	end)
	return r:wait()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Agachar
-----------------------------------------------------------------------------------------------------------------------------------------
local agachar = false
Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )
        local ped = PlayerPedId()
        if DoesEntityExist(ped) and not IsEntityDead(ped) then 
            DisableControlAction(0,36,true)  
            if not IsPauseMenuActive() then 
                if IsDisabledControlJustPressed(0,36) then 
                    RequestAnimSet("move_ped_crouched")
                    RequestAnimSet("move_ped_crouched_strafing")
                    if agachar == true then 
                        ResetPedMovementClipset(ped,0.55)
                        ResetPedStrafeClipset(ped)
                        agachar = false 
                    elseif agachar == false then
                        SetPedMovementClipset(ped,"move_ped_crouched",0.55)
                        SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
                        agachar = true 
                    end 
                end
            end 
        end 
    end
end)