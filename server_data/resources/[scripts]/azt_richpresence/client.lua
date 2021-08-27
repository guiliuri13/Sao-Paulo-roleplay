
--[[----------------------------------------------------------------------]]--
--[[  Licença: r9331098b0b9527852140fc9a4e1fea3							  ]]--
--[[  Discord: AZTËC™#0001                                                ]]--
--[[  Discord: discord.me/aztecde                                         ]]--
--[[  Youtube: https://www.youtube.com/channel/UC8jGkFhiXnbWWBbr90z596Q   ]]--
--[[----------------------------------------------------------------------]]--

			-- DISCORD: https://discordapp.com/developers

local appID = 761674552581292042					-- # appID do bot do ds
local imgLogo = {'logotipo96'} 	-- # Nome das imagem
local textLogo = 'Beta'				-- # Texto da imagem
local textIcon = 'Beta'		-- # Texto do Icone
local maxPlayers = 64								-- # Total de Players

Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(appID)
        SetDiscordRichPresenceAsset(imgLogo[1])
        SetDiscordRichPresenceAssetText(textLogo)
        SetDiscordRichPresenceAssetSmall(imgLogo[2])
        SetDiscordRichPresenceAssetSmallText(textIcon)
        Citizen.Wait(60000)
    end
end)

Citizen.CreateThread(function()
    while true do
        players = {}
        for i = 0,256 do
            if NetworkIsPlayerActive(i) then
                table.insert(players,i)
            end
        end
        SetRichPresence(GetPlayerName(PlayerId()).." - "..#players .. "/"..maxPlayers)
        Citizen.Wait(60000)
    end
end)