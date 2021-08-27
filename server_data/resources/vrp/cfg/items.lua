local cfg = {}

cfg.items = {
	["ferramenta"] = { "Ferramenta",3 },
	["encomenda"] = { "Encomenda",1.5 },
	["sacodelixo"] = { "Saco de Lixo",2 },
	["garrafavazia"] = { "Garrafa Vazia",0.2 },
	["garrafadeleite"] = { "Garrafa de Leite",0.5 },
	["tora"] = { "Tora de Madeira",0.6 },
	["alianca"] = { "Aliança",0 },
	------
    ["partspistol"] = { "Peças Pistola", 0.5},
    ["wammopistol"] = { "(M)Peças Pistola", 0.1},
    ["partsminismg"] = { "Peças SMG", 0.5},
    ["wammominismg"] = { "(M)Peças SMG", 0.1},
    ["partsassault"] = { "Peças Assault", 1.0},
    ["wammoassault"] = { "(M)Peças Assault", 0.1},
    ------
	["cerveja"] = { "Cerveja",0.7 },
	["tequila"] = { "Tequila",0.7 },
	["vodka"] = { "Vodka",0.7 },
	["whisky"] = { "Whisky",0.7 },
	["conhaque"] = { "Conhaque",0.7 },
	["absinto"] = { "Absinto",0.7 },
	["dinheirosujo"] = { "Dinheiro Sujo",0 },
	["malotes"] = { "Malotes",0.5 },
	["dinheirobanco"] = { "Dinheiro Banco",0 },
	["falsificados"] = { "Itens Falsificados",0.5 },
	["repairkit"] = { "Kit de Reparos",1 },
	["algemas"] = { "Algemas",1 },
	["capuz"] = { "Capuz",0.5 },
	["lockpick"] = { "Lockpick",10 },
	["masterpick"] = { "Masterpick",10 },
	["militec"] = { "Militec-1",0.8 },
	["carnedecormorao"] = { "Carne de Cormorão",0.7 },
	["carnedecorvo"] = { "Carne de Corvo",0.7 },
	["carnedeaguia"] = { "Carne de Águia",0.8 },
	["carnedecervo"] = { "Carne de Cervo",0.9 },
	["carnedecoelho"] = { "Carne de Coelho",0.7 },
	["carnedecoyote"] = { "Carne de Coyote",1 },
	["carnedelobo"] = { "Carne de Lobo",1 },
	["carnedepuma"] = { "Carne de Puma",1.3 },
	["carnedejavali"] = { "Carne de Javali",1.4 },
	["isca"] = { "Isca",0.6 },
	["dourado"] = { "Dourado",0.6 },
	["corvina"] = { "Corvina",0.6 },
	["salmao"] = { "Salmão",0.6 },
	["pacu"] = { "Pacu",0.6 },
	["pintado"] = { "Pintado",0.6 },
	["pirarucu"] = { "Pirarucu",0.6 },
	["tilapia"] = { "Tilápia",0.6 },
	["tucunare"] = { "Tucunaré",0.6 },
	["lambari"] = { "Lambari",0.6 },
	["energetico"] = { "Energético",0.3 },
	["mochila"] = { "Mochila",1 },
	["adubo"] = { "Adubo",0.8 },
	["fertilizante"] = { "Fertilizante",0.8 },
	["maconha"] = { "Maconha",0.8 },
	["macarico"] = { "Maçarico",1.0 },
	["recipientemacarico"] = { "Recepiente Maçarico",0.5 },
-- 
	["crack"] = { "Crack",0.1 },
	["cloridrato"] = { "Cloridrato",0.2 },
	["bicarbonato"] = { "Bicarbonato",0.5 },
	["lsd"] = { "LSD",0.8 },
	["acido"] = { "Acido",0.2 },
-- 	
	["placa"] = { "Placa",0.8 },
	["rebite"] = { "Rebite",0.8 },
	["capsula"] = { "Cápsula",0.03 },
	["polvora"] = { "Pólvora",0.03 },
	["carbono"] = { "Carbono",0.0010 }, --38
	["chumbo"] = { "Chumbo",0.0010 }, --38
	["ferro"] = { "Ferro",0.0010 }, --38
	["aco"] = { "Aço",0.0001 },
	["orgao"] = { "Órgão",1.2 },
	["etiqueta"] = { "Etiqueta",0 },
	["pendrive"] = { "Pendrive",0.1 },
	["relogioroubado"] = { "Relógio Roubado",0.3 },
	["pulseiraroubada"] = { "Pulseira Roubada",0.2 },
	["anelroubado"] = { "Anel Roubado",0.2 },
	["colarroubado"] = { "Colar Roubado",0.2 },
	["brincoroubado"] = { "Brinco Roubado",0.2 },
	["carteiraroubada"] = { "Carteira Roubada",0.2 },
	["carregadorroubado"] = { "Carregador Roubado",0.2 },
	["tabletroubado"] = { "Tablet Roubado",0.2 },
	["sapatosroubado"] = { "Sapatos Roubado",0.2 },
	["vibradorroubado"] = { "Vibrador Roubado",0.2 },
	["perfumeroubado"] = { "Perfume Roubado",0.2 },
	["maquiagemroubada"] = { "Maquiagem Roubada",0.2 },
	["roupas"] = { "roupas",0.2 },
	["folhacocamoida"] = { "folhacocamoida",0.2 },
	["folhacocaprocessada"] = { "folhacocaprocessada",0.3 },
	["cocaina"] = { "cocaina",0.5 },
	["po"] = { "po",0.5 },
	["anfetamina"] = { "anfetamina",0.5 },
	["metanfetamina"] = { "metanfetamina",0.5 },
	--
	["desfibrilador"] = { "desfibrilador", 0.5 },
	["morfina"] = { "morfina", 0.2 },
	["pills"] = { "remedio", 0.1 },
	["bandagem"] = { "Bandagem",0.3 },
	--
	["colete1"] = { "Colete intacto", 1.0 },
	["colete2"] = { "Colete danificado", 0.8 },
	["colete3"] = { "Colete perfurado", 0.4 },
	["tecidobalistico"] = { "Tecido balistico", 0.0},
	--
	["tinta"] = { "Tinta Automotiva", 0.3},
	["parts"] = { "Peças Automotiva", 0.3},
	--
	["vale"] = { "Vale Vip", 0.0},
	--
	["minutos"] = { "minutos", 0.0},
	["horas"] = { "horas", 0.0},
	["dias"] = { "dias", 0.0},
	-- Assalto
	["laptop"] = { "LapTop", 1.0},
	["c4"] = { "C4", 1.0},
	["barradiamante"] = { "Barra de Diamante", 0.0},
	["barraouro"] = { "Barra de Ouro", 0.0},
	["cc"] = { "Cartão Clonado", 0.0},
	--
}

local function load_item_pack(name)
	local items = module("cfg/item/"..name)
	if items then
		for k,v in pairs(items) do
			cfg.items[k] = v
		end
	end
end

load_item_pack("armamentos")

return cfg