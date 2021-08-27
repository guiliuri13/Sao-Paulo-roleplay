function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--AddTextEntry("hiluxpmerj1", "hiluxpmerj1")
end)