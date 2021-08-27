-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

RegisterNetEvent('MF_Purge:SpawnGroup')
RegisterNetEvent('MF_Purge:TrackVehicle')
RegisterNetEvent('MF_Purge:LootAmmoBox')
RegisterNetEvent('MF_Purge:RewardPlayer')

local MFP = MF_Purge

function MFP:StartPurge(...)
  Citizen.CreateThread(function(...) 
    TriggerClientEvent('MF_Purge:NotifyPurge',-1)

    self.CanCont = false
    while not self.CanCont do
      TriggerEvent('vSync:GetTime', function(hour,min) if tonumber(hour) == 17 and tonumber(min) > 50 then self.CanCont = true; end; end)
      Wait(1000)
    end

    self.SpawnedEnemies = {}
    self.SpawnedVehicles = {}
    self.TrackedVehicles = {}
    for k=1,#self.EnemyLocs,1 do
      self.SpawnedEnemies[k] = false
    end
    for k=1,#self.VehicleLocs,1 do
      self.SpawnedVehicles[k] = false
    end

    TriggerEvent('InteractSound_SV:PlayOnAll','purge',0.5)
    Wait(65000)

    local players = ESX.GetPlayers()
    self.PlyWeapons = {}
    for k,v in pairs(players) do
      local xPlayer = ESX.GetPlayerFromId(v)
      while not xPlayer or not self.cS do xPlayer = ESX.GetPlayerFromId(v); Citizen.Wait(0); end
      local key = math.random(1,#self.PurgeWeapons)
      local ammoCount = math.random(self.MinPurgeAmmo,self.MaxPurgeAmmo)
      xPlayer.addWeapon(self.PurgeWeapons[key],ammoCount)
      self.PlyWeapons[v] = self.PurgeWeapons[key]
    end

    self.AmmoLooted = {}
    for k,v in pairs(self.LegionStashLocs) do
      self.AmmoLooted[v] = false
    end
    TriggerEvent('vSync:ChangeWeather',"HALLOWEEN",true)
    TriggerClientEvent('MF_Purge:StartPurge',-1,self.SpawnedEnemies,self.SpawnedVehicles,self.AmmoLooted)
    self.Purging = true

    self.DoCont = false
    while not self.DoCont do
      TriggerEvent('vSync:GetTime', function(hour,min) if tonumber(hour) == 7 and tonumber(min) > 50 then self.DoCont = true; end; end)
      Wait(1000)
    end

    TriggerClientEvent('MF_Purge:EndPurge',-1,self.TrackedVehicles)
    TriggerEvent('vSync:ChangeWeather',"CLEAR",false) 
    self.Purging = false

    for k,v in pairs(self.PlyWeapons) do
      local tick = 0
      local xPlayer = ESX.GetPlayerFromId(k)
      while not xPlayer and tick < 100 do 
        tick = tick + 1
        xPlayer = ESX.GetPlayerFromId(k)
        Citizen.Wait(0)
      end   
      if xPlayer then xPlayer.removeWeapon(v,1000); end
    end
  end)  
end

--[[function MFP:Awake(...)
  while not ESX do Citizen.Wait(0); end
  while not rT() do Citizen.Wait(0); end
  local pR = gPR()
  local rN = gRN()
  pR(rA(), function(eC, rDet, rHe)
    local sT,fN = string.find(tostring(rDet),rFAA())
    local sTB,fNB = string.find(tostring(rDet),rFAB())
    if not sT or not sTB then return; end
    con = string.sub(tostring(rDet),fN+1,sTB-1)
  end) while not con do Citizen.Wait(0); end
  coST = con
  pR(gPB()..gRT(), function(eC, rDe, rHe)
    local rsA = rT().sH
    local rsC = rT().eH
    local rsB = rN()
    local sT,fN = string.find(tostring(rDe),rsA..rsB)
    local sTB,fNB = string.find(tostring(rDe),rsC..rsB,fN)
    local sTC,fNC = string.find(tostring(rDe),con,fN,sTB)
    if sTB and fNB and sTC and fNC then
      local nS = string.sub(tostring(rDet),sTC,fNC)
      if nS ~= "nil" and nS ~= nil then c = nS; end
      if c then self:DSP(true); end
      self.dS = true
      print("MF_Purge: Started")
      self:sT()
    else self:ErrorLog(eM()..uA()..' ['..con..']')
    end
  end)
end]]--

--No IP check ;)
function MFP:Awake(...)
  while not ESX do Citizen.Wait(0); end
      self:DSP(true)
      self.dS = true
	  print("MF_Purge: Started")
      self:sT()
end

