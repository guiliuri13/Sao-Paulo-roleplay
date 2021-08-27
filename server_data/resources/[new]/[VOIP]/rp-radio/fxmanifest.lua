fx_version "adamant"
game "gta5"

name "rp-radio"
description "An in-game radio which makes use of the mumble-voip radio API for FiveM"
author "Frazzle (frazzle9999@gmail.com)"
version "2.0"

ui_page "index.html"

dependencies {
	"mumble-voip",
}

files {
	"index.html",
	"on.ogg",
	"off.ogg",
}

client_scripts {
	"config.lua",
	"@vrp/lib/utils.lua",
	"client.lua",
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua",
}