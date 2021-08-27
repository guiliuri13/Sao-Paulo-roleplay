local cfg = {}

cfg.garage_types = {
	["Garagem"] = {
		_config = { gtype={"personal"} }
	},
--  ["Bulbasaur"]  = {
--		_config = { gtype={"personal"},ghome="Bulbasaur" }
--	},
	["Vendade"] = {
		_config = { gtype={"sell"} },
		["ds4"] = { "DS4", 73000, 50, 5},
		["punto"] = { "Punto", 70000, 50, 5},
		["f150"] = { "F150", 175000, 82, 5},
		["fusion"] = { "Fusion", 100000, 50, 5},
		["fordka"] = { "Ford KA", 45000, 50, 5},
		["vwgolf"] = { "Golf", 60000, 50, 5},
		["civic"] = { "Honda Civic", 55000, 50, 5},
		["eletran17"] = { "Elantra", 110000, 50, 5},
		["sonata18"] = { "Sonata", 120000, 50, 5},
		["veloster"] = { "Veloster", 85000, 50, 5},
		["monza"] = { "Monza", 13000, 40, 5},
		["p207"] = { "207", 23000, 40, 5},
		["vwpolo"] = { "Polo", 90000, 20, 5},
		["evoq"] = { "Evoque", 220000, 80, 5},
		["santafe"] = { "Santa fé", 140000, 80, 5},
		["celta"] = { "Celta", 17000,  40, 5},
		["amarok"] = { "Amarok", 185000,  80, 5},
		["civic2016"] = { "Civic 16", 120000, 50, 5},
		["fiat"] = { "Fiat 147", 10000, 40, 5},
		["jetta2017"] = { "Jetta", 200000, 50, 5},
		["l200civil"] = { "1200", 180000, 80, 5},
		["saveiro"] = { "Saveiro", 70000, 60, 5},
		["upzinho"] = { "UP", 20000, 30, 5},
		["voyage"] = { "Voyage", 40000, 50, 5},
		["golg7"] = { "Gol G7", 85000, 50, 5},
		["fiattoro"] = { "Toro", 80000, 70, 5},
		["palio"] = { "Palio", 20000, 50, 5},
		["fiatuno"] = { "Uno", 15000, 40, 5},
		["fiatstilo"] = { "Stilo", 80000, 50, 5},
		["surfer"] = { "Sufer", 50000, 80, 5},
		["panto"] = { "Panto", 5000, 20, 5},
		["blista"] = { "Blista", 60000, 40, 5},
		["sultan"] = { "Sultan", 150000, 50, 5},
		["bison"] = { "Bison", 200000,  70, 5},
		["rhapsody"] = { "rhapsody", 7000, 30, 5},
		["prairie"] = { "prairie", 10000, 25,5},
		["felon"] = { "felon", 70000, 50, 5},
		["jackal"] = { "jackal", 60000, 30, 5},
		["oracle"] = { "oracle", 60000, 50, 5},
		["brioso"] = { "brioso", 30000, 30, 5},
		["biz25"] = { "Biz", 10000, 0, 0},
		["150"] = { "CG 150", 13000, 0, 0},
		["bros60"] = { "Bross", 25000, 0, 0},
		["xt66"] = { "XT 660", 40000, 0, 0},
--		["450crf"] = { "450crf", 100000, 0, 0},
		["xj"] = { "xj", 240000, 0, 0},
		["hornet"] = { "hornet", 260000, 0, 0},
		["dm1200"] = { "dm1200", 300000, 0, 0},
		["z1000"] = { "z1000", 290000, 0, 0},
		["faggio2"] = { "faggio2", 5000, 0, 0},
		["bati"] = { "bati", 300000, 0, 0},
		["hakuchou"] = { "hakuchou", 310000, 0, 0},
		["manchez"] = { "manchez", 290000, 0, 0},
		["sanchez2"] = { "sanchez2", 150000, 0, 0},
		["double"] = { "double", 300000, 0, 0},
		["diablous2"] = { "diablous2", 380000, 0, 0},
		["zombiea"] = { "zombiea", 230000, 0, 0},
		["akuma"] = { "akuma", 420000, 0, 0},
		["bf400"] = { "bf400", 260000, 0, 0},
		["carbonrs"] = { "carbonrs", 300000, 0, 0},
		["daemon2"] = { "daemon2", 200000, 0, 0},
		["hexer"] = { "hexer", 180000, 0, 0},
		["nightblade"] = { "nightblade", 340000, 0, 0},
		["sanchez"] = { "sanchez", 150000, 0, 0},
		["vader"] = { "vader", 280000, 0, 0},
		["vortex"] = { "vortex", 300000, 0, 0},
		["wolfsbane"] = { "wolfsbane", 230000, 0, 0},
		["zombieb"] = { "zombieb", 235000, 0, 0},
		["blazer"] = { "blazer", 200000, 0, 0},
		["audirs6"] = { "Audi RS6",400000, 0, 0},
		["bmwm3f80"] = { "BMW M3", 500000, 0, 0},
		["bmwm4gts"] = { "BMW M4", 200000, 0, 0},
		["dodgechargersrt"] = { "Dodge Charger SR", 350000, 0, 0},
		["ferrariitalia"] = { "Ferrari Italia", 1000000, 0, 0},
		["fordmustang"] = { "Ford Mustang GT", 200000, 0, 0},
		["lamborghinihuracan"] = { "Lamborghini Huracan", 450000, 0, 0},
		["lamtmc"] = { "Lamborghini Terzo", 5000000, 0, 0},
		["lancerevolutionx"] = { "Lancer Evolution", 23000, 0, 0},
		["mazdarx7"] = { "Mazda RX7", 40000, 0, 0},
		["mercedesamgc63"] = { "Mercedes AMG", 150000, 0, 0},
		["nissan370z"] = { "Nissan 370z", 170000, 0, 0},
		["nissangtr"] = { "Nissan GTR",  500000, 0, 0},
		["nissanskyliner34"] = { "Nissan Skyline", 300000, 0, 0},
		["paganihuayra"] = { "Pagani Huayra", 1000000, 0, 0},
		["amggtr"] = { "Mercedes AMG GRT", 15000000, 0, 0},
		["lp700r"] = { "Lamborghini 700P", 15000000, 0, 0},
		["senna"] = { "McLaren Senna", 15000000, 0, 0},
		["aperta"] = { "La Ferrari", 5000000, 0, 0},
		["i8"] = { "Bmw I8", 15000000, 0, 0},
		["fxxkevo"] = { "Ferrari Fxx", 13000000, 0, 0},
		["911r"] = { "Porsche 911r", 300000, 0, 0},
		["2018zl1"] = { "Camaro 2018 ZL1", 210000, 0, 0},
		["slsamg"] = { "Mercedes Sls", 165000, 0, 0},
		["teslaprior"] = { "Tesla Prior", 500000, 0, 0},
		["toyotasupra"] = { "Toyota Supra", 100000, 0, 0},
		["r1250"] = { "R1250",  250000, 0, 0},
		["r1"] = { "Yamaha YZF-R1",  300000, 0, 0},
	},
	
-- // Policia	
	["Policia"] = {
		_config = { gtype={"rent"},permissions={"pm.permissao" } },
		["golpm"] = { "Gol",0,0,1 },
		["unopmesp"]= { "Uno",0,0,-1 },
		["palioadv"] = { "Palio",0,0,-1 },
		["spinrp3"] = { "Spin",0,0,-1 },
		["policet"] = { "Van",0,0,-1 },
		["trailft"] = { "Hilux",0,0,-1 },
--		["s10"] = { "S10",0,0,-1 },
		["xre2019"] = { "XRE ROCAM",0,0,-1 },
		["xtrocam"] = { "XT ROCAM",0,0,-1 }
	},
	["PoliciaB"] = {
		_config = { gtype={"rent"},permissions={"pm.permissao"} },
		["pbus"] = { "Ônibus",0,0,-1 },
		["mule"] = { "Mule",0,0,-1 }
	},

	["PoliciaH"] = {
		_config = { gtype={"rent"},permissions={"policia.permissao"} },
		["as350"] = { "Águia",0,0,-1 }
	},

	["RotaH"] = {
		_config = { gtype={"rent"},permissions={"policia.permissao"} },
		["as350"] = { "Águia",0,0,-1 }
	},

	["ROTA"] = {
		_config = { gtype={"rent"},permissions={"rota.permissao"} },
		["hiluxsw4rota"] = { "Hillux SW4",0,0,-1 },
		["trailrota"] = { "TrailBlazer",0,0,-1 },
		["mule"] = { "Mule",0,0,-1 }
	},
	["Forca"] = {
		_config = { gtype={"rent"},permissions={"forcanacional.permissao"} },
		["hiluxpmerj1"] = { "Força Nacional Ranger",0,0,-1 },
		["pcdenarc"] = { "Força Nacional S10",0,0,-1 }
	},
-- // Paramedico	
	["SAMU"] = {
		_config = { gtype={"rent"},permissions={"paramedico.permissao"} },
		["ambulance"] = { "Ambulância",0,0,-1 },
		["motosamu"] = { "Moto",0,0,-1 },
		["trailsamu"] = { "trailsamu",0,0,-1 },
		["mule"] = { "Mule",0,0,-1 }
		
	},
	["helipontoSAMU"] = {
		_config = { gtype={"rent"},permissions={"paramedico.permissao"} },
		["samumav"] = { "Helicóptero",0,0,-1 }
	},
	
-- // Instrutor
    ["Instruto"] = {
		_config = { gtype={"rent"},permissions={"instrutor.permissao"} },
		["panto"] = { "panto",0,0,-1 }
	},	
	
-- // Empregos
	["Motorista"] = {
		_config = { gtype={"rent"} },
		["mi4"] = { "Onibus",0,0,-1 },
		["coach"] = { "Onibus apha",0,0,-1 }
	},
	["Mecanico"] = {
		_config = { gtype={"rent"},permissions={"mecanico.permissao"} },
		["flatbed"] = { "Reboque",0,0,-1 }
	},
	["Taxista"] = {
		_config = { gtype={"rent"} },
		["taxi"] = { "Taxi",0,0,-1 }
	},
	["Carteiro"] = {
		_config = { gtype={"rent"} },
		["boxville2"] = { "Caminhão",0,0,-1 }
	},
	["Lixeiro"] = {
		_config = { gtype={"rent"} },
		["trash"] = { "Caminhão 01",0,0,-1 },
		["trash2"] = { "Caminhão 02",0,0,-1 }
	},
	["Caminhao"] = {
		_config = { gtype={"rent"} },
		["phantom"] = { "caminhão 01",0,0,-1 },
		["packer"] = { "caminhão 02",0,0,-1 }
	},
	["Sucata"] = {
		_config = { gtype={"rent"} },
		["scrap"] = { "Caminhao Sucata",0,0,-1 }
	},
	["GUINCHO"] = {
		_config = { gtype={"rent"},permissions={"mecanico.permissao"} },
		["flatbed3"] = { "Reboque",0,0,-1 }
	},
	["VipH"] = {
		_config = { gtype={"rent"},permissions={"heli.permissao"} },
		["volatus"] = { "Helicóptero",0,0,-1 }
	},
	
	
	
-- // Aluguel
	["Embarcacoes"] = {
		_config = { gtype={"rent"} },
		["dinghy"] = { "dinghy",300,0,-1 },
		["jetmax"] = { "jetmax",300,0,-1 },
		["marquis"] = { "marquis",300,0,-1 },
		["seashark3"] = { "seashark3",300,0,-1 },
		["speeder"] = { "speeder",300,0,-1 },
		["speeder2"] = { "speeder2",300,0,-1 },
		["squalo"] = { "squalo",300,0,-1 },
		["suntrap"] = { "suntrap",300,0,-1 },
		["toro"] = { "toro",300,0,-1 },
		["toro2"] = { "toro2",300,0,-1 },
		["tropic"] = { "tropic",300,0,-1 },
		["tropic2"] = { "tropic2",300,0,-1 }
	},
	["Iniciante"] = {
		_config = { gtype={"rent"} },
		["bmx"] = { "bike boladona",0,0,-1},
	},
	["Forte"] = {
		_config = { gtype={"rent"} },
		["Stockade"] = { "Carroforte",0,0,-1},
	},
-- // Tunning
	["Bennys"] = {
		_config = { gtype={"shop"},permissions={"benny.permissao"} },
		_shop = {
			[0] = { "Aerofolio",200,"" },
            [1] = { "Saia Frontal",200,"" },
            [2] = { "Saia Traseira",200,"" },
            [3] = { "Saia",200,"" },
            [4] = { "Escapamento",200,"" },
            [5] = { "Interior",200,"" },
            [6] = { "Grades",200,"" },
            [7] = { "Capo",200,"" },
            [8] = { "Parachoque Direito",200,"" },
            [9] = { "Parachoque Esquerdo",200,"" },
            [10] = { "Tetos",200,"" },
            [11] = { "Motor",200,"" },
            [12] = { "Freios",200,"" },
            [13] = { "Transmissao",200,"" },
            [14] = { "Buzina",200,"" },
            [15] = { "Suspensao",200,"" },
            [18] = { "Turbo",200,"" },
            [20] = { "Fumaca",200,"" },
            [22] = { "Farois",200,"" },
            [23] = { "Rodas",200,"" },
            [24] = { "Rodas Traseiras",200,"" },
            [25] = { "Suporte de Placa",200,"" },
            [27] = { "Trims",200,"" },
            [28] = { "Enfeites",200,"" },
            [29] = { "Painel",200,"" },
            [30] = { "Lanterna",200,"" },
            [31] = { "Macaneta",200,"" },
            [32] = { "Bancos",200,"" },
            [33] = { "Volante",200,"" },
            [34] = { "H Shift",200,"" },
            [35] = { "Placas",200,"" },
            [36] = { "Caixa de Som",200,"" },
            [37] = { "Porta-Malas",200,"" },
            [38] = { "Hidraulica",200,"" },
            [39] = { "Placa de Motor",200,"" },
            [40] = { "Filtro de Ar",200,"" },
            [41] = { "Struts",200,"" },
            [42] = { "Capas",200,"" },
            [43] = { "Antenas",200,"" },
            [44] = { "Extra Trims",200,"" },
            [45] = { "Tanque",200,"" },
            [46] = { "Vidros",200,"" },
            [48] = { "Livery",200,"" },
            [49] = { "Tiras",0,"" }
		}
	}
}

