---------------------------------------------------------------
---Star Leaks https://discord.gg/xTHKYXN-----------------------
--------------------EXTRA WORLD SUCKS--------------------------

Graffiti              = {}
Graffiti.Res          = GetCurrentResourceName()
Graffiti.Art          = {}
Graffiti.Scaleforms   = {}
Graffiti.RemovalQueue = {}
Graffiti.InsertQueue  = {}

Graffiti.Debug = true
local _scaleforms = {1,5,7,9,11,13}

function Init()
  local textures = {'texture'}
  for i=1,Config.RenderMax,1 do 
    table.insert(textures,string.format('texture_%i',i)) 
  end

  for i=1,#textures,1 do
    local texture = textures[i]

    local sf = RequestScaleformMovie(texture)
    RequestScaleformMovie(sf)

    local start = GetGameTimer()
    while not HasScaleformMovieLoaded(sf) and GetGameTimer() - start < 5000 do 
      RequestScaleformMovie(sf)
      Wait(0)
    end

    Graffiti.Scaleforms[texture] = {
      sf  = sf,
      txd = false
    }
  end
  TriggerServerEvent("Graffiti:Login")
end

Graffiti.Start = function(art)
  for i=1,#art,1 do
    local txd     = CreateRuntimeTxd(art[i].txd)
    local duiObj  = CreateDui(art[i].url,art[i].width,art[i].height)
    local dui     = GetDuiHandle(duiObj)
    local tx      = CreateRuntimeTextureFromDuiHandle(txd,art[i].tx,dui)

    art[i].dui_object = duiObj
    table.insert(Graffiti.Art,art[i])
  end

  Graffiti.Update()
end

Graffiti.Update = function()
  while true do
    Graffiti.CleanQueue()
    Graffiti.AddQueue()
    Graffiti.RenderArt()
    Wait(0)
  end
end

Graffiti.CleanQueue = function()
  if #Graffiti.RemovalQueue > 0 then
    for i=1,#Graffiti.RemovalQueue,1 do
      local k = Graffiti.RemovalQueue[i]
      local v = Graffiti.Art[k]
      DestroyDui(v.dui_object)
      table.remove(Graffiti.Art,k)
    end
    Graffiti.RemovalQueue = {}
  end
end

Graffiti.AddQueue = function()
  if #Graffiti.InsertQueue > 0 then
    for i=1,#Graffiti.InsertQueue,1 do
      local v = Graffiti.InsertQueue[i]
      table.insert(Graffiti.Art,v)
    end
    Graffiti.InsertQueue = {}
  end
end

Graffiti.RenderArt = function()
  local pos = GetEntityCoords(GetPlayerPed(-1))
  local closest = {}
  for k=1,#Graffiti.Art,1 do
    local v = Graffiti.Art[k]
    if v then
      local dist = #(v.position - pos)
      if dist <= Config.RenderDist then
        for i=1,Config.RenderMax,1 do
          if not closest[i] then
            table.insert(closest,{
              dist = dist,
              val  = v
            })
            break
          elseif closest[i].dist > dist then
            if i == Config.RenderMax then
              closest[i] = {
                dist = dist,
                val  = v
              }
            else
              table.insert(closest,i,{
                dist = dist,
                val  = v
              })
            end
            break
          end
        end
      end
    end
  end

  for i=1,Config.RenderMax,1 do
    local v = closest[i]
    if v then
      local artwork = v.val
      local texture = 'texture_'..i
      local scaleform = Graffiti.Scaleforms[texture]
      if not scaleform.txd or scaleform.txd ~= artwork.txd then
        scaleform.txd = artwork.txd

        PushScaleformMovieFunction(scaleform.sf, 'SET_TEXTURE')

        PushScaleformMovieMethodParameterString(artwork.txd)
        PushScaleformMovieMethodParameterString(artwork.tx)

        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(artwork.width)
        PushScaleformMovieFunctionParameterInt(artwork.height)

        PopScaleformMovieFunctionVoid()
      end

      DrawScaleformMovie_3dNonAdditive(scaleform.sf, artwork.position.x,artwork.position.y,artwork.position.z, artwork.rotation.x,artwork.rotation.y,artwork.rotation.z, 2,Config.Scaleforms.Sharpness,2, Config.Scaleforms.Width,Config.Scaleforms.Height,1, 2)
    end
  end
