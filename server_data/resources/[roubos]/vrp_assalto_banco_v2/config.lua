
--===============================================================--
--======================== Configurações ========================--
--===============================================================--

Config = {}

Config.PermCops = "Permissão dos policiais" 
Config.MinCops = 0				
Config.mincash = 5000 			
Config.maxcash = 10000 			
Config.black = false 			
Config.enablesound = false 			
Config.cooldown = 3600 		
Config.vaulttime = 300 				

Config.items = {
	thermal = "c4", 
	laptop = "laptop", 
	lockpick = "pendrive",
	id_card = "pendrive",
	diamond = "barradiamante",  -- diamante
	gold = "barraouro", -- ouro
	dirty_money = "dinheirosujo"
}

Config.text = { 
	loudstart = "[~r~E~w~] Iniciar assalto ao banco",
	silentstart = "[~r~E~w~] Iniciar assalto ~g~FURTIVO~w~",
	usecard = "[~r~E~w~] Usar cartão de acesso",
	usethermal = "[~r~E~w~] Usar explosivo C4",
	usehack = "[~r~E~w~] Hackear painel",
	uselockpick = "[~r~E~w~] Usar Lockpick",
	usesearch = "[~r~E~w~] Procurar",
	lootcash= "[~r~E~w~] Roubar dinheiro",
	lootgold = "[~r~E~w~] Roubar ouro",
	lootdia = "[~r~E~w~] Roubar diamante",
	card = "Usando Cartão de acesso",
	thermal = "Plantando C4",
	burning = "Derretendo a fechadura",
	lockpick = "Arrombando a fechadura",
	using = "Processando",
	used = "Processamento completo.",
	stage_complete = "completo.",
	stage = "Estágio",
	search = "Procurando",
	hacking = "Hackeando",
	melted = "Fechadura derretida.",
	hacked = "Hackeamento completo.",
	unlocked = "Porta destrancada.",
	nothing = "Não encontrou nada.",
	found = "Encontrou um cartão de acesso.",
	time = "Restante: ",
	hackconnect = "Abra o My Computer e execute ConectarHackear.exe",
	ip = "Encontre o endereço de IP...",
	password = "Encontre a senha...",
	bruteforce = "Execute ForcaBruta.exe",
	vaulttime = "Você tem "..Config.vaulttime.." segundos antes do gás entrar.",
	vaultclose = "Porta do cofre irá fechar em 60 segundos!",
	vaultclose2 = "PORTA DO COFRE FECHANDO!",
	stole = "Você roubou",
	alarm = "Os alarmes do Banco Central foram ativados!",
	unlockdoor = "[~r~E~w~] Destrancar a porta",
	lockdoor = "[~r~E~w~] Trancar a porta",
	nolaptop = "Você não tem um laptop para hackear.",
	noidcard = "Você não tem um cartão de acesso.",
	nothermal = "Você não tem um explosivo Thermal.",
	nolockpick = "Você não tem lockpick.",
	mincops = "É necessário ao menos "..Config.MinCops.." policiais na cidade.",
	timeleft = "restante até o próximo roubo.",
	alreadyrobbed = "O Banco já está sendo roubado.",
	syshack = "Hackeando sistema..."
}