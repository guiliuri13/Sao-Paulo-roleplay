RegisterCommand("cr",function(source,args)
	local veh = GetVehiclePedIsIn(PlayerPedId(),false)
	local maxspeed = GetVehicleMaxSpeed(GetEntityModel(veh))
	local vehspeed = GetEntitySpeed(veh)*3.6
	if GetPedInVehicleSeat(veh,-1) == PlayerPedId() and math.ceil(vehspeed) >= 1 then
		if args[1] == nil then
			SetEntityMaxSpeed(veh,maxspeed)
		else
			SetEntityMaxSpeed(veh,0.45*args[1]-0.45)
			TriggerEvent("chatmessage","sucesso","Velocidade máxima travada em <b>"..args[1].." mp/h</b>.")
		end
	end
end)