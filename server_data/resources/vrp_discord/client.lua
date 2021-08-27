------------------------CREDITS------------------------
--------- Script made by Vlad, DevStudios Owner -------
--      Script made for StreamForce Romania RP       --
--          Site: https://devstudios.store           --
--        Forum: http://forum.devstudios.store       --
--   Copyright 2019 ©DevStudios. All rights served   --
-------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("vRP:Discord")
		Citizen.Wait(10000000000000000)
	end
end)
-------------------------- https://discordapp.com/developers/applications/ -----------------------------------

RegisterNetEvent('vRP:Discord-rich')
AddEventHandler('vRP:Discord-rich', function(user_id, faction, name)
SetDiscordAppId(767151974944604190)-- Discord app ID
SetDiscordRichPresenceAsset('logo') -- PNG file
SetDiscordRichPresenceAssetText('logo') -- PNG text desc
SetDiscordRichPresenceAssetSmall('logo') -- PNG small
SetDiscordRichPresenceAssetSmallText('logo') -- PNG text desc2
SetRichPresence("[ID:"..user_id.."] "..name.. " | "..GetNumberOfPlayers().."/32")
end)
