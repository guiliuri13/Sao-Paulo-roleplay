resource_manifest_version '44febabe-d386-4res-coba-re627f4af937'

dependency 'vrp'

client_scripts {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"@vrp/lib/utils.lua",
	"client/client.lua"
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server/server.lua'
}

ui_page("html/index.html")

files {
    "html/index.html",
    "html/adminescobar.js",
    "html/styles.css",
	"html/sweetalert2.all.min.js",
}