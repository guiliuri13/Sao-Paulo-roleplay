--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

vRPd = {}

Tunnel.bindInterface("vrp_inventario",vRPd)
Proxy.addInterface("vrp_inventario",vRPd)

-- SCREEN

-- play a screen effect
-- name, see https://wiki.fivem.net/wiki/Screen_Effects
-- duration: in seconds, if -1, will play until stopScreenEffect is called
function vRPd.playScreenEffect(name, duration)
  if duration < 0 then -- loop
    StartScreenEffect(name, 0, true)
  else
    StartScreenEffect(name, 0, true)

    Citizen.CreateThread(function() -- force stop the screen effect after duration+1 seconds
      Citizen.Wait(math.floor((duration+1)*1000))
      StopScreenEffect(name)
    end)
  end
end

-- stop a screen effect
-- name, see https://wiki.fivem.net/wiki/Screen_Effects
function vRPd.stopScreenEffect(name)
  StopScreenEffect(name)
end

-- MOVEMENT CLIPSET
function vRPd.playMovement(clipset,blur,drunk,fade,clear)
  --request anim
  RequestAnimSet(clipset)
  while not HasAnimSetLoaded(clipset) do
    Citizen.Wait(0)
  end
  -- fade out
  if fade then
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
  end
  -- clear tasks
  if clear then
    ClearPedTasksImmediately(PlayerPedId())
  end
  -- set timecycle
  SetTimecycleModifier("spectator5")
  -- set blur
  if blur then 
    SetPedMotionBlur(PlayerPedId(), true) 
  end
  -- set movement
  SetPedMovementClipset(PlayerPedId(), clipset, true)
  -- set drunk
  if drunk then
    SetPedIsDrunk(PlayerPedId(), true)
  end
  -- fade in
  if fade then
    DoScreenFadeIn(1000)
  end
  
end

function vRPd.resetMovement(fade)
  -- fade
  if fade then
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
  end
  -- reset all
  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(PlayerPedId(), 0)
  SetPedIsDrunk(PlayerPedId(), false)
  SetPedMotionBlur(PlayerPedId(), false)
end