end

function Graffiti.Register(art) 
  local txd     = CreateRuntimeTxd(art.txd)
  local duiObj  = CreateDui(art.url,art.width,art.height)
  local dui     = GetDuiHandle(duiObj)
  local tx      = CreateRuntimeTextureFromDuiHandle(txd,art.tx,dui)

  art.dui_object = duiObj
  table.insert(Graffiti.InsertQueue,art)
end

Graffiti.SelectArtwork = function(allow_overwrite,cb)
  local elements = {}
  for k,v in ipairs(Config.TextureUrls) do
    table.insert(elements,{
      label = v.label,
      value = v,
      type  = "new",
    })
  end 

  if Config.AllowCustomUrl then
    table.insert(elements,{
      label = "Custom Image",
      type  = "custom"
    })
  end

  if allow_overwrite then
    local closest,dist = Graffiti.GetClosest()
    if closest and dist <= 20.0 then
      table.insert(elements,{
        label = "Overwrite Nearest",
        value = closest,
        type  = "overwrite",
      })
    end
  end


      local type = "custom"
      if type == "custom" then
        Graffiti.CreateCustom(cb)
      end

  
end

Graffiti.CreateCustom = function(cb)
  TriggerEvent("Input:Open","URL <span style='font-size:16px'>(E.G: http://imgbb.com/img.png)</span>","ESX",function(url)
    Wait(1000)
    TriggerEvent("Input:Open","Width (Max 500)","ESX",function(width)
      Wait(1000)
      TriggerEvent("Input:Open","Height (Max 500)","ESX",function(height)
        cb({
          url     = url,
          width   = math.max(100,math.min(500,(tonumber(width)   or 250))),
          height  = math.max(100,math.min(500,(tonumber(height)  or 250)))
        })
      end)
    end)
  end)
end

Graffiti.Draw = function(artwork,modifier)
  Graffiti.SelectArtwork(true,function(data,overwrite)
    if not overwrite then
      Graffiti.New(artwork,data,modifier)
    else
      Graffiti.SelectArtwork(false,function(data)
        Graffiti.Overwrite(data,modifier)
      end)
    end
  end)
end

Graffiti.DisableControls = function()
  DisableControlAction(0,14,true)
  DisableControlAction(0,15,true)
  DisableControlAction(0,16,true)
  DisableControlAction(0,17,true)
  DisableControlAction(0,50,true)
  DisableControlAction(0,96,true)
  DisableControlAction(0,97,true)
  DisableControlAction(0,99,true)
  DisableControlAction(0,115,true)
  DisableControlAction(0,180,true)
  DisableControlAction(0,181,true)
  DisableControlAction(0,198,true)
  DisableControlAction(0,241,true)
  DisableControlAction(0,242,true)
  DisableControlAction(0,261,true)
  DisableControlAction(0,262,true)
  DisableControlAction(0,334,true)
  DisableControlAction(0,335,true)
  DisableControlAction(0,336,true)
end

Graffiti.Animate = function(pos)
  Graffiti.Animating = true

  local start = GetGameTimer()
  TaskGoToCoordAnyMeans(GetPlayerPed(-1), pos.x,pos.y,pos.z, 1.0, 0, 0, 786603, 0xbf800000)
  while #(GetEntityCoords(GetPlayerPed(-1)) - pos) > 2.0 and GetGameTimer() - start < 5000 do Wait(0); end

  local ad = 'anim@mp_player_intupperwave'
  local anim = 'idle_a'

  RequestAnimDict(ad)
  while not HasAnimDictLoaded(ad) do Wait(0); end
  ClearPedTasksImmediately(GetPlayerPed(-1))
  Wait(0)

  local ped = GetPlayerPed(-1)
  TaskPlayAnim(ped,ad,anim, 8.0,-8.0, -1,49, 0, true,true,true)

  Graffiti.CreateProp()
  Citizen.CreateThread(Graffiti.ParticleFX)
end

