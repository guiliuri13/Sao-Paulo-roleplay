local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_banco")


local giveCashAnywhere = false 
local withdraWAnywhere = false 
local depositAnywhere = false 
local displayBankBlips = true 
local enableBankingGui = true 

local banks = {
  {name="Banco", id=108, x=150.266, y=-1040.203, z=29.374},
  {name="Banco", id=108, x=-1212.980, y=-330.841, z=37.787},
  {name="Banco", id=108, x=-2962.582, y=482.627, z=15.703},
  {name="Banco", id=108, x=-112.202, y=6469.295, z=31.626},
  {name="Banco", id=108, x=314.187, y=-278.621, z=54.170},
  {name="Banco", id=108, x=-351.534, y=-49.529, z=49.042},
  {name="Banco", id=106, x=241.727, y=220.706, z=106.286, principal = true},
  {name="Banco", id=108, x=1175.06, y=2706.64, z=38.09},
  {name="Banco", id=108, x=119.10, y= -883.70,z = 31.12},
  {name="Banco", id=108, x=-1315.80, y= -834.76,z = 16.96},
  
  {name="Caixa eletronico", id=108, x=285.44, y= 143.38,z= 104.17},
  {name="Caixa eletronico", id=108, x=1138.23, y= -468.89,z= 66.73},
  {name="Caixa eletronico", id=108, x=1077.70, y= -776.54,z= 58.24},
  {name="Caixa eletronico", id=108, x=-710.03, y= -818.90,z= 23.72},
  {name="Caixa eletronico", id=108, x=-821.63, y= -1081.89,z= 11.13},
  {name="Caixa eletronico", id=108, x=-1409.75, y= -100.44,z= 52.38},
  {name="Caixa eletronico", id=108, x=-846.29, y= -341.28,z= 38.68},
  {name="Caixa eletronico", id=108, x=-2072.36, y= -317.29,z= 13.31},
  {name="Caixa eletronico", id=108, x=-526.64, y= -1222.97,z= 18.45},
  {name="Caixa eletronico", id=108, x=-254.41, y = -692.46, z= 33.60},
  {name="Caixa eletronico", id=108, x=419.06, y=-986.34, z=29.38},
  
  {name="Caixa eletronico", id=108, x=33.11, y=-1348.24, z=29.49},
  {name="Caixa eletronico", id=108, x=2558.35, y=389.45, z=108.62},
  {name="Caixa eletronico", id=108, x=1153.74, y=-326.79, z=69.20},
  {name="Caixa eletronico", id=108, x=-717.61, y=-915.81, z=19.21},
  {name="Caixa eletronico", id=108, x=-56.91, y=-1752.17, z=29.42},
  {name="Caixa eletronico", id=108, x=380.91, y=323.44, z=103.556},
  {name="Caixa eletronico", id=108, x=-3240.61, y=1008.63, z=12.83},
  {name="Caixa eletronico", id=108, x=1735.30, y=6410.47, z=35.03},
  {name="Caixa eletronico", id=108, x=540.31, y=2671.05, z=42.15},
  {name="Caixa eletronico", id=108, x=1968.10, y=3743.59, z=32.34},
  {name="Caixa eletronico", id=108, x=2683.09, y=3286.64, z=55.24},
  {name="Caixa eletronico", id=108, x=1702.95, y=4933.51, z=42.06},
  {name="Caixa eletronico", id=108, x=-1827.18, y=784.90, z=138.30},
  {name="Caixa eletronico", id=108, x=-3040.94, y=593.22, z=7.90},
  {name="Caixa eletronico", id=108, x=298.926, y=-588.73, z=43.28},
  {name="Caixa eletronico", id=108, x=129.449, y=-1292.06, z=29.26},
  {name="Caixa eletronico", id=108, x=-31.37, y=-1121.60, z=26.55},
}

Citizen.CreateThread(function()
  if displayBankBlips then
    for k,v in ipairs(banks)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.4)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)

local atBank = false
local bankOpen = false

RegisterNetEvent('send:banco')
AddEventHandler('send:banco', function(banco)
  TransitionToBlurred(1000)
	SetNuiFocus(true, true)
	SendNUIMessage({
    openBank = true,
		banco = banco
	})
end)


function closeGui()
  TransitionFromBlurred(1000)
  SetNuiFocus(false)
  SendNUIMessage({openBank = false})
  bankOpen = false
  atmOpen = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(PlayerPedId(), true)
		for k, j in pairs(banks) do
			if(Vdist(pos.x, pos.y, pos.z, j.x, j.y, j.z) < 150.0) then
				if(Vdist(pos.x, pos.y, pos.z, j.x, j.y, j.z) < 5.0) then
					draw3DText(j.x, j.y, j.z, "Pressione [~g~E~w~] para acessar o "..j.name.."")
				end
			end
		end
	end
end)

