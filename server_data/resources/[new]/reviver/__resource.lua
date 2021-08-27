dependency "vrp"


ui_page 'html/ui.html'


client_scripts{ 
  "@vrp/lib/utils.lua",
  "funcoes.lua",
  "client.lua",
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}



files {
	"som/index.html",
	"som/files/som.ogg",
	  "lk_config.lua",
	"som/files/heartbeat.ogg",
    'html/ui.html',
    'html/style.css',
    'html/script.js',
    'html/font/gta2.ttf',
    'html/font/gta-fonte.ttf',
'html/images/Img/27.jpg',
'html/images/Img/21.jpg',
'html/css/bootstrap.css',
'html/css/bootstrap.css.map',
'html/css/bootstrap.min.css',
'html/css/bootstrap.min.css.map',
'html/css/bootstrap-grid.css',
'html/css/bootstrap-grid.css.map',
'html/css/bootstrap-grid.min.css',
'html/css/bootstrap-grid.min.css.map',
'html/css/bootstrap-reboot.css',
'html/css/bootstrap-reboot.css.map',
'html/css/bootstrap-reboot.min.css',
'html/css/bootstrap-reboot.min.css.map',
'html/css/main.css',
'html/css/util.css',
'html/js/bootstrap.bundle.js.map',
'html/js/bootstrap.bundle.min.js',
'html/js/bootstrap.bundle.min.js.map',
'html/js/bootstrap.js',
'html/js/bootstrap.js.map',
'html/js/bootstrap.min.js',
'html/js/bootstrap.min.js.map',
'html/js/main.js',
}