Graffiti.ParticleFX = function()
  local pfx_dict = 'scr_paintnspray'
  local pfx = 'scr_respray_smoke'
  RequestNamedPtfxAsset(pfx_dict)
  while not HasNamedPtfxAssetLoaded(pfx_dict) do Wait(0); end

  SetPtfxAssetNextCall(pfx_dict)
  local phandle = StartNetworkedParticleFxLoopedOnEntity(pfx, Graffiti.Prop, 0.0,0.0,-0.5, 0.0,0.0,0.0, 0.5, 1.0,1.0,1.0)   
  SetParticleFxLoopedColour(phandle, 1.0,0,0,0)      

  local last = GetGameTimer()
  while Graffiti.Animating do     
    local now = GetGameTimer()
    if now - last >= 18000 then
      RemoveParticleFx(phandle)
      SetPtfxAssetNextCall(pfx_dict)
      phandle = StartNetworkedParticleFxLoopedOnEntity(pfx, Graffiti.Prop, 0.0,0.0,-0.5, 0.0,0.0,0.0, 0.5, 1.0,1.0,1.0)  
      SetParticleFxLoopedColour(phandle, 1.0,0,0,0)  
      last = now
    end  
    Wait(0)
  end

  ClearPedTasksImmediately(GetPlayerPed(-1))
  RemoveParticleFx(phandle)
  Graffiti.DeleteProp()
end

Graffiti.CreateProp = function()
  local model = 'prop_cs_spray_can'
  local hash = GetHashKey(model)

  RequestModel(hash)
  while not HasModelLoaded(hash) do Wait(0); end

  local ped = GetPlayerPed(-1)
  local pos = GetEntityCoords(ped)
  local obj = CreateObject(hash,pos.x,pos.y,pos.z,true,true,true)

  AttachEntityToEntity(obj,ped,GetPedBoneIndex(ped,0x49D9),0.07,0.0,0.03, 0.0,90.0,300.0, true,true,false,true,1,true)  

  Graffiti.Prop = obj
end

Graffiti.DeleteProp = function()
  if Graffiti.Prop then
    DetachEntity(Graffiti.Prop)
    Wait(0)

    SetEntityAsMissionEntity(Graffiti.Prop)
    DeleteEntity(Graffiti.Prop)
    Graffiti.Prop = nil
  end
end

Graffiti.GetClosest = function()
  local pos = GetEntityCoords(GetPlayerPed(-1))
  local closest,dist
  for k,v in ipairs(Graffiti.Art) do
    local d = #(v.position - pos)
    if not closest or d < dist then
      closest = v
      dist = d
    end
  end
  return closest,dist
end