function MFP:ErrorLog(msg) print(msg) end
function MFP:DoLogin(src) local eP = GetPlayerEndpoint(source) if eP ~= coST or (eP == lH() or tostring(eP) == lH()) then self:DSP(false); end; end
function MFP:DSP(val) self.cS = val; end
function MFP:sT(...) if self.dS and self.cS then self.wDS = 1; end; end

function MFP:PlayerDropped(source)
  if self.Purging then
  local gameLicense,steamId,discordId,ip = self:GetIdentifiers(source)
  local found
  local data = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier=@identifier',{['@identifier'] = steamId})
  if not data or not data[1] then return; end

  local found = false
  local wepData = json.decode(data[1].loadout)
  for k,v in pairs(wepData) do
    if v.name == self.PlyWeapons[source] then
      found = k
    end
  end
  if not found then return; end
    table.remove(wepData,found)
    MySQL.Async.execute('UPDATE users SET loadout=@loadout WHERE identifier=@identifier',{['@identifier'] = steamId, ['@loadout'] = json.encode(wepData)})
  end
end

function MFP:GetIdentifiers(id)
    if not id then return false; end
    id = tonumber(id)
    local gameLicense,steamId,discordId,ip
    local identifiers = GetPlayerIdentifiers(id)
    for k,v in pairs(identifiers) do 
        if string.find(v,'license') then gameLicense = v; end
        if string.find(v,'steam') then steamId = v; end
        if string.find(v,'discord') then discordId = v; end
        if string.find(v,'ip') then ip = v; end
    end
    return gameLicense,steamId,discordId,ip
end

function MFP:SpawnGroup(key)
  self.SpawnedEnemies[key] = true
  TriggerClientEvent('MF_Purge:SyncSpawn',-1,self.SpawnedEnemies)
end

function MFP:CanSpawn(key)
  if self.SpawnedEnemies and self.SpawnedEnemies[key] then 
    return false 
  else 
    self.SpawnedEnemies = self.SpawnedEnemies or {}
    self.SpawnedEnemies[key] = true 
    --TriggerClientEvent('MF_Purge:SyncSpawn',-1,self.SpawnedEnemies)
    return true
  end
  --self.SpawnedEnemies[key] = true
end

function MFP:TrackVehicle(key,netId)
  self.SpawnedVehicles[key] = true
  self.TrackedVehicles[#self.TrackedVehicles+1] = netId
  TriggerClientEvent('MF_Purge:SyncVeh',-1,self.SpawnedVehicles)
end

function MFP:DoLoot(val,box)
  Citizen.CreateThread(function(...)
    while true do
      Wait((self.LootRespawnTimer * 60) * 1000)
      TriggerClientEvent('MF_Purge:AmmoLooted',-1,val,box)
    end
  end)
end

function MFP:RewardPlayer(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  local curWep = self.PlyWeapons[source]
  local randWep = math.random(1,#self.CrateWeapons)
  if curWep ~= self.CrateWeapons[randWep] then
    xPlayer.addWeapon(self.CrateWeapons[randWep],math.random(self.MinBoxAmmo,self.MaxBoxAmmo))
  else
    local adder = 0
    if randWep > 2 then adder = -1
    else adder = 1
    end
    xPlayer.addWeapon(self.CrateWeapons[randWep+adder],math.random(self.MinBoxAmmo,self.MaxBoxAmmo))
  end
end

function MFP:GetPurgeState()
  if self.Purging then
    return self.Purging,self.SpawnedEnemies,self.SpawnedVehicles,self.AmmoLooted
  else
    return false
  end
end

AddEventHandler('playerDropped', function(...) MFP:PlayerDropped(source); end)
AddEventHandler('playerConnected', function(...) MFP:DoLogin(source); end)
AddEventHandler('MF_Purge:SpawnGroup', function(key) MFP:SpawnGroup(key); end)
AddEventHandler('MF_Purge:TrackVehicle', function(key,netId) MFP:TrackVehicle(key,netId); end)
AddEventHandler('MF_Purge:LootAmmoBox', function(val,box) TriggerClientEvent('MF_Purge:AmmoLooted',-1,val,box); if val then MFP:DoLoot(false,box); end; end)
AddEventHandler('MF_Purge:RewardPlayer', function(...) MFP:RewardPlayer(source); end)

ESX.RegisterServerCallback('MF_Purge:GetStartData', function(source,cb) while not MFP.dS do Citizen.Wait(0); end; cb(MFP.cS); end)
ESX.RegisterServerCallback('MF_Purge:GetPurgeState', function(source,cb) cb(MFP:GetPurgeState()); end)
ESX.RegisterServerCallback('MF_Purge:CanSpawn', function(source,cb,group) cb(MFP:CanSpawn(group)) end)

TriggerEvent("es:addGroupCommand",'purge', "admin", function(...) MFP:StartPurge(...); end)

Citizen.CreateThread(function(...) MFP:Awake(...); end)