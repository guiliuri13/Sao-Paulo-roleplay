local Config = {}

Config.Locale = 'br'

Config.serverLogo = 'https://cdn.discordapp.com/attachments/715639832197464094/715639878699843606/nextlevellogo2020.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.date = {
	format	 	= 'default',
	AmPm		= false
}

Config.voice = {

	levels = {
		default = 5.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},
	
	keys = {
		distance 	= 'HOME',
	}
}


Config.vehicle = {
	speedUnit = 'KMH',
	maxSpeed = 450,

	keys = {
		seatbelt 	= 'G',
		cruiser		= 'CAPS',
		signalLeft	= '+',
		signalRight	= '-',
		signalBoth	= '0',
	}
}

Config.ui = {
	showServerLogo		= true,

	showJob		 		= true,

	showWalletMoney 	= true,
	showBankMoney 		= true,
	showBlackMoney 		= false,

	showDate 			= true,
	showLocation 		= true,
	showVoice	 		= false,

	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= false,
	showHunger 			= true,
	showThirst	 		= true,

	showMinimap			= false,

	showWeapons			= true,
	
}



Config.vRP = {
	items = {
		blackMoney = 'dinheirosujo'
	}
}

return Config