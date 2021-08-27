
--==============================================================--
--======================= Configurations =======================--
--==============================================================--

Config = {}

Config.PermCops = "police.heist"	-- Cops permission
Config.MinCops = 0					-- Amount of cops required to start heist
Config.mincash = 5000 				-- Minimum amount of cash a pile holds
Config.maxcash = 10000 				-- Maximum amount of cash a pile can hold
Config.black = false 				-- Enable this if you want blackmoney as a reward
Config.enablesound = true 			-- Enables bank alarm sound
Config.cooldown = 1800 				-- Amount of time to do the heist again in seconds (30min)
Config.vaulttime = 120				-- Amount of time to vault door close

Config.items = {
	thermal = "thermal_charge",
	laptop = "laptop_h",
	lockpick = "lockpick",
	id_card = "id_card",
	diamond = "dia_box",
	gold = "gold_bar",
	dirty_money = "dirty_money"
}

Config.text = { -- 
	loudstart = "[~r~E~w~] Start ~g~LOUD~w~ bank heist",
	silentstart = "[~r~E~w~] Start ~g~SILENT~w~ bank heist",
	usecard = "[~r~E~w~] Use ID Card",
	usethermal = "[~r~E~w~] Use Thermal Charge",
	usehack = "[~r~E~w~] Hack Security Panel",
	uselockpick = "[~r~E~w~] Use Lockpick",
	usesearch = "[~r~E~w~] Search",
	lootcash= "[~r~E~w~] Loot the money cart",
	lootgold = "[~r~E~w~] Loot the gold cart",
	lootdia = "[~r~E~w~] Loot the diamond cart",
	card = "Using ID Card",
	thermal = "Planting Thermal Charge",
	burning = "Melting The Lock",
	lockpick = "Picking The Lock",
	using = "Panel Processing",
	used = "Process complete.",
	stage_complete = "completed.",
	stage = "Stage",
	search = "Searching",
	hacking = "Hacking",
	melted = "Door lock melted.",
	hacked = "Hack completed.",
	unlocked = "Door unlocked.",
	nothing = "Found nothing.",
	found = "You found the ID Card.",
	time = "Remaining: ",
	hackconnect = "Open My Computer and navigate to HackConnect.exe",
	ip = "Find the IP adress...",
	password = "Find the password...",
	bruteforce = "Run BruteForce.exe",
	vaulttime = "You have "..Config.vaulttime.." seconds until toxic gas comes in.",
	vaultclose = "Vault door will close automatically in 60 seconds!",
	vaultclose2 = "VAULT DOOR CLOSING!",
	stole = "You stole",
	alarm = "Pacific Standart Bank alarms are triggered!",
	unlockdoor = "[~r~E~w~] Unlock the door",
	lockdoor = "[~r~E~w~] Lock the door",
	nolaptop = "You don't have a hacker laptop.",
	noidcard = "You don't have the ID Card.",
	nothermal = "You don't have any thermal charges.",
	nolockpick = "You don't have any lockpicks.",
	mincops = "There must be at least "..Config.MinCops.." police in the city.",
	timeleft = "left until the next robbery.",
	alreadyrobbed = "Bank is currently being robbed.",
	syshack = "System hacking..."
}