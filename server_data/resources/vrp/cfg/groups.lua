local cfg = {}

cfg.groups = {
    ["donopaisana"] = { "paisanadono.permissao" },
	["dono"] = {
		"owner.permissao",
	    "supervisor.permissao",		
		"admin.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"chamado.adm",
		"wl.permissao"
	},
	["dsupervisorpaisana"] = { "supervisorpaisana.permissao" },
	["dsupervisor"] = {
	    "supervisor.permissao",
		"admin.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"chamado.adm",
		"wl.permissao"
	},
	["administradorpaisana"] = { "administradorpaisana.permissao" },
	["administrador"] = {
		"admin.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"chamado.adm",
		"wl.permissao"
	},
	["moderadorpaisana"] = { "moderadorpaisana.permissao" },
	["moderador"] = {
		"moderador.permissao",
		"suporte.permissao",
		"chamado.adm",
		"wl.permissao"
	},
	["suportepaisana"] = { "suportepaisana.permissao" },
	["suporte"] = {
		"suporte.permissao",
		"chamado.adm",
		"wl.permissao"
	},

	-----------------------------------------------------------------------------------------------------------------------
	-- POLÍCIA
	-----------------------------------------------------------------------------------------------------------------------


	["coronel"] = {
		_config = {
			title = "Coronel",
			gtype = "job"
		},

		"coronel.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"bau.permissao",
		"polpar.permissao"
	},


	["paisanacoronel"] = {
		_config = {
			title = "Paisana Coronel",
			gtype = "job"
		},

		"paisanacoronel.permissao",
		"coronel.permissao" 
	},

------------------------------------------------------------------------------------------

	["major"] = {
		_config = {
			title = "Major",
			gtype = "job"
		},

		"major.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"bau.permissao",
		"polpar.permissao"
	},


	["paisanamajor"] = {
		_config = {
			title = "Paisana Major",
			gtype = "job"
		},

		"paisanamajor.permissao",
		"major.permissao" 
	},

	------------------------------------------------------------------------------------------

	["capitao"] = {
		_config = {
			title = "Capitao",
			gtype = "job"
		},

		"capitao.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"bau.permissao",
		"polpar.permissao"
	},


	["paisanacapitao"] = {
		_config = {
			title = "Paisana Capitao",
			gtype = "job"
		},

		"paisanacapitao.permissao",
		"capitao.permissao" 
	},


------------------------------------------------------------------------------------------


	["tenente"] = {
		_config = {
			title = "Tenente",
			gtype = "job"
		},

		"tenente.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"polpar.permissao",
		"bau.permissao"
	},


	["paisanatenente"] = {
		_config = {
			title = "Paisana Tenente",
			gtype = "job"
		},

		"paisanatenente.permissao",
		"tenente.permissao" 
	},


------------------------------------------------------------------------------------------


	["sargento"] = {
		_config = {
			title = "sargento",
			gtype = "job"
		},

		"sargento.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"polpar.permissao"
	},


	["paisanasargento"] = {
		_config = {
			title = "Paisana Sargento",
			gtype = "job"
		},

		"paisanasargento.permissao",
		"sargento.permissao" 
	},


------------------------------------------------------------------------------------------


	["cabo"] = {
		_config = {
			title = "Cabo",
			gtype = "job"
		},

		"cabo.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"polpar.permissao"
	},


	["paisanacabo"] = {
		_config = {
			title = "Paisana Cabo",
			gtype = "job"
		},

		"paisanacabo.permissao",
		"cabo.permissao" 
	},


------------------------------------------------------------------------------------------


	["soldado"] = {
		_config = {
			title = "Soldado",
			gtype = "job"
		},

		"soldado.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"polpar.permissao"
	},


	["paisanasodaldo"] = {
		_config = {
			title = "paisana soldado",
			gtype = "job"
		},

		"paisanasoldado.permissao",
		"soldado.permissao" 
	},


------------------------------------------------------------------------------------------

	["recruta"] = {
		_config = {
			title = "Recruta",
			gtype = "job"
		},

		"recruta.permissao",
		"pm.permissao",
		"dv.permissao",
		"police.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"polpar.permissao"
	},


	["paisanarecruta"] = {
		_config = {
			title = "paisana recruta",
			gtype = "job"
		},

		"paisanarecruta.permissao",
		"recruta.permissao" 
	},

	------------------------------------------------------------------------------------------

	
	["PaisanaPolicia"] = { "paisanapolicia.permissao" },
	["Policia"] = {

		_config = {
			title = "Policial Paisana",
			gtype = "job"
		},

		"pm.permissao",
		"policia.permissao",
		"radiopolicia.permissao",
		"polpar.permissao"
	},


--Coronel:
--Ten.Coronel:
--Major:
--Capitão:
--1°Tenente:
--2°Tenente:
--Sub.Tenente:
--1°Sargento:
--2°Sargento:
--3°Sargento:
--Cabo:
--Soldado:
--Recruta:


	-------------------------------------------------------------------------------------------------------------------------
	-- PARAMÉDICO
	-------------------------------------------------------------------------------------------------------------------------


	["diretor"] = {

		_config = {
			title = "Diretor do SAMU",
			gtype = "job"
		},

		"diretor.permissao",
		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["paisanadiretor"] = {

		_config = {
			title = "Diretor paisana",
			gtype = "job"
		},

		"diretor.permissao",
		"paramedico.permissao"
	},

----------------------------------------------------------------------------


	["cirurgiao"] = {

		_config = {
			title = "Cirurgião do SAMU",
			gtype = "job"
		},

		"cirurgiao.permissao",
		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["paisanacirurgiao"] = {

		_config = {
			title = "Cirurgião paisana",
			gtype = "job"
		},

		"cirurgiao.permissao",
		"paramedico.permissao"
	},

----------------------------------------------------------------------------


	["medicogeral"] = {

		_config = {
			title = "Médico geral do SAMU",
			gtype = "job"
		},

		"medicogeral.permissao",
		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["paisanamedicogeral"] = {

		_config = {
			title = "Médico geral paisana",
			gtype = "job"
		},

		"medicogeral.permissao",
		"paramedico.permissao"
	},

----------------------------------------------------------------------------


	["enfermeiro"] = {

		_config = {
			title = "Enfermeiro do SAMU",
			gtype = "job"
		},

		"enfermeiro.permissao",
		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["paisanaenfermeiro"] = {

		_config = {
			title = "Enfermeiro paisana",
			gtype = "job"
		},

		"enfermeiro.permissao",
		"paramedico.permissao"
	},

----------------------------------------------------------------------------


	["paramedicoo"] = {

		_config = {
			title = "Paramédico do SAMU",
			gtype = "job"
		},

		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["paisanaparamedico"] = {

		_config = {
			title = "Paramédico paisana",
			gtype = "job"
		},

		"paramedico.permissao",
	},

----------------------------------------------------------------------------

-------------------------------------------------------------------------------
--MECANICO
-------------------------------------------------------------------------------


["aprendiz"] = {
	_config = {
		title = "Aprendiz de mecânica",
		gtype = "job"
	},
	"aprendiz.permissao",
	"benny.permissao",
	"mecanico.permissao",
	"reparar.permissao"
},
["paisanaaprendiz"] = {
	_config = {
		title = "PaisanaMecanico",
		gtype = "job"
	},
	"paisanaaprendiz.permissao",
	"paisanabennys.permissao"
},

-----------------------------------------------


["borracheiro"] = {
	_config = {
		title = "Mecânica",
		gtype = "job"
	},
	"borracheiro.permissao",
	"benny.permissao",
	"mecanico.permissao",
	"reparar.permissao"
},
["paisanaborracheiro"] = {
	_config = {
		title = "Borracheiro Paisana",
		gtype = "job"
	},
	"paisanaborracheiro.permissao",
	"paisanabennys.permissao"
},

-----------------------------------------------



["mecanicoo"] = {
	_config = {
		title = "Mecânico",
		gtype = "job"
	},
	"mecanicoo.permissao",
	"benny.permissao",
	"mecanico.permissao",
	"reparar.permissao"
},
["paisanamecanicoo"] = {
	_config = {
		title = "PaisanaMecanico",
		gtype = "job"
	},
	"paisanamecanicoo.permissao",
	"paisanabennys.permissao"
},

-----------------------------------------------


["engenheiro"] = {
	_config = {
		title = "Engenheiro chefe",
		gtype = "job"
	},
	"engenheiro.permissao",
	"benny.permissao",
	"mecanico.permissao",
	"reparar.permissao"
},
["paisanaengenheiro"] = {
	_config = {
		title = "Engenheiro paisana",
		gtype = "job"
	},
	"paisanaengenheiro.permissao",
	"paisanabennys.permissao"
},

-----------------------------------------------


















--[[

	diretor
	paisanadiretor

	cirurgiao
	paisanacirurgiao

	medicogeral
	paisanamedicogeral

	enfermeiro
	paisanaenfermeiro

	paramedico
	paisanaparamedico



	["PaisanaDiretor"] = { "paisanadiretor.permissao" },
	["Diretor"] = {

		_config = {
			title = "Paramédico Diretor",
			gtype = "job"
		},

		"diretor.permissao",

		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},


	["PaisanaCoordenador"] = { "paisanacoordenador.permissao" },
	["Coordenador"] = {

		_config = {
			title = "Paramédico Coordenador",
			gtype = "job"
		},

		"coordenador.permissao",

		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},
	
	["PaisanaCirurgiao"] = { "paisanacirurgiao.permissao" },
	["Cirurgião"] = {

		_config = {
			title = "Paramédico Cirurgião",
			gtype = "job"
		},

		"cirurgiao.permissao",

		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["PaisanaMedicoGeral"] = { "paisanamedicogeral.permissao" },
	["Médico Geral"] = {

		_config = {
			title = "Médico Geral",
			gtype = "job"
		},

		"medicogeral.permissao",

		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["Enfermeiro"] = {

		_config = {
			title = "Enfermeiro",
			gtype = "job"
		},

		"enfermeiro.permissao",

		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},
 
	["Paramedico"] = {
		_config = {
			title = "Paramedico",
			gtype = "job"
		},
		"paramedico.permissao",
		"membros.permissao",
		"polpar.permissao"
	},

	["PaisanaParamedico"] = {
		_config = {
			title = "PaisanaParamedico",
			gtype = "job"
		},
		"paisanaparamedico.permissao"
	},

]]

--	Diretor(a):
--	Cordenador(a):
--	Cirurgião:
--	Médico Geral:
--	Enfermeiro:
--	Paramédico:

	-------------------------------------------------------------------------------------------------------------------------

	["Forca"] = {
		_config = {
			title = "Força Nacional",
			gtype = "job"
		},
		"forcanacional.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"polpar.permissao"
	},
	["PaisanaForca"] = {
		_config = {
			title = "Paisana Força Nacional",
			gtype = "job"
		},
		"paisanaforcanacional.permissao"
	},
	["ROTA"] = {
		_config = {
			title = "ROTA",
			gtype = "job"
		},
		"rota.permissao",
		"policia.permissao",
		"xerife.permissao",
		"radiopolicia.permissao",
		"polpar.permissao"
	},
	["Paramedico"] = {
		_config = {
			title = "Paramedico",
			gtype = "job"
		},
		"paramedico.permissao",
		"membros.permissao",
--		"dv.permissao",
		"polpar.permissao"
	},
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "job"
		},
		"Advogado.permissao",
		"membros.permissao",
		"polpar.permissao"
	},
	["Instrutor"] = {
		_config = {
			title = "Instrutor",
			gtype = "job"
		},
		"instrutor.permissao"
	},
	["PaisanaPolicia"] = {
		_config = {
			title = "PaisanaPolicia",
			gtype = "job"
		},
		"paisanapolicia.permissao"
	},
	["PaisanaROTA"] = {
		_config = {
			title = "ROTApaisana",
			gtype = "job"
		},
		"paisanarota.permissao"
	},
	--[[
	["Mecanico"] = {
		_config = {
			title = "Mecânica",
			gtype = "job"
		},
		"benny.permissao",
		"mecanico.permissao",
		"reparar.permissao"
	},
	["PaisanaMecanico"] = {
		_config = {
			title = "PaisanaMecanico",
			gtype = "job"
		},
		"paisanabennys.permissao"
	},
	--]]
	["Taxista"] = {
		_config = {
			title = "Taxista",
			gtype = "job"
		},
		"taxista.permissao"
	},
	["PaisanaTaxista"] = {
		_config = {
			title = "PaisanaTaxista",
			gtype = "job"
		},
		"paisanataxista.permissao"
	},
	["Alertas"] = {
		_config = {
			title = "Alertas"
		},
		"alertas.permissao"
	},

	["Vendedor"] = {
	    _config = {
		title = "Vendedor",
		gtype = "job"
	   },
	   "vendedor.permissao"
	},
	-------------------------------------------------------------------------- FACÇOES ----------------------------------------------------------------------------
	["Motoclub"] = {
		_config = {
			title = "Motoclub",
			gtype = "job"
		},
		"cc.permissao",
		"motoclub.permissao",
		"entrada.permissao"
	},
	["Verdes"] = {
		_config = {
			title = "Verdes",
			gtype = "job"
		},
		"verdes.permissao",
		"meta.permissao",
		"vermelhos.permissao",
		"trafico.permissao"
	},
--	["Okaida"] = {
--		_config = {
--			title = "Okaida",
--			gtype = "job"
--		},
--		"azul.permissao",
--		"crack.permissao",
--		"trafico.permissao"
--	},
--	["T.C.P"] = {
--		_config = {
--			title = "T.C.P",
--			gtype = "job"
--		},
--		"cocaina.permissao",
--		"amarelos.permissao",
--		"trafico.permissao"
--	},
	["Vermelhos"] = {
		_config = {
			title = "Vermelhos",
			gtype = "job"
		},
		"vermelhos.permissao",
		"maconha.permissao",
		"verdes.permissao",
		"trafico.permissao"
	},
--	["A.D.A"] = {
--		_config = {
--			title = "A.D.A",
--			gtype = "job"
--		},
--		"lsd.permissao",
--		"roxos.permissao"
--	},
	["Mafia"] = {
		_config = {
			title = "Cosa Nostra",
			gtype = "job"
		},
		"cosanostra.permissao",
		"cc.permissao",		
		"mafia.permissao"
	},
	["Laranjas"] = {
		_config = {
			title = "Laranjas",
			gtype = "job"
		},

		"cocaina.permissao",

		"laranjas.permissao",
		"milicia.permissao"
	},
	["Vanilla"] = {
		_config = {
			title = "Vanilla",
			gtype = "job"
		},
		"cc.permissao",		
		"vanilla.permissao"
	},
	-------------------------------------- YAKUZA --------------------------------------------------------------
	["Yakuza"] = {
	    _config = {
		title = "Yakuza",
		gtype = "job"
	    },
		"cc.permissao",		
	    "yakuza.permissao",
	},
	["Carta"] = { },
	["Porte"] = { },
	["Lider"] = { },
	
	
	
	
	["2"] = { },
	["3"] = { },
	["4"] = { },
	["5"] = { },
	["6"] = { },
	["7"] = { },
	["8"] = { },
	["9"] = { },
	["10"] = { },
	["11"] = { },
	["12"] = { },
	["13"] = { },
	["14"] = { },
	["15"] = { },
	["16"] = { },
	
	
	
}


cfg.users = {
    [1] = { "dono" },
}

cfg.selectors = {}

return cfg