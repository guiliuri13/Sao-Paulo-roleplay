function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('B71679EZ', 'pcdenarc')
  AddTextEntry('B71679EZ', 'pcdenarc')
end)