cfg.garages = {
    { "Bennys",937.79290771484,-969.740234375,39.796264648438,false,0 }, -- tunning de veiculo
--	{ "Bennys",1020.60,-2309.72,30.50,false,0 }, -- tunning de veiculo

	{ "Vendade" ,-34.22,-1113.99,26.42,false,0 }, -- venda de veiculo para concessionaria
	
	{ "Garagem",55.43,-876.19,30.66,true,1 },
	{ "Garagem",317.25,2623.14,44.46,true,2 },
	{ "Garagem",-773.34,5598.15,33.60,true,3 },
	{ "Garagem",275.23,-345.54,45.17,true,4 },
	{ "Garagem",596.40,90.65,93.12,true,5 },
	{ "Garagem",-340.76,265.97,85.67,true,6 },
	{ "Garagem",-1184.92,-1510.00,4.64,true,7 },
	{ "Garagem",-73.44,-2004.99,18.27,true,8 },
	{ "Garagem",-42.69,-1104.33,26.42,true,9 },
	{ "Garagem",214.02,-808.53,31.014,true,31 },

	
	{ "ROTA", -1038.119,-851.914,5.04,false,10 }, -- Rota ( Carros )
	{ "RotaH",-1108.49,-834.0,37.6,false,32 }, -- Rota ( Aguia )
	{ "Forca",458.33,-1008.09,28.27,false,11 },

	{ "Policia",458.33,-1008.09,28.27,false,11 }, -- PM ( Carros )
	{ "PoliciaH",463.24,-982.53,43.69,false,12 }, -- PM ( Aguia )
	{ "PoliciaB",473.06,-1019.21,28.10,false,13 }, -- PM ( Fundos )
	
	{ "SAMU",295.291,-601.04,43.30,false,14 }, -- SAMU ( Carros )
	{ "helipontoSAMU",338.37,-586.76,74.16,false,15 }, -- SAMU ( Aguia )
	
	{ "Taxista",903.31274414062,-173.4610900879,74.07,false,16 }, -- Taxi ( Carros )
	{ "Carteiro",68.95,126.94,79.20,false,17 },-- Carteiro ( Carros )
	{ "Lixeiro",-341.58,-1567.46,25.22,false,18 },-- Lixeiro ( Carros )
	{ "Motorista",453.89,-600.57,28.58,false,19 },-- Motorista ( Carros )
	
	{ "Embarcacoes",-1605.19,-1164.37,1.28,false,20 }, -- Barco ( Aluguel )
	{ "Embarcacoes",-1522.68,1494.92,111.58,false,21 },-- Barco ( Aluguel )
	{ "Embarcacoes",1337.36,4269.71,31.50,false,22 },-- Barco ( Aluguel )
	{ "Embarcacoes",-192.32,791.54, 198.10,false,23 },-- Barco ( Aluguel )

	{ "Instruto",215.67,-1398.51,30.58,false,24 }, -- Carro para teste
	{ "Caminhao",1196.80,-3253.68,7.09,false,25 }, -- Emprego Caminhao 
	
	{ "Iniciante",-1030.45,-2725.5,13.64,false,26 }, -- Inicio
	{ "GUINCHO",889.35900878906,-1027.5025634766,35.10945892334,false,27 },
	{ "Sucata", -470.24,-1717.69, 18.68, false , 28},
	{ "Forte",0.64,-659.71,33.48,false,29 },
	{ "VipH",-1111.58,-2884.10,13.94,true,30 }
	

}
return cfg