if enableBankingGui then
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if(IsNearBank()) then
        atBank = true
        if IsControlJustPressed(1, 51) and not vRP.isHandcuffed()  then 
            if bankOpen then
              closeGui()
              bankOpen = false
            else
              TriggerServerEvent("bank:update")
              TriggerServerEvent("get:banco")
              bankOpen = true
          end
      	end
      else
        if(bankOpen) then
          closeGui()
        end
        atBank = false
        bankOpen = false
      end
    end
  end)
end

Citizen.CreateThread(function()
  while true do
    if bankOpen then
      local ply = PlayerPedId()
      local active = true
      DisableControlAction(0, 1, active) 
      DisableControlAction(0, 2, active) 
      DisableControlAction(0, 24, active) 
      DisablePlayerFiring(ply, true) 
      DisableControlAction(0, 142, active)
      DisableControlAction(0, 106, active) 
    end
    Citizen.Wait(0)
  end
end)

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)

RegisterNUICallback('balance', function(data, cb)
  SendNUIMessage({openSection = "balance"})
  cb('ok')
end)

RegisterNUICallback('multasbalance', function(data, cb)
  SendNUIMessage({openSection = "multasbalance"})
  cb('ok')
end)
RegisterNUICallback('walletbalance', function(data, cb)
  SendNUIMessage({openSection = "walletbalance"})
  cb('ok')
end)

RegisterNUICallback('withdraw', function(data, cb)
  SendNUIMessage({openSection = "withdraw"})
  cb('ok')
end)

RegisterNUICallback('deposit', function(data, cb)
  SendNUIMessage({openSection = "deposit"})
  cb('ok')
end)

RegisterNUICallback('transfer', function(data, cb)
  SendNUIMessage({openSection = "transfer"})
  cb('ok')
end)

RegisterNUICallback('quickCash', function(data, cb)
  TriggerServerEvent('bank:quickCash')
  cb('ok')
end)

RegisterNUICallback('erroMulta', function()
  TriggerEvent('Notify',"negado","Você não tem nenhuma multa para pagar")
end)
RegisterNUICallback('erroMulta2', function()
  TriggerEvent('Notify',"negado","Valor desejado inexistente")
end)

RegisterNUICallback('withdrawSubmit', function(data, cb)
  TriggerEvent('bank:withdraw', data.amount)
  cb('ok')
end)

RegisterNUICallback('depositSubmit', function(data, cb)
  TriggerEvent('bank:deposit', data.amount)
  cb('ok')
end)

RegisterNUICallback('pagarMulta', function(data,cb)
  TriggerEvent('bank:pagarmulta', tonumber(data.amount))
  cb('ok')
end)

RegisterNUICallback('transferSubmit', function(data, cb)
  local toPlayer = data.toPlayer
  local amount = data.amount
  TriggerServerEvent("bank:transfer", toPlayer, tonumber(amount))
end)

function IsNearBank()
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(banks) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if (distance <= 3) then
      return true
    end
  end
end

function IsNearPlayer(player)
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  if (distance <= 5) then
    return true
  end
end

RegisterNetEvent('bank:pagarmulta')
AddEventHandler('bank:pagarmulta', function(amount)
  if(IsNearBank() == true or depositAnywhere == true ) then
    TriggerServerEvent("bank:pagarmulta", tonumber(amount))
  else
    vRP.notifyError("Você só pode pagar multa em um banco!")
  end
end)

RegisterNetEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
  if(IsNearBank() == true or depositAnywhere == true ) then
    TriggerServerEvent("bank:deposit", tonumber(amount))
  else
    vRP.notifyError("Você só pode depositar em um banco!")
  end
end)

RegisterNetEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
  if (IsNearBank() == true or withdraWAnywhere == true) then
    TriggerServerEvent("bank:withdraw", tonumber(amount))
  else
    vRP.notifyError("Você só pode sacar em um banco!")
  end
end)

RegisterNetEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
  if(IsNearPlayer(toPlayer) == true or giveCashAnywhere == true) then
    local player2 = GetPlayerFromServerId(toPlayer)
    local playing = IsPlayerPlaying(player2)
    if (playing ~= false) then
      TriggerServerEvent("bank:givecash", toPlayer, tonumber(amount))
      vRP.notify("Você transferiu " .. tonumber(amount) .. " para " .. toPlayer)
    else
      vRP.notifyWarning("Cidadão fora da cidade!")
    end
  else
    vRP.notifyWarning("Cidadão não mora nessa cidade!")
  end
end)

RegisterNetEvent('banking:updateBalance')
AddEventHandler('banking:updateBalance', function(balance, walletbalance, multasbalance,   identidade)
	SendNUIMessage({
		updateBalance = true,
    balance = balance,
    walletbalance = walletbalance,
    multasbalance = multasbalance,   
    identidade = identidade
    
	})
end)

RegisterNetEvent("banking:addBalance")
AddEventHandler("banking:addBalance", function(amount)
	SendNUIMessage({
		addBalance = true,
		amount = amount
	})
end)

RegisterNetEvent("banking:removeBalance")
AddEventHandler("banking:removeBalance", function(amount)
	SendNUIMessage({
		removeBalance = true,
		amount = amount
	})
end)


function draw3DText(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end