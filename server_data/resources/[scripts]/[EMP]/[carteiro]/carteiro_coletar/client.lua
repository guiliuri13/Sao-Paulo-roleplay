local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("carteiro_coletar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not processo then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 78.907485961914,111.8491897583,81.168182373047,true) <= 30.0 then
            DrawMarker(23,78.907485961914,111.8491897583,81.168182373047-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,20,0,0,0,0)
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 78.907485961914,111.8491897583,81.168182373047,true) <= 1.2 and not processo then
				drawTxt("PRESSIONE ~r~[E]~w~ PARA EMPACOTAR ENCOMENDA",4,0.094,0.914,0.42,255,255,255,150)
				if IsControlJustPressed(0,38) then
					if func.checkPayment() then
						processo = true
						TriggerEvent('cancelando',true)
						FreezeEntityPosition(PlayerPedId(),true)
						TriggerEvent("progress",8000,"empacotando")
						SetTimeout(8000,function()
							processo = false
							TriggerEvent('cancelando',false)
							FreezeEntityPosition(PlayerPedId(),false)
							end)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextCentre(1)
	SetTextEntry("STRING")
	SetTextDropShadow(0, 0, 0, 0, 200)
    SetTextDropShadow()
	AddTextComponentString(text)
	DrawText(x,y)
end