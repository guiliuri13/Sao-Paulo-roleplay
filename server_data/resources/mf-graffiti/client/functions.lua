---------------------------------------------------------------
---Star Leaks https://discord.gg/xTHKYXN-----------------------
--------------------EXTRA WORLD SUCKS--------------------------

function ShowNotification(msg)
  SetNotificationTextEntry('STRING')
  AddTextComponentSubstringPlayerName(msg)
  DrawNotification(false, true)
end

function ShowHelpNotification(msg)
  BeginTextCommandDisplayHelp("STRING");  
  AddTextComponentSubstringPlayerName(msg);  
  EndTextCommandDisplayHelp(0, 0, 1, -1);  
end

ScreenToWorld = function()
  local camRot = GetGameplayCamRot(0)
  local camPos = GetGameplayCamCoord()
  local width,height = GetActiveScreenResolution()
  local cursor = vector2(0.5,0.5)
  local cam3DPos, forwardDir = ScreenRelToWorld(camPos, camRot, cursor)
  local direction = camPos + forwardDir * 50.0
  local rayHandle = StartShapeTestRay(cam3DPos.x,cam3DPos.y,cam3DPos.z, direction.x,direction.y,direction.z, -1, GetPlayerPed(-1), 0)
  local _, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
  if entityHit >= 1 then
      entityType = GetEntityType(entityHit)
  end
  return hit, endCoords, surfaceNormal, entityHit, entityType, direction
end
 
ScreenRelToWorld = function(camPos, camRot, cursor)
  local camForward = RotationToDirection(camRot)
  local rotUp = vector3(camRot.x + 1.0, camRot.y, camRot.z)
  local rotDown = vector3(camRot.x - 1.0, camRot.y, camRot.z)
  local rotLeft = vector3(camRot.x, camRot.y, camRot.z - 1.0)
  local rotRight = vector3(camRot.x, camRot.y, camRot.z + 1.0)
  local camRight = RotationToDirection(rotRight) - RotationToDirection(rotLeft)
  local camUp = RotationToDirection(rotUp) - RotationToDirection(rotDown)
  local rollRad = -(camRot.y * math.pi / 180.0)
  local camRightRoll = camRight * math.cos(rollRad) - camUp * math.sin(rollRad)
  local camUpRoll = camRight * math.sin(rollRad) + camUp * math.cos(rollRad)
  local point3DZero = camPos + camForward * 1.0
  local point3D = point3DZero + camRightRoll + camUpRoll
  local point2D = World3DToScreen2D(point3D)
  local point2DZero = World3DToScreen2D(point3DZero)
  local scaleX = (cursor.x - point2DZero.x) / (point2D.x - point2DZero.x)
  local scaleY = (cursor.y - point2DZero.y) / (point2D.y - point2DZero.y)
  local point3Dret = point3DZero + camRightRoll * scaleX + camUpRoll * scaleY
  local forwardDir = camForward + camRightRoll * scaleX + camUpRoll * scaleY
  return point3Dret, forwardDir
end
 
RotationToDirection = function(rotation)
  local x = rotation.x * math.pi / 180.0
  local z = rotation.z * math.pi / 180.0
  local num = math.abs(math.cos(x))
  return vector3((-math.sin(z) * num), (math.cos(z) * num), math.sin(x))
end
 
World3DToScreen2D = function(pos)
  local _, sX, sY = GetScreenCoordFromWorldCoord(pos.x, pos.y, pos.z)
  return vector2(sX, sY)
end
-- [[!-!]] VENDE NÃO SERGIN. MACACO BURRO [[!-!]] --