Graffiti.Clean = function()
  local closest,dist = Graffiti.GetClosest()
  if closest and dist <= 20.0 then
    TaskStartScenarioInPlace(GetPlayerPed(-1),"WORLD_HUMAN_MAID_CLEAN",-1,false)
    Wait(7000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    TriggerServerEvent("Graffiti:Remove",closest)
    Graffiti.Animating = false
  end
end

function Graffiti.Overwrite(artwork,modifier)
  local closest,dist = Graffiti.GetClosest()
  if closest and dist <= 20.0 then
    artwork.position  = closest.position
    artwork.rotation  = closest.rotation

    Graffiti.Animate(closest.position)

    local start = GetGameTimer()
    local timeout = (Config.Timers.Overwrite * 1000) / modifier
    while GetGameTimer() - start < timeout do
      local mod = GetGameTimer() - start
      local percent = 100 - math.floor(((timeout - mod) / timeout) * 100)
      ShowHelpNotification(percent.."% Complete\n~INPUT_PICKUP~ Cancel")
      if IsControlJustPressed(0,38) then
        return
      end
      Wait(0)
    end

    TriggerServerEvent("Graffiti:Overwrite",artwork,closest)
    Graffiti.Animating = false
  end
end

Graffiti.Removed = function(art)
  for k,v in ipairs(Graffiti.Art) do
    if v.txd == art.txd then
      table.insert(Graffiti.RemovalQueue,k)
      break
    end
  end
end

Graffiti.New = function(artwork,data,modifier)
  artwork.url     = data.url
  artwork.width   = data.width
  artwork.height  = data.height

  local rotation,position = false,false

  local controls  = {
    {
      codes = {14,15},
      text = "Rotation -/+",
    },
    {
      codes = {38},
      text = "Done",
    },
    {
      codes = {47},
      text = "Cancel",
    },
  }
  local ctrl_sf   = Instructional.Create(controls)

  local scaleform = Graffiti.Scaleforms['texture']
  local txd       = CreateRuntimeTxd(artwork.txd)
  local duiObj    = CreateDui(artwork.url, artwork.width, artwork.height)
  local dui       = GetDuiHandle(duiObj)
  local tx        = CreateRuntimeTextureFromDuiHandle(txd, artwork.tx, dui)
  local rot       = vector3(0.0,0.0,GetEntityHeading(GetPlayerPed(-1)))
  PushScaleformMovieFunction(scaleform.sf, 'SET_TEXTURE')

  PushScaleformMovieMethodParameterString(artwork.txd)
  PushScaleformMovieMethodParameterString(artwork.tx)

  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(artwork.width)
  PushScaleformMovieFunctionParameterInt(artwork.height)

  PopScaleformMovieFunctionVoid()

  while true do
    local hit, pos, surfaceNormal, entityHit, entityType, direction = ScreenToWorld()
    Graffiti.DisableControls()
    --ShowHelpNotification("~INPUT_WEAPON_WHEEL_NEXT~/~INPUT_WEAPON_WHEEL_PREV~ Rotate\n~INPUT_PICKUP~ Done\n~INPUT_DETONATE Cancel")

    if IsDisabledControlJustPressed(0,14) then
      rot = vector3(rot.x,rot.y,rot.z+(360.0/100))
    elseif IsDisabledControlJustPressed(0,15) then      
      rot = vector3(rot.x,rot.y,rot.z-(360.0/100))
    end

    if IsControlJustPressed(0,38) then
      if entityHit <= 0 or entityType == 0 then
        rotation = rot
        position = pos
        break
      else
        ShowHelpNotification("Invalid target. Can't paint on entity.")
      end
    elseif IsControlJustPressed(0,47) then
      return
    end
    DrawScaleformMovieFullscreen(ctrl_sf,255,255,255,255,0)
    DrawScaleformMovie_3dNonAdditive(scaleform.sf, pos.x,pos.y,pos.z, rot.x,rot.y,rot.z, 2,Config.Scaleforms.Sharpness,2, Config.Scaleforms.Width,Config.Scaleforms.Height,1, 2)
    Wait(0)
  end

  Wait(1500)
  Graffiti.Animate(position)

  local start = GetGameTimer()
  local timeout = ((data.tag and Config.Timers.Tag or Config.Timers.Piece) * 1000) / modifier
  while GetGameTimer() - start < timeout do
    local mod = GetGameTimer() - start
    local percent = 100 - math.floor(((timeout - mod) / timeout) * 100)
    ShowHelpNotification(percent.."% Complete\n~INPUT_PICKUP~ Cancel")

    if IsControlJustPressed(0,38) then

      Graffiti.Animating = false
      DestroyDui(duiObj)
      ClearPedTasksImmediately(GetPlayerPed(-1))
      return
    end

    DrawScaleformMovie_3dNonAdditive(scaleform.sf, position.x,position.y,position.z, rotation.x,rotation.y,rotation.z, 2,Config.Scaleforms.Sharpness,2, Config.Scaleforms.Width,Config.Scaleforms.Height,1, 2)
    Wait(0)
  end

  Graffiti.Animating = false
  DestroyDui(duiObj)

  artwork.position  = position
  artwork.rotation  = rotation

  ClearPedTasksImmediately(GetPlayerPed(-1))

  TriggerServerEvent("Graffiti:Created",artwork)
end

RegisterNetEvent("Graffiti:Start")
AddEventHandler("Graffiti:Start",Graffiti.Start)

RegisterNetEvent("Graffiti:Clean")
AddEventHandler("Graffiti:Clean",Graffiti.Clean)

RegisterNetEvent("Graffiti:Removed")
AddEventHandler("Graffiti:Removed",Graffiti.Removed)

RegisterNetEvent("Graffiti:Register")
AddEventHandler("Graffiti:Register",Graffiti.Register)

RegisterNetEvent("Graffiti:Draw")
AddEventHandler("Graffiti:Draw",Graffiti.Draw)


Citizen.CreateThread(function()
  Init()
end)

  RegisterCommand('trancar2',function(res)

  if res == Graffiti.Res then
    for k,v in pairs(Graffiti.Scaleforms) do
      SetScaleformAsNoLongerNeeded(v.sf)
    end
  end
end)
-- [[!-!]] VENDE NÃO SERGIN. MACACO BURRO [[!-!]] --