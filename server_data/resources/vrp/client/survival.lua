function tvRP.varyHealth(variation)
	local ped = GetPlayerPed(-1)
	local n = math.floor(GetEntityHealth(ped)+variation)
	SetEntityHealth(ped,n)
end

function tvRP.getHealth()
	return GetEntityHealth(GetPlayerPed(-1))
end

function tvRP.setHealth(health)
	local n = math.floor(health)
	SetEntityHealth(GetPlayerPed(-1),n)
end

function tvRP.setFriendlyFire(flag)
	NetworkSetFriendlyFireOption(flag)
	SetCanAttackFriendly(GetPlayerPed(-1),flag,flag)
end

local in_coma = false
local coma_left = 800

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = GetPlayerPed(-1)
		local health = GetEntityHealth(ped)
		if health <= 100 and coma_left > 0 then
			if not in_coma then
				local x,y,z = tvRP.getPosition()
				if IsEntityDead(ped) then
					NetworkResurrectLocalPlayer(x,y,z,true,true,false)
				end
				in_coma = true
				tvRP.ejectVehicle()
				SetEntityHealth(ped,100)
				vRPserver._updateHealth(100)
				PlaySoundFrontend(-1, "Bed", "WastedSounds", false)
				SetEntityInvincible(ped,true)
			else
				if health < 100 then
					SetEntityHealth(ped,100)
				end
			end
		else
			if in_coma then
				in_coma = false
				SetEntityInvincible(ped,false)

				if coma_left <= 0 then
					SetEntityHealth(ped,0)
				end

				SetTimeout(5000,function()
					coma_left = 800
				end)
			end
		end
	end
end)

function tvRP.isInComa()
	return in_coma
end

function tvRP.killComa()
	if in_coma then
		coma_left = 0
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if in_coma then
			coma_left = coma_left - 1
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		SetPlayerHealthRechargeMultiplier(PlayerId(),0)
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if in_coma then
			if not IsEntityPlayingAnim(GetPlayerPed(-1),"mini@cpr@char_b@cpr_def","cpr_intro",3) then
				tvRP.DeletarObjeto()
				tvRP.playAnim(false,{{"mini@cpr@char_b@cpr_def","cpr_intro",1}},true)
			end
			local ui = GetMinimapAnchor()
			drawTxt(ui.right_x+0.221,ui.bottom_y-0.100,1.0,1.0,0.50,"VOCE TEM ~r~"..coma_left.." ~w~SEGUNDOS DE VIDA, CHAME OS PARAMEDICOS",255,255,255,255)
			DisableControlAction(0,21,true)
			DisableControlAction(0,23,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,75,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,32,true)
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true)
			DisableControlAction(0,271,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,177,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,182,true)
			--DisableControlAction(0,38,true)
			DisableControlAction(0,168,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
			
		else
			local health = GetEntityHealth(GetPlayerPed(-1))
			if health <= 150 and not IsPlayerClimbing(GetPlayerPed(-1)) then
				RequestAnimSet("move_injured_generic")
				while not HasAnimSetLoaded("move_injured_generic") do
					Citizen.Wait(0)
				end
				SetPedMovementClipset(GetPlayerPed(-1), "move_injured_generic", 1 )
				DisableControlAction(0,22,true) -- disable spacebar
				DisableControlAction(0,22,true) -- disable shift
				textoManagement("Você está ~r~mancando~w~, se ~g~cure~w~.")
			end
		end
	end
end)

function drawTxt(x,y,width,height,scale,text,r,g,b,a)
	SetTextFont(4)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextEdge(2,0,0,0,255)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

offset = {x = 0.160, y = 0.905}
scale = 0.40
function textoManagement(text)
  SetTextProportional(1)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour(255, 255, 255, 155)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(offset.x, offset.y)
end

function GetMinimapAnchor()
	local safezone = GetSafeZoneSize()
	local safezone_x = 1.0 / 20.0
	local safezone_y = 1.0 / 20.0
	local aspect_ratio = GetAspectRatio(0)
	local res_x, res_y = GetActiveScreenResolution()
	local xscale = 1.0 / res_x
	local yscale = 1.0 / res_y
	local Minimap = {}
	Minimap.width = xscale * (res_x / (4 * aspect_ratio))
	Minimap.height = yscale * (res_y / 5.674)
	Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
	Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
	Minimap.right_x = Minimap.left_x + Minimap.width
	Minimap.top_y = Minimap.bottom_y - Minimap.height
	Minimap.x = Minimap.left_x
	Minimap.y = Minimap.top_y
	Minimap.xunit = xscale
	Minimap.yunit = yscale
	return Minimap
end