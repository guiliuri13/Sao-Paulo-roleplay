resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	"cfg/garages.lua"
}

ui_page 'nui/ui.html'

files {
'nui/ui.html',
'nui/css.css',
'nui/jquery.js',
------------------------
}