-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

local MFP = MF_Purge

function MFP:Awake(...)
  while not ESX do Citizen.Wait(0); end
  while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
  RequestStreamedTextureDict("commonmenu",true)
  ESX.TriggerServerCallback('MF_Purge:GetStartData', function(retVal) self.dS = true; self.cS = retVal; self:Start(); end)
end

function MFP:Start(...)
  while not ESX do Citizen.Wait(0); end
  while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
  if not self.dS or not self.cS then return; end
  ESX.TriggerServerCallback('MF_Purge:GetPurgeState', function(isPurging,enemies,vehicles,loot)
    if isPurging then self:StartPurge(enemies,vehicles,loot); end
    Citizen.CreateThread(function(...) self:Update(...); end)
    Citizen.CreateThread(function(...) self:SpawnThread(...); end)
  end)
end

function MFP:SpawnThread(...)
  while true do
    self:HandleSpawning()
    Wait(self.SpawnThreadTimer * 1000)
  end
end

function MFP:Update(...)
  while true do
    Citizen.Wait(0)
    if self.Purging and self.SpawnedEnemies then
      self:HandleLegion()
      self:DeathCheck()
      for k=1,14,1 do    
        if k~=11 then
          EnableDispatchService(k,false)
        end
      end
    else      
      self:SetTrafficDensity(self.TrafficDensity)
      self:SetPedDensity(self.PedDensity)
    end
    if self.PrePurging or self.Purging then
      self:SetTrafficDensity(0.0)
      self:SetPedDensity(0.0)
    end
  end
end

function MFP:HandleLegion()
  local plyPed = GetPlayerPed(-1)
  local plyPos = GetEntityCoords(plyPed)
  local dist = Utils:GetVecDist(plyPos, self.LegionLocation)
  if dist < self.LegionSpawnDist then
    if self.LegionSpawned then 
      local closest,dist
      for k,v in pairs(self.LegionStashLocs) do
        local cDist = Utils:GetVecDist(v,plyPos)
        if not dist or cDist < dist then
          closest = v
          dist = cDist
        end
      end
      if closest and (self.AmmoLooted and not self.AmmoLooted[closest]) and dist < self.DrawTextDist then
        Utils:DrawText3D(closest.x,closest.y,closest.z+1.0, "Press [~r~E~s~] to loot the ammo crates.")
        if dist and dist < self.InteractDist then
          if Utils:GetKeyPressed('E') then
            self.AmmoLooted[closest] = true
            TriggerServerEvent('MF_Purge:LootAmmoBox',true,closest)
            self:LootAmmo(closest)
          end
        end
      end
    else
      self.LegionSpawned = {}
      for k,val in pairs(self.LegionStashLocs) do
        for k,v in pairs(self.LegionObjLocs) do
          local mName = self.LegionObjects[v]
          local nPos = vector3(plyPos.x,plyPos.y,plyPos.z+50.0)
          local hK = GetHashKey(mName)
          while not HasModelLoaded(hK) do RequestModel(hK); Citizen.Wait(0); end
          local newObj = CreateObject(hK, nPos.x,nPos.y,nPos.z, false, false, false)
          SetEntityHeading(newObj,k.w)
          SetEntityCoords(newObj, val.x + k.x, val.y + k.y, val.z + k.z)
          SetEntityAsMissionEntity(newObj,true)
          while not PlaceObjectOnGroundProperly(newObj) do PlaceObjectOnGroundProperly(newObj); Citizen.Wait(0); end
          SetModelAsNoLongerNeeded(hK)
          table.insert(self.LegionSpawned, newObj)
        end
      end
    end
  end
end

function MFP:LootAmmo(box)
  local doCont = true
  local canLoop = true
  Citizen.CreateThread(function(...) 
    while canLoop do 
      if Utils:GetKeyPressed("BACKSPACE") or GetEntityHealth(GetPlayerPed(-1)) <= 100 then 
        doCont = false
        canLoop = false
        FreezeEntityPosition(GetPlayerPed(-1),false)
        ClearPedTasksImmediately(GetPlayerPed(-1))
        exports['progressBars']:closeUI()
        TriggerServerEvent('MF_Purge:LootAmmoBox',false,box)
      end
      if not doCont then return; end;
      Citizen.Wait(0)
    end 
  end)
  local plyPed = GetPlayerPed(-1)
  local tPos = box
  TaskTurnPedToFaceCoord(plyPed, tPos.x, tPos.y, tPos.z, -1)    
  Wait(3000)
  FreezeEntityPosition(plyPed,true)
  exports['progressBars']:startUI(self.InteractTimer * 1000, "Looting")
  TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, true)
  Wait(self.InteractTimer * 1000)
  canLoop = false
  if doCont then
    FreezeEntityPosition(plyPed,false)
    ClearPedTasksImmediately(plyPed,true)
    TriggerServerEvent('MF_Purge:RewardPlayer')
  end
