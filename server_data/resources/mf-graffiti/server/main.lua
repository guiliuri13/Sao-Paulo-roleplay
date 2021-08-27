---------------------------------------------------------------
---Star Leaks https://discord.gg/xTHKYXN-----------------------
--------------------EXTRA WORLD SUCKS--------------------------

RegisterCommand('tinta',function(source,rawCommand)
    local modifier = 2 -- divider overall paint time by this number. higher = better "paint"... or however you put it.
    TriggerClientEvent("Graffiti:Draw",source,{
      width   = 800,
      height  = 400,
      txd     = Graffiti.NewUid(),
      tx      = Graffiti.NewUid(),
      url     = "https://i.ibb.co/BN4Gs0k/Png-Item-625994.png"
    },modifier)
  end) 

  RegisterCommand('tirar',function(source,rawCommand)
    TriggerClientEvent("Graffiti:Clean",source)
  end)

Graffiti      = {}
Graffiti.Art  = {}
Graffiti.Uids = {}

function Graffiti.NewUid ()
  for i=1,100000,1 do
    if not Graffiti.Uids[i] then
      Graffiti.Uids[i] = true
      return "random_"..i
    end
  end
end

RegisterServerEvent("Graffiti:Login")
AddEventHandler("Graffiti:Login",function()
  TriggerClientEvent("Graffiti:Start",source,Graffiti.Art)
end)

RegisterServerEvent("Graffiti:Created")
AddEventHandler("Graffiti:Created",function(art)
  art.txd = art.txd .. "_real"
  art.tx  = art.tx  .. "_real"
  table.insert(Graffiti.Art,art)
  TriggerClientEvent("Graffiti:Register",-1,art)
end)

Graffiti.Remove = function(art)  
  for k,v in ipairs(Graffiti.Art) do
    if v.txd == art.txd then
      table.remove(Graffiti.Art,k)
      break
    end
  end
  TriggerClientEvent("Graffiti:Removed",-1,art)
end


RegisterServerEvent("Graffiti:Overwrite")
AddEventHandler("Graffiti:Overwrite",function(artwork,closest)
  Graffiti.Remove(closest)
  artwork.txd = Graffiti.NewUid()
  artwork.tx  = Graffiti.NewUid()
  Wait(500)
  Graffiti.Created(artwork)
end)

---------------------------------------------------------------
---Star Leaks https://discord.gg/xTHKYXN-----------------------
--------------------EXTRA WORLD SUCKS--------------------------
---------------------------------------------------------------
---Star Leaks https://discord.gg/xTHKYXN-----------------------
--------------------EXTRA WORLD SUCKS--------------------------
---------------------------------------------------------------
---Star Leaks https://discord.gg/xTHKYXN-----------------------
--------------------EXTRA WORLD SUCKS--------------------------

-- [[!-!]] VENDE NÃO SERGIN. MACACO BURRO [[!-!]] --