end


function MFP:HandleSpawning()
  local closestKey,closestPos,closestDist = self:GetClosestSpawn()
  if closestDist and closestDist ~= 0.0 and closestDist < math.random(self.EnemySpawnDist*1.0,self.EnemySpawnDist*2.0) then
    if self.SpawnedEnemies and not self.SpawnedEnemies[closestKey] then
      self:SpawnGroup(closestKey,closestPos)
    end
  end
end

function MFP:SpawnGroup(key)
  ESX.TriggerServerCallback('MF_Purge:CanSpawn',function(can)
    if can then
      spawnGroup = self.EnemyGroups[math.random(1,#self.EnemyGroups)]

      local newGroup = CreateGroup()
      local pedGroup = {}

      for k=1,#spawnGroup.Peds,1 do
        local v = spawnGroup.Peds[k]

        local hk = GetHashKey(v)
        while not HasModelLoaded(hk) do RequestModel(hk); Citizen.Wait(0); end

        local pos = self.EnemyLocs[key]
        local newPed = CreatePed(7,hk,pos.x,pos.y,pos.z,0.0,true,false)
        SetEntityAsMissionEntity(newPed,true,true)
        pedGroup[k] = newPed

        SetPedRelationshipGroupHash(newPed, spawnGroup.Relationship)
        SetPedRelationshipGroupDefaultHash(newPed, spawnGroup.Relationship)

        if k == 1 then 
          SetPedAsGroupLeader(newPed, newGroup)
          TaskWanderStandard(newPed, 10.0, 10)
        else 
          SetPedAsGroupMember(newPed, newGroup)
        end

        local weapon = self.EnemyWeapons[math.random(1,#self.EnemyWeapons)]
        GiveWeaponToPed(newPed, GetHashKey(weapon), 10000, false, true)
        SetCurrentPedWeapon(newPed, GetHashKey(weapon), true)
        SetPedDropsWeaponsWhenDead(newPed,false)

        SetModelAsNoLongerNeeded(hk)
      end

      if self.VehicleLocs[key] and not self.SpawnedVehicles[key] then
        local vehHash = GetHashKey(self.VehicleModels[math.random(1,#self.VehicleModels)])
        while not HasModelLoaded(vehHash) do RequestModel(vehHash); Citizen.Wait(0); end
        local pos = self.VehicleLocs[key]
        local newVeh = CreateVehicle(vehHash, pos.x, pos.y, pos.z, pos.w, true, false)
        SetModelAsNoLongerNeeded(vehHas)
        SetVehicleNumberPlateText(newVeh,"PURG3")
        TriggerServerEvent('MF_Purge:TrackVehicle', key, NetworkGetNetworkIdFromEntity(newVeh))
      end

      SetGroupFormation(newGroup, spawnGroup.Formation)
      SetGroupFormationSpacing(newGroup, spawnGroup.GroupSpacing[1], spawnGroup.GroupSpacing[2], spawnGroup.GroupSpacing[3])
      self:SetAbilities(spawnGroup,pedGroup)
      self:SetOutfit(spawnGroup,pedGroup)
      self:TrackGroup(spawnGroup,pedGroup)
    end
  end,key)  
end

function MFP:TrackGroup(spawnGroup,group)
  Citizen.CreateThread(function(...)
    while true do
      Wait(5000)
      local leader
      for k,v in pairs(group) do
        if not IsEntityDead(v) then
          if k == 1 then leader = v; end
          if not leader and k ~= 1 then
            leader = v
          end
        end
      end
      if not leader then return; end
      local players = ESX.Game.GetPlayersInArea(GetEntityCoords(leader), spawnGroup.EngageDist)
      local closest,dist
      for k,v in pairs(players) do
        local pPed = GetPlayerPed(v)
        if not IsEntityDead(pPed) and GetEntityHealth(pPed) > 99 then
          local cDist = Utils:GetVecDist(GetEntityCoords(pPed), GetEntityCoords(closest))
          if not dist or cDist < dist then
            closest = pPed
            dist = cDist
          end
        end
      end
      if closest then
        for k,v in pairs(group) do
          if not IsPedInCombat(v,closest) then
            if not CanPedInCombatSeeTarget(v,closest) then
              local eC = GetEntityCoords(v)
              local cC = GetEntityCoords(closest)
              local dist = Utils:GetVecDist(eC,cC)
              if dist > 50.0 then
                if dist < 100.0 then
                  TaskGotoEntityAiming(v,closest,40.0,100.0)
                else
                  ClearPedTasksImmediately(v)
                  TaskWanderStandard(leader, 10.0, 10)
                end
              else 
                  TaskCombatPed(v,closest,0,16)
              end
            else
                TaskGotoEntityAiming(v,closest,40.0,100.0)
            end
          else
            if not CanPedInCombatSeeTarget(v,closest) then
              TaskGotoEntityAiming(v,closest,40.0,100.0)
            end
          end
        end
      else
        if not GetIsTaskActive(leader,221) then
          for k,v in pairs(group) do
            ClearPedTasksImmediately(v)
          end
          TaskWanderStandard(leader, 10.0, 10)
        end
      end
      if not self.Purging then
        for k,v in pairs(group) do
          SetEntityHealth(v,0)
        end
      end
    end
  end)
end

function MFP:SetAbilities(spawnGroup,group)
  local abilities = spawnGroup.Abilities
  for k,ped in pairs(group) do
    if k==1 then
      SetEntityMaxHealth(ped, abilities.Health*2)
      SetEntityHealth(ped, abilities.Health*2)
    else
      SetEntityMaxHealth(ped, abilities.Health)
      SetEntityHealth(ped, abilities.Health)
    end
    SetPedCombatMovement(ped, abilities.Movement)
    SetPedCombatRange(ped, abilities.Range)
    SetPedCombatAbility(ped, abilities.Ability)
    SetPedFiringPattern(ped,GetHashKey(abilities.Pattern))
    SetPedAccuracy(ped, abilities.Accuracy)

    for k,v in pairs(abilities.CombatAttributes) do
      SetPedCombatAttributes(ped, k, v)
    end

    for k,v in pairs(abilities.CombatFloats) do
      SetCombatFloat(ped, k, v)    
    end
  end
end

function MFP:SetOutfit(spawnGroup,group)
  for k,ped in pairs(group) do

    local style = self.Styles[spawnGroup.Style]
    local randStyle = math.random(1,#style)

    style = style[randStyle]
    local cols = self.StyleColors[spawnGroup.Style]
    cols = cols[randStyle]

    for k,v in pairs(style) do
      SetPedComponentVariation(ped, k, v, cols[k], 0)
    end
  end
end

function MFP:GetClosestSpawn()
  local plyPos = GetEntityCoords(GetPlayerPed(-1))
  local key,val,dist
  for k,v in pairs(self.EnemyLocs) do
    local curDist = Utils:GetVecDist(v,plyPos)
    if not dist or curDist < dist then
      key = k
      val = v
      dist = curDist
    end
  end
  return key,val,dist
end

function MFP:DeathCheck(...)
  if self.Reviving then return; end
  local plyPed = GetPlayerPed(-1)
  local plyHp = GetEntityHealth(plyPed)
  if plyHp <= 100 and not self.Reviving then
    Citizen.CreateThread(function(...)
      self.Reviving = true
      Wait(30000)
      TriggerEvent('esx_ambulancejob:revive')
      Wait(1000)
      local plyPed = GetPlayerPed(-1)
      local plyPos = GetEntityCoords(plyPed)
      local dist = Utils:GetVecDist(plyPos,self.LegionLocation)
      if dist < 100.0 then
        local spawnPos = self.SpawnLocations[math.random(1,#self.SpawnLocations)]
        SetEntityCoords(plyPed, spawnPos.x,spawnPos.y,spawnPos.y, 0.0,0.0,0.0, false,false,false)
      end
      SetPedArmour(GetPlayerPed(-1),100)
      if self.HealBonesOnRespawn then
        TriggerEvent('MF_SkeletalSystem:HealBones',"all")
      end
      self.Reviving = false    
    end)
  end
end

function MFP:NotifyPurge(...)
  local msgA = "~r~WARNING"
  local msgB = "Server-wide purge event will be active from 6PM tonight!\nAll players will recieve a weapon, and death time will be reduced!"
  self.PrePurging = true
  self:DrawScaleform(msgA,msgB,10)
end

function MFP:StartPurge(enemyLocs,vehLocs,looted)
  self.SpawnedEnemies = enemyLocs
  self.SpawnedVehicles = vehLocs
  self.AmmoLooted = looted
  self.Purging = true

  SetPedArmour(GetPlayerPed(-1),100)
  local msgA = "~r~PURGE"
  local msgB = "The Purge has begun!"
  self:DrawBlips()
  self:DrawScaleform(msgA,msgB,5)
end

function MFP:EndPurge(vehs)
  self.Purging = false
  self.PrePurging = false
  local msgA = "~g~PURGE"
  local msgB = "The Purge is over!"
  self:RemoveBlips()
  for k,v in pairs(vehs) do
    local ent = NetworkGetEntityFromNetworkId(v)
    if DoesEntityExist(ent) then
      SetEntityAsMissionEntity(ent,false,false)
      DeleteVehicle(ent)
    end
  end
  if self.LegionSpawned then
    for k,v in pairs(self.LegionSpawned) do
      DeleteObject(v)
    end
  end
  self:DrawScaleform(msgA,msgB,5)
end

function MFP:DrawScaleform(bigMsg,smallMsg,time)
  Citizen.CreateThread(function(...)  
    local scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do
      Citizen.Wait(0)
    end

    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieMethodParameterString(bigMsg)
    PushScaleformMovieMethodParameterString(smallMsg)
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()

    local timer = GetGameTimer()
    while GetGameTimer() - timer < time * 1000 do
      Citizen.Wait(0)
      DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
  end)
end

MFP.Blips = {}

function MFP:DrawBlips()
  for k,v in pairs(self.EnemyLocs) do
    local newPos = Utils.PointOnSphere(0.0,math.random(0.0,359.0),80.0,v.x,v.y,v.z)
    local blipA = AddBlipForRadius(newPos.x, newPos.y, newPos.z, 100.0)
    SetBlipHighDetail(blipA, true)
    SetBlipColour(blipA, 1)
    SetBlipAlpha (blipA, 80)

    local blipB = AddBlipForCoord(newPos.x, newPos.y, newPos.z)
    SetBlipSprite               (blipB, 84)
    SetBlipDisplay              (blipB, 4)
    SetBlipScale                (blipB, 0.5)
    SetBlipColour               (blipB, 1)
    SetBlipAsShortRange         (blipB, true)
    SetBlipHighDetail           (blipB, true)
    BeginTextCommandSetBlipName ("STRING")
    AddTextComponentString      ("Danger")
    EndTextCommandSetBlipName   (blipB)

    self.Blips[k] = {[1] = blipA,[2] = blipB}
  end
  for k,v in pairs(self.LegionStashLocs) do
    local blipB = AddBlipForCoord(v.x, v.y, v.z)
    SetBlipSprite               (blipB,  478)
    SetBlipDisplay              (blipB, 4)
    SetBlipScale                (blipB, 1.0)
    SetBlipColour               (blipB, 31)
    SetBlipAsShortRange         (blipB, true)
    SetBlipHighDetail           (blipB, true)
    BeginTextCommandSetBlipName ("STRING")
    AddTextComponentString      ("Weapon Crate")
    EndTextCommandSetBlipName   (blipB)

    self.Blips[#self.Blips+1] = {[1] = blipB}    
  end
end

function MFP:RemoveBlips()
  if not self.Blips then return; end
  for k,v in pairs(self.Blips) do
    RemoveBlip(v[1])
    if v[2] then RemoveBlip(v[2]); end
  end
end

function MFP:SetTrafficDensity(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
end

function MFP:SetPedDensity(density)
    SetPedDensityMultiplierThisFrame(density)
    SetScenarioPedDensityMultiplierThisFrame(density, density)
end

RegisterNetEvent('MF_Purge:StartPurge')
AddEventHandler('MF_Purge:StartPurge', function(...) MFP:StartPurge(...); end)

RegisterNetEvent('MF_Purge:SyncSpawn')
AddEventHandler('MF_Purge:SyncSpawn', function(data) MFP.SpawnedEnemies = data; end)

RegisterNetEvent('MF_Purge:SyncVeh')
AddEventHandler('MF_Purge:SyncVeh', function(data) MFP.SpawnedVehicles = data; end)

RegisterNetEvent('MF_Purge:NotifyPurge')
AddEventHandler('MF_Purge:NotifyPurge', function(...) MFP:NotifyPurge(...); end)

RegisterNetEvent('MF_Purge:EndPurge')
AddEventHandler('MF_Purge:EndPurge', function(vehs) MFP:EndPurge(vehs); end)

RegisterNetEvent('MF_Purge:AmmoLooted')
AddEventHandler('MF_Purge:AmmoLooted', function(val,box) if MFP.AmmoLooted and MFP.AmmoLooted[box] then MFP.AmmoLooted[box] = val; end; end)

Citizen.CreateThread(function(...) MFP:Awake(...); end)