local pdl = GetInteriorAtCoords(440.84, -983.14, 30.69)  -- Fix limbo DP
LoadInterior(pdl)


local bennys = GetInteriorAtCoords(-210.29,-1321.87,30.89)  --Benny's
LoadInterior(bennys)

--[[Citizen.CreateThread(function() -- Hospital Antigo
		RequestIpl("rc12b_hospitalinterior")
		RequestIpl("rc12b_destroyed")
		RequestIpl("v_carshowroom")
end)]]

Citizen.CreateThread(function() -- Hospital Novo
	RequestIpl("gabz_pillbox_milo_")
		interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
		if IsValidInterior(interiorID) then
			RemoveIpl("rc12b_fixed")
			RemoveIpl("rc12b_destroyed")
			RemoveIpl("rc12b_default")
			RemoveIpl("rc12b_hospitalinterior_lod")
			RemoveIpl("rc12b_hospitalinterior")
		RefreshInterior(interiorID)
		end
	end)

RequestIpl("gabz_biker_milo_")
interiorID = GetInteriorAtCoords(994.47870000, -122.99490000, 73.11467000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "walls_02")
		SetInteriorPropColor(interiorID, "walls_02", 8)
		EnableInteriorProp(interiorID, "Furnishings_02")
		SetInteriorPropColor(interiorID, "Furnishings_02", 8)
		EnableInteriorProp(interiorID, "decorative_02")
		EnableInteriorProp(interiorID, "mural_03")
		EnableInteriorProp(interiorID, "lower_walls_default")
		SetInteriorPropColor(interiorID, "lower_walls_default", 8)
		EnableInteriorProp(interiorID, "mod_booth")
		EnableInteriorProp(interiorID, "gun_locker")
		EnableInteriorProp(interiorID, "cash_small")
		EnableInteriorProp(interiorID, "id_small")
		EnableInteriorProp(interiorID, "weed_small")
		RefreshInterior(interiorID)
	end

Citizen.CreateThread(function()  -- Fix casa do Franklin
interiorID = GetInteriorAtCoords(3.199463, 529.7808, 169.6262)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "locked")
		RefreshInterior(interiorID)
	end
end)

Citizen.CreateThread(function()
RequestIpl("lafa2k_bkr_biker_dlc_int_02")
interiorID = GetInteriorAtCoords(889.67889404297,-2102.9304199219,30.761777877808)  --Mc do LAFA
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "walls_01")
		EnableInteriorProp(interiorID, "lower_walls_default")
		EnableInteriorProp(interiorID, "furnishings_02")
		EnableInteriorProp(interiorID, "mural_03")
		EnableInteriorProp(interiorID, "decorative_02")
		EnableInteriorProp(interiorID, "gun_locker")
		EnableInteriorProp(interiorID, "mod_booth")
		EnableInteriorProp(interiorID, "meth_small")
		EnableInteriorProp(interiorID, "meth_medium")
		EnableInteriorProp(interiorID, "meth_large")
		EnableInteriorProp(interiorID, "cash_small")
		EnableInteriorProp(interiorID, "cash_medium")
		EnableInteriorProp(interiorID, "cash_large")
		EnableInteriorProp(interiorID, "weed_small")
		EnableInteriorProp(interiorID, "weed_medium")
		EnableInteriorProp(interiorID, "weed_large")
		EnableInteriorProp(interiorID, "coke_small")
		EnableInteriorProp(interiorID, "coke_medium")
		EnableInteriorProp(interiorID, "coke_large")
		EnableInteriorProp(interiorID, "counterfeit_small")
		EnableInteriorProp(interiorID, "counterfeit_medium")
		EnableInteriorProp(interiorID, "counterfeit_large")
		EnableInteriorProp(interiorID, "id_small")
		EnableInteriorProp(interiorID, "id_medium")
		EnableInteriorProp(interiorID, "id_large")
		SetInteriorPropColor(interiorID, "walls_01", 8)
		SetInteriorPropColor(interiorID, "lower_walls_default", 8)
		RefreshInterior(interiorID)
	end
	
RequestIpl("lafa2k_bkr_biker_dlc_int_02")
interiorID = GetInteriorAtCoords(889.67889404297,-2102.9304199219,30.761777877808)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "walls_01")
		EnableInteriorProp(interiorID, "lower_walls_default")
		EnableInteriorProp(interiorID, "furnishings_02")
		EnableInteriorProp(interiorID, "mural_03")
		EnableInteriorProp(interiorID, "decorative_02")
		EnableInteriorProp(interiorID, "gun_locker")
		EnableInteriorProp(interiorID, "mod_booth")
		EnableInteriorProp(interiorID, "meth_small")
		EnableInteriorProp(interiorID, "meth_medium")
		EnableInteriorProp(interiorID, "meth_large")
		EnableInteriorProp(interiorID, "cash_small")
		EnableInteriorProp(interiorID, "cash_medium")
		EnableInteriorProp(interiorID, "cash_large")
		EnableInteriorProp(interiorID, "weed_small")
		EnableInteriorProp(interiorID, "weed_medium")
		EnableInteriorProp(interiorID, "weed_large")
		EnableInteriorProp(interiorID, "coke_small")
		EnableInteriorProp(interiorID, "coke_medium")
		EnableInteriorProp(interiorID, "coke_large")
		EnableInteriorProp(interiorID, "counterfeit_small")
		EnableInteriorProp(interiorID, "counterfeit_medium")
		EnableInteriorProp(interiorID, "counterfeit_large")
		EnableInteriorProp(interiorID, "id_small")
		EnableInteriorProp(interiorID, "id_medium")
		EnableInteriorProp(interiorID, "id_large")
		SetInteriorPropColor(interiorID, "walls_01", 8)
		SetInteriorPropColor(interiorID, "lower_walls_default", 8)
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(96.47223, 6347.784,30.48238)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "weed_hosea")
		EnableInteriorProp(interiorID, "weed_hoseb")
		EnableInteriorProp(interiorID, "weed_hosec")
		EnableInteriorProp(interiorID, "weed_hosed")
		EnableInteriorProp(interiorID, "weed_hosee")
		EnableInteriorProp(interiorID, "weed_hosef")
		EnableInteriorProp(interiorID, "weed_hoseg")
		EnableInteriorProp(interiorID, "weed_hoseh")
		EnableInteriorProp(interiorID, "weed_hosei")
		EnableInteriorProp(interiorID, "weed_growtha_stage3")
		EnableInteriorProp(interiorID, "weed_growthb_stage3")
		EnableInteriorProp(interiorID, "weed_growthc_stage3")
		EnableInteriorProp(interiorID, "weed_growthd_stage3")
		EnableInteriorProp(interiorID, "weed_growthe_stage3")
		EnableInteriorProp(interiorID, "weed_growthf_stage3")
		EnableInteriorProp(interiorID, "weed_growthg_stage3")
		EnableInteriorProp(interiorID, "weed_growthh_stage3")
		EnableInteriorProp(interiorID, "weed_growthi_stage3")
		EnableInteriorProp(interiorID, "light_growtha_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthb_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthc_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthd_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthe_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthf_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthg_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthh_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthi_stage33_upgrade")
		EnableInteriorProp(interiorID, "weed_upgrade_equip")
		EnableInteriorProp(interiorID, "weed_drying")
		EnableInteriorProp(interiorID, "weed_security_upgrade")
		EnableInteriorProp(interiorID, "weed_production")
		EnableInteriorProp(interiorID, "weed_set_up")
		EnableInteriorProp(interiorID, "weed_chairs")
		RefreshInterior(interiorID)	
	end

interiorID = GetInteriorAtCoords(24.54136000, -1400.42700000,29.12644000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "weed_upgrade_equip")
		EnableInteriorProp(interiorID, "counterfeit_security")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100d")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20d")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10d")
		EnableInteriorProp(interiorID, "counterfeit_setup")
		EnableInteriorProp(interiorID, "counterfeit_upgrade_equip")
		EnableInteriorProp(interiorID, "dryera_on")
		EnableInteriorProp(interiorID, "dryerb_on")
		EnableInteriorProp(interiorID, "dryerc_on")
		EnableInteriorProp(interiorID, "dryerd_on")
		EnableInteriorProp(interiorID, "money_cutter")
		EnableInteriorProp(interiorID, "special_chairs")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(1497.75100000, 6393.09000000,21.78359000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "meth_lab_upgrade")
		EnableInteriorProp(interiorID, "meth_lab_production")
		EnableInteriorProp(interiorID, "meth_lab_security_high")
		EnableInteriorProp(interiorID, "meth_lab_setup")
		EnableInteriorProp(interiorID, "counterfeit_standard_equip")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(-1103.1722412109,4951.3447265625,234.8638)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "coke_cut_01")
		EnableInteriorProp(interiorID, "coke_cut_02")
		EnableInteriorProp(interiorID, "coke_cut_03")
		EnableInteriorProp(interiorID, "coke_cut_04")
		EnableInteriorProp(interiorID, "coke_cut_05")
		EnableInteriorProp(interiorID, "set_up")
		EnableInteriorProp(interiorID, "security_high")
		EnableInteriorProp(interiorID, "production_upgrade")
		EnableInteriorProp(interiorID, "equipment_upgrade")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(2845.278,4441.969,47.50344)
	if IsValidInterior(interiorID) then
		RefreshInterior(interiorID)
	end	

RequestIpl("imp_impexp_interior_placement_interior_1_impexp")
interiorID = GetInteriorAtCoords(941.10520000,-971.67590000,39.39997000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "branded_style_set")
		EnableInteriorProp(interiorID, "car_floor_hatch")
		EnableInteriorProp(interiorID, "door_blocker")
		RefreshInterior(interiorID)
	end		

--[[interiorID = GetInteriorAtCoords(1051.491, -3196.536, -39.14842)  -- Maconha (Ballas)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "weed_hosea")
		EnableInteriorProp(interiorID, "weed_hoseb")
		EnableInteriorProp(interiorID, "weed_hosec")
		EnableInteriorProp(interiorID, "weed_hosed")
		EnableInteriorProp(interiorID, "weed_hosee")
		EnableInteriorProp(interiorID, "weed_hosef")
		EnableInteriorProp(interiorID, "weed_hoseg")
		EnableInteriorProp(interiorID, "weed_hoseh")
		EnableInteriorProp(interiorID, "weed_hosei")
		EnableInteriorProp(interiorID, "weed_growtha_stage3")
		EnableInteriorProp(interiorID, "weed_growthb_stage3")
		EnableInteriorProp(interiorID, "weed_growthc_stage3")
		EnableInteriorProp(interiorID, "weed_growthd_stage2")
		EnableInteriorProp(interiorID, "weed_growthe_stage2")
		EnableInteriorProp(interiorID, "weed_growthf_stage3")
		EnableInteriorProp(interiorID, "weed_growthg_stage1")
		EnableInteriorProp(interiorID, "weed_growthh_stage1")
		EnableInteriorProp(interiorID, "weed_growthi_stage3")
		EnableInteriorProp(interiorID, "light_growtha_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthb_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthc_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthd_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthe_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthf_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthg_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthh_stage33_upgrade")
		EnableInteriorProp(interiorID, "light_growthi_stage33_upgrade")
		EnableInteriorProp(interiorID, "weed_upgrade_equip")
		EnableInteriorProp(interiorID, "weed_drying")
		EnableInteriorProp(interiorID, "weed_security_upgrade")
		EnableInteriorProp(interiorID, "weed_production")
		EnableInteriorProp(interiorID, "weed_set_up")
		EnableInteriorProp(interiorID, "weed_chairs")
		RefreshInterior(interiorID)	
	end]]

--[[interiorID = GetInteriorAtCoords(1121.897, -3195.338, -40.4025)  -- Lavagem de Dinheiro
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "counterfeit_security")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100a") 
		EnableInteriorProp(interiorID, "counterfeit_cashpile100b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile100d")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile20d")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10a")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10b")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10c")
		EnableInteriorProp(interiorID, "counterfeit_cashpile10d")
		EnableInteriorProp(interiorID, "counterfeit_setup")
		EnableInteriorProp(interiorID, "counterfeit_upgrade_equip")
		EnableInteriorProp(interiorID, "dryera_open")
		EnableInteriorProp(interiorID, "dryerb_on")
		EnableInteriorProp(interiorID, "dryerc_on")
		EnableInteriorProp(interiorID, "dryerd_on")
		EnableInteriorProp(interiorID, "money_cutter")
		EnableInteriorProp(interiorID, "special_chairs")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(1009.5, -3196.6, -38.99682)  -- Metanfetamina
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "meth_lab_upgrade")
		EnableInteriorProp(interiorID, "meth_lab_production")
		EnableInteriorProp(interiorID, "meth_lab_security_high")
		EnableInteriorProp(interiorID, "meth_lab_setup")
		EnableInteriorProp(interiorID, "meth_lab_empty") --Teste
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(899.5518,-3246.038, -98.04907)  -- bunker
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "bunker_style_c")
		EnableInteriorProp(interiorID, "upgrade_bunker_set")
		EnableInteriorProp(interiorID, "security_upgrade")
		EnableInteriorProp(interiorID, "office_upgrade_set")
		EnableInteriorProp(interiorID, "gun_range_blocker_set")
		EnableInteriorProp(interiorID, "gun_wall_blocker")
		EnableInteriorProp(interiorID, "gun_range_lights")
		EnableInteriorProp(interiorID, "gun_locker_upgrade")
		EnableInteriorProp(interiorID, "Gun_schematic_set")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(-1150.7,-1520.7,10.6)  -- Casinha do Trevor na Praia
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "swap_clean_apt")
		EnableInteriorProp(interiorID, "layer_debra_pic")
		EnableInteriorProp(interiorID, "layer_whiskey")
		EnableInteriorProp(interiorID, "swap_sofa_A")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(-47.1,-1115.3,26.5)  -- Concessionária
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "csr_beforeMission")
		EnableInteriorProp(interiorID, "csr_inMission")
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(-802.3,175.0,72.8)  -- Mansão do Michael
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "V_Michael_bed_tidy")
		EnableInteriorProp(interiorID, "V_Michael_M_items")
		EnableInteriorProp(interiorID, "V_Michael_D_items")
		EnableInteriorProp(interiorID, "V_Michael_S_items")
		EnableInteriorProp(interiorID, "V_Michael_L_Items")
		RefreshInterior(interiorID)
	end

--[[
interiorID = GetInteriorAtCoords(1107.0,-3157.3,-37.5)  -- Motoclube
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "coke_stash1")
		EnableInteriorProp(interiorID, "coke_stash2")
		EnableInteriorProp(interiorID, "coke_stash3")
		EnableInteriorProp(interiorID, "decorative_02")
		EnableInteriorProp(interiorID, "furnishings_02")
		EnableInteriorProp(interiorID, "walls_01")
		EnableInteriorProp(interiorID, "mural_02")
		EnableInteriorProp(interiorID, "gun_locker")
		EnableInteriorProp(interiorID, "mod_booth")
		RefreshInterior(interiorID)
	end
  
interiorID = GetInteriorAtCoords(998.4,-3164.7,-38.9)  -- Motoclube2
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "coke_large")
		EnableInteriorProp(interiorID, "decorative_01")
		EnableInteriorProp(interiorID, "furnishings_01")
		EnableInteriorProp(interiorID, "walls_01")
		EnableInteriorProp(interiorID, "lower_walls_default")
		EnableInteriorProp(interiorID, "gun_locker")
		EnableInteriorProp(interiorID, "mod_booth")
		RefreshInterior(interiorID)
	end
	]]
interiorID = GetInteriorAtCoords(1163.8,-3195.7,-39.0)  -- Escritório Andrade
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "chair01")
		EnableInteriorProp(interiorID, "chair02")
		EnableInteriorProp(interiorID, "chair03")
		EnableInteriorProp(interiorID, "chair04")
		EnableInteriorProp(interiorID, "chair05")
		EnableInteriorProp(interiorID, "chair06")
		EnableInteriorProp(interiorID, "chair07")
		EnableInteriorProp(interiorID, "clutter")
		EnableInteriorProp(interiorID, "equipment_upgrade")
		EnableInteriorProp(interiorID, "interior_upgrade")
		EnableInteriorProp(interiorID, "production")
		EnableInteriorProp(interiorID, "security_high")
		EnableInteriorProp(interiorID, "set_up")
		RefreshInterior(interiorID)
	end

RequestIpl("imp_impexp_interior_placement_interior_1_impexp")
interiorID = GetInteriorAtCoords(941.10520000,-971.67590000,39.39997000)  -- Import e Export
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "garage_decor_01")
		EnableInteriorProp(interiorID, "garage_decor_02")
		EnableInteriorProp(interiorID, "garage_decor_03")
		EnableInteriorProp(interiorID, "garage_decor_04")
		EnableInteriorProp(interiorID, "lighting_option01")
		EnableInteriorProp(interiorID, "lighting_option02")
		EnableInteriorProp(interiorID, "lighting_option03")
		EnableInteriorProp(interiorID, "lighting_option04")
		EnableInteriorProp(interiorID, "lighting_option05")
		EnableInteriorProp(interiorID, "lighting_option06")
		EnableInteriorProp(interiorID, "lighting_option07")
		EnableInteriorProp(interiorID, "lighting_option08")
		EnableInteriorProp(interiorID, "lighting_option09")
		EnableInteriorProp(interiorID, "numbering_style01_n3")
		EnableInteriorProp(interiorID, "numbering_style02_n3")
		EnableInteriorProp(interiorID, "numbering_style03_n3")
		EnableInteriorProp(interiorID, "numbering_style04_n3")
		EnableInteriorProp(interiorID, "numbering_style05_n3")
		EnableInteriorProp(interiorID, "numbering_style06_n3")
		EnableInteriorProp(interiorID, "numbering_style07_n3")
		EnableInteriorProp(interiorID, "numbering_style08_n3")
		EnableInteriorProp(interiorID, "numbering_style09_n3")
		EnableInteriorProp(interiorID, "floor_vinyl_01")
		EnableInteriorProp(interiorID, "floor_vinyl_02")
		EnableInteriorProp(interiorID, "floor_vinyl_03")
		EnableInteriorProp(interiorID, "floor_vinyl_04")
		EnableInteriorProp(interiorID, "floor_vinyl_05")
		EnableInteriorProp(interiorID, "floor_vinyl_06")
		EnableInteriorProp(interiorID, "floor_vinyl_07")
		EnableInteriorProp(interiorID, "floor_vinyl_08")
		EnableInteriorProp(interiorID, "floor_vinyl_09")
		EnableInteriorProp(interiorID, "floor_vinyl_10")
		EnableInteriorProp(interiorID, "floor_vinyl_11")
		EnableInteriorProp(interiorID, "floor_vinyl_12")
		EnableInteriorProp(interiorID, "floor_vinyl_13")
		EnableInteriorProp(interiorID, "floor_vinyl_14")
		EnableInteriorProp(interiorID, "floor_vinyl_15")
		EnableInteriorProp(interiorID, "floor_vinyl_16")
		EnableInteriorProp(interiorID, "floor_vinyl_17")
		EnableInteriorProp(interiorID, "floor_vinyl_18")
		EnableInteriorProp(interiorID, "floor_vinyl_19")
		EnableInteriorProp(interiorID, "floor_vinyl_19")
		EnableInteriorProp(interiorID, "branded_style_set")
		--EnableInteriorProp(interiorID, "urban_style_set")
		EnableInteriorProp(interiorID, "door_blocker")
		RefreshInterior(interiorID)
	end		

interiorID = GetInteriorAtCoords(-1604.664, -3012.583, -78.00)  -- Galaxy
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID , "Int01_ba_security_upgrade")
		EnableInteriorProp(interiorID , "Int01_ba_equipment_setup")
		EnableInteriorProp(interiorID , "Int01_ba_Style02") -- средний
		EnableInteriorProp(interiorID , "Int01_ba_style02_podium") -- средний
		EnableInteriorProp(interiorID , "int01_ba_lights_screen")
		EnableInteriorProp(interiorID , "Int01_ba_Screen")
		EnableInteriorProp(interiorID , "Int01_ba_bar_content")
		EnableInteriorProp(interiorID , "Int01_ba_dj02")
		EnableInteriorProp(interiorID , "DJ_04_Lights_01")
		EnableInteriorProp(interiorID , "Int01_ba_lightgrid_01")
		EnableInteriorProp(interiorID , "Int01_ba_equipment_upgrade")
		EnableInteriorProp(interiorID , "Int01_ba_clubname_01") -- galaxy
		EnableInteriorProp(interiorID , "Int01_ba_dry_ice")
		EnableInteriorProp(interiorID , "Int01_ba_deliverytruck")
		EnableInteriorProp(interiorID , "Int01_ba_trophy01")
		EnableInteriorProp(interiorID , "Int01_ba_trophy02")
		EnableInteriorProp(interiorID , "Int01_ba_trophy03")
		EnableInteriorProp(interiorID , "Int01_ba_trophy04")
		EnableInteriorProp(interiorID , "Int01_ba_trophy05")
		EnableInteriorProp(interiorID , "Int01_ba_trophy07")
		EnableInteriorProp(interiorID , "Int01_ba_trophy08")
		EnableInteriorProp(interiorID , "Int01_ba_trophy09")
		EnableInteriorProp(interiorID , "Int01_ba_trophy10")
		EnableInteriorProp(interiorID , "Int01_ba_trophy11")
		EnableInteriorProp(interiorID , "Int01_ba_trad_lights")
		EnableInteriorProp(interiorID , "DJ_04_Lights_04")
		EnableInteriorProp(interiorID, "Int01_ba_clubname_01")
		--[[
		---------------------------------------------------------------
		--EnableInteriorProp(interiorID, "Int01_ba_Style01")
		--EnableInteriorProp(interiorID, "Int01_ba_style01_podium")
		---------------------------------------------------------------
		EnableInteriorProp(interiorID, "Int01_ba_Style02")
		EnableInteriorProp(interiorID, "Int01_ba_style02_podium")
		---------------------------------------------------------------
		--EnableInteriorProp(interiorID, "Int01_ba_Style03")
		--EnableInteriorProp(interiorID, "Int01_ba_style03_podium")
		---------------------------------------------------------------
		EnableInteriorProp(interiorID, "Int01_ba_equipment_setup")
		EnableInteriorProp(interiorID, "Int01_ba_equipment_upgrade")
		EnableInteriorProp(interiorID, "Int01_ba_security_upgrade")
		EnableInteriorProp(interiorID, "Int01_ba_dj04")
		------------------------------------------------------
		-- Luzes
		--EnableInteriorProp(interiorID, "DJ_01_Lights_01") --Amarelo
		EnableInteriorProp(interiorID, "DJ_02_Lights_01") --Verde
		--EnableInteriorProp(interiorID, "DJ_03_Lights_01") --Branco
		EnableInteriorProp(interiorID, "DJ_04_Lights_01") --Cyan
		-- Neon
		--EnableInteriorProp(interiorID, "DJ_01_Lights_02") --Amarelo
		--EnableInteriorProp(interiorID, "DJ_02_Lights_02") --Branco
		EnableInteriorProp(interiorID, "DJ_03_Lights_02") --Purple
		EnableInteriorProp(interiorID, "DJ_04_Lights_02") --Cyan
		-- Bands
		EnableInteriorProp(interiorID, "DJ_01_Lights_03") --Amarelo
		--EnableInteriorProp(interiorID, "DJ_02_Lights_03") --Verde
		EnableInteriorProp(interiorID, "DJ_03_Lights_03") --Branco
		--EnableInteriorProp(interiorID, "DJ_04_Lights_03") --Purple
		-- Lasers
		--EnableInteriorProp(interiorID, "DJ_01_Lights_04") --Amarelo
		EnableInteriorProp(interiorID, "DJ_02_Lights_04") --Verde
		--EnableInteriorProp(interiorID, "DJ_03_Lights_04") --Branco
		EnableInteriorProp(interiorID, "DJ_04_Lights_04") --Purple
		------------------------------------------------------
		--DisableInteriorProp(interiorID, "Int01_ba_Worklamps")
		EnableInteriorProp(interiorID, "Int01_ba_bar_content")
		--EnableInteriorProp(interiorID, "Int01_ba_booze_01")
		--EnableInteriorProp(interiorID, "Int01_ba_booze_02")
		--EnableInteriorProp(interiorID, "Int01_ba_booze_03")
		EnableInteriorProp(interiorID, "Int01_ba_trophy01")
		--EnableInteriorProp(interiorID, "Int01_ba_Clutter")
		EnableInteriorProp(interiorID, "Int01_ba_deliverytruck")
		EnableInteriorProp(interiorID, "Int01_ba_dry_ice")
		EnableInteriorProp(interiorID, "light_rigs_off")
		EnableInteriorProp(interiorID, "Int01_ba_lightgrid_01")
		EnableInteriorProp(interiorID, "Int01_ba_trad_lights")
		EnableInteriorProp(interiorID, "Int01_ba_trophy04")
		EnableInteriorProp(interiorID, "Int01_ba_trophy05")
		EnableInteriorProp(interiorID, "Int01_ba_trophy06")
		EnableInteriorProp(interiorID, "Int01_ba_trophy07")
		EnableInteriorProp(interiorID, "Int01_ba_trophy08")
		EnableInteriorProp(interiorID, "Int01_ba_trophy09")
		EnableInteriorProp(interiorID, "Int01_ba_trophy10")
		EnableInteriorProp(interiorID, "Int01_ba_trophy11")]]
		RefreshInterior(interiorID)
	end

--[[interiorID = GetInteriorAtCoords(1093.6, -3196.6, -38.99841)  -- Cocaína
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "coke_cut_01")
		EnableInteriorProp(interiorID, "coke_cut_02")
		EnableInteriorProp(interiorID, "coke_cut_03")
		EnableInteriorProp(interiorID, "coke_cut_04")
		EnableInteriorProp(interiorID, "coke_cut_05")
		EnableInteriorProp(interiorID, "set_up")
		EnableInteriorProp(interiorID, "security_high")
		EnableInteriorProp(interiorID, "production_upgrade")
		EnableInteriorProp(interiorID, "table_equipment_upgrade")
		EnableInteriorProp(interiorID, "equipment_basic")
		EnableInteriorProp(interiorID, "equipment_upgrade")
		EnableInteriorProp(interiorID, "coke_press_upgrade")
		RefreshInterior(interiorID)
	end]]
end)



----------------------------------------------------------------------------------------------
-- Boate Galaxy ------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--[[ Exterior Items
RequestIpl("ba_barriers_case5")
RequestIpl("ba_case5_solomun")

local EntitySets = { "Int01_ba_security_upgrade", "Int01_ba_equipment_setup", "Int01_ba_Style02", "Int01_ba_style02_podium", "int01_ba_lights_screen", 
					"Int01_ba_Screen", "Int01_ba_bar_content", "Int01_ba_dj02", "DJ_04_Lights_01", "Int01_ba_lightgrid_01", "Int01_ba_equipment_upgrade", 
					"Int01_ba_clubname_01", "Int01_ba_dry_ice", "Int01_ba_deliverytruck", "Int01_ba_trophy04", "Int01_ba_trophy05", "Int01_ba_trophy07", "Int01_ba_trophy09", 
					"Int01_ba_trophy08", "Int01_ba_trophy11", "Int01_ba_trophy10", "Int01_ba_trophy03", "Int01_ba_trophy01", "Int01_ba_trophy02", "Int01_ba_trad_lights", "DJ_04_Lights_04" }

local function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

local function Button(ControlButton)
    PushScaleformMovieMethodParameterButtonName(ControlButton)
end

local function setupScaleform(scaleform, itemString, button)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
	if button ~= nil then
		Button(GetControlInstructionalButton(2, 38, true))
	end
    ButtonMessage(itemString)
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

local intLoc = vec3(-1569.4, -3017.0, -74.5-0.6)
local extLoc = vec3(4.35, 220.43, 107.72-0.6) -- (-1285.0, -652.2, 26.5)  
local intID = GetInteriorAtCoords(intLoc)

local clubsmoke = {
	{vec(-1600.0, -3012.0, -78.2),vec(0.0, 0.0, 0.0)},
	{vec(-1595.0, -3012.0, -78.2),vec(0.0, 0.0, 0.0)},
	{vec(-1590.0, -3012.0, -78.2),vec(0.0, 0.0, 0.0)},
	{vec(-1602.932, -3019.1, -78.2),vec(0.0, -10.0, 66.0)},
	{vec(-1593.238, -3017.05, -78.2),vec(0.0, -10.0, 110.0)},
	{vec(-1597.134, -3008.2, -78.2),vec(0.0, -10.0, -122.53)},
	{vec(-1589.966, -3008.518, -78.2),vec(0.0, -10.0, -166.97)},
}
local spawnedclubsmoke = {}
local smokemachines = {
	{vec(-1602.932, -3019.1, -79.99),vec(0.0, -10.0, 66.0)},
	{vec(-1593.238, -3017.05, -79.99),vec(0.0, -10.0, 110.0)},
	{vec(-1597.134, -3008.2, -79.99),vec(0.0, -10.0, -122.53)},
	{vec(-1589.966, -3008.518, -79.99),vec(0.0, -10.0, -166.97)},
}
local spawnedsmokemachines = {}

local InsidePeds = {
	["Bouncer1"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1568.34, -3002.85, -76.21), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1568.34, -3002.85, -76.21), 146.68},
	["Bouncer2"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1576.45, -3010.22, -79.01), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1576.45, -3010.22, -79.01), 4.69},
	["Bouncer3"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1602.02, -3018.44, -79.01), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1602.02, -3018.44, -79.01), 321.31},
	["Bouncer4"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1605.83, -3007.60, -76.00), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1605.83, -3007.60, -76.00), 318.89},
	["Bouncer5"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1609.64, -3005.60, -79.01), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1609.64, -3005.60, -79.01), 177.59},
	["Bouncer6"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1590.43, -3014.74, -79.01), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1590.43, -3014.74, -79.01), 93.51},
	["Bouncer7"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1581.97, -3019.10, -79.01), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1581.97, -3019.10, -79.01), 336.55},
	["Bouncer8"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1600.48, -3005.26, -79.01), 0.0, "WORLD_HUMAN_GUARD_STAND", vec3(-1600.48, -3005.26, -79.01), 98.54},
	["Bouncer9"] 		= {false, 25, "s_m_m_bouncer_01", vec3(-1570.64, -3017.02, -74.41), 0.0, "WORLD_HUMAN_CLIPBOARD", vec3(-1570.64, -3017.02, -74.41), 271.0},
	["Bar1"] 			= {false, 25, "s_f_y_clubbar_01", vec3(-1576.27, -3016.55, -79.90), 0.0},
	["Bar2"] 			= {false, 25, "s_f_y_clubbar_01", vec3(-1578.14, -3016.54, -79.90), 0.0},
	["Bar3"] 			= {false, 25, "s_f_y_clubbar_01", vec3(-1585.03, -3012.61, -76.90), 90.0},
	["EntranceG"] 		= {false, 25, "s_f_y_clubbar_01", vec3(-1585.03, -3012.61, -76.90), 0.0, "PROP_HUMAN_SEAT_CHAIR", vec3(-1572.17, -3013.49, -74.70), 270.94},
	["Ped1"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1591.61, -3014.70, -79.01), 73.43},
	["Ped2"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1591.94, -3012.29, -79.01), 107.62},
	["Ped3"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1591.96, -3009.93, -79.01), 82.72},
	["Ped4"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1593.59, -3011.18, -79.01), 100.0},
	["Ped5"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1594.87, -3013.23, -79.01), 75.41},
	["Ped6"] 			= {false, 25, "a_f_y_clubcust_03", vec3(-1595.68, -3010.11, -79.01), 194.32},
	["Ped7"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1596.82, -3011.57, -79.01), 97.57},
	["Ped8"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1598.66, -3009.65, -79.01), 119.44},
	["Ped9"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1599.12, -3012.36, -79.01), 69.83},
	["Ped10"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1599.42, -3014.96, -79.01), 57.0},
	["Ped11"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1596.74, -3016.31, -79.01), 48.74},
	["Ped12"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1594.35, -3014.95, -79.01), 57.77},
	["Ped13"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1586.53, -3018.35, -79.01), 52.63},
	["Ped17"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1592.70, -3013.63, -79.01), 101.83},
	["Ped18"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1593.22, -3012.22, -79.01), 85.53},
	["Ped19"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1595.02, -3011.57, -79.01), 85.20},
	["Ped20"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1596.83, -3013.09, -79.01), 91.70},
	["Ped21"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1596.73, -3014.52, -79.01), 64.99},
	["Ped22"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1598.19, -3013.81, -79.01), 91.67},
	["Ped23"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1598.28, -3010.85, -79.01), 91.95},
	["Ped24"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1598.30, -3008.66, -79.01), 93.34},
	["Ped25"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1594.16, -3009.05, -79.01), 94.50},
	["Ped26"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1596.49, -3009.58, -79.01), 130.58},
	["Ped27"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1592.29, -3011.15, -79.01), 90.83},
	["Ped28"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1594.10, -3010.15, -79.01), 101.0},
	["Ped29"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1592.94, -3009.56, -79.01), 145.43},
	["Ped30"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1596.83, -3009.62, -79.01), 39.07},
	["Ped31"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1598.05, -3012.60, -79.01), 43.05},
	["Ped32"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1599.63, -3010.95, -79.01), 151.02},
	["Ped33"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1599.99, -3009.83, -79.01), 198.20},
	["Ped14"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1588.40, -3005.26, -79.01), 199.0, "WORLD_HUMAN_PARTYING", vec3(-1588.40, -3005.26, -80.01), 199.0},
	["Ped15"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1587.01, -3009.02, -79.01), 24.60, "WORLD_HUMAN_PARTYING", vec3(-1587.01, -3009.02, -80.01), 24.60},
	["Ped16"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1587.34, -3006.65, -79.01), 197.9, "WORLD_HUMAN_PARTYING", vec3(-1587.34, -3006.65, -80.01), 197.92},
	["Ped34"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1591.08, -3018.12, -76.00), 90.0},
	["Ped35"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1591.11, -3014.44, -76.00), 90.0},
	["Ped36"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1591.02, -3012.08, -76.00), 90.0},
	["Ped37"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1591.05, -3009.95, -76.00), 90.0},
	["Ped38"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1595.41, -3007.81, -76.00), 180.0},
	["Ped39"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1596.58, -3007.87, -76.00), 180.0},
	["Ped40"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1601.03, -3007.79, -76.00), 180.0},
	["Ped41"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1606.51, -3014.80, -77.80), 306.0},
	["Ped42"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1606.49, -3013.09, -77.80), 270.0},
	["Ped43"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1606.38, -3011.03, -77.80), 214.0},
	["Ped44"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1568.34, -3012.15, -74.41), 150.0, "WORLD_HUMAN_PARTYING", vec3(-1568.34, -3012.15, -74.41), 150.0},
	["Ped45"] 			= {false, 25, "a_f_y_clubcust_03", vec3(-1568.22, -3013.81, -74.41), 47.0, "WORLD_HUMAN_PARTYING", vec3(-1568.22, -3013.81, -74.41), 47.0},
	["Ped46"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1568.17, -3010.00, -74.41), 90.0, "WORLD_HUMAN_PARTYING", vec3(-1568.17, -3010.00, -74.41), 90.0},
	["Ped47"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1568.14, -3015.86, -74.41), 90.0, "WORLD_HUMAN_PARTYING", vec3(-1568.14, -3015.86, -74.41), 90.0},
	["Ped48"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1588.13, -3014.39, -79.01), 0.0, "WORLD_HUMAN_LEANING", vec3(-1588.13, -3014.39, -79.01), 0.0},
	["Ped49"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1588.98, -3007.61, -79.01), 270.0, "WORLD_HUMAN_LEANING", vec3(-1588.98, -3007.61, -79.01), 270.0},
	["Ped50"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1586.65, -3016.72, -79.01), 200.0, "WORLD_HUMAN_PARTYING", vec3(-1586.65, -3016.72, -79.01), 200.0},
	["Ped51"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1575.39, -3011.80, -79.01), 177.0, "WORLD_HUMAN_PARTYING", vec3(-1575.39, -3011.80, -79.01), 177.0},
	["Ped52"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1575.58, -3014.17, -79.01), 70.0, "WORLD_HUMAN_PARTYING", vec3(-1575.58, -3014.17, -79.01), 70.0},
	["Ped54"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1570.84, -3009.40, -74.41), 275.25, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1570.84, -3009.40, -74.41), 275.25},
	["Ped55"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1578.37, -3004.63, -79.01), 321.74, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1578.37, -3004.63, -79.01), 321.74},
	["Ped56"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1576.12, -3002.58, -79.01), 186.09, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1578.42, -3003.13, -79.01), 321.74},
	["Ped57"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1587.09, -3012.71, -79.01), 60.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1576.12, -3002.58, -79.01), 186.09},
	["Ped58"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1589.24, -3018.74, -79.01), 18.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1587.09, -3012.71, -79.01), 6.0},
	["Ped59"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1591.16, -3018.88, -79.01), 290.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1589.24, -3018.74, -79.01), 18.0},
	["Ped60"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1605.06, -3004.88, -76.00), 214.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1591.16, -3018.88, -79.01), 290.0},
	["Ped61"] 			= {false, 25, "a_m_y_clubcust_01", vec3(-1603.08, -3004.83, -76.00), 141.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1605.06, -3004.88, -76.00), 214.0},
	["Ped62"] 			= {false, 25, "a_f_y_clubcust_03", vec3(-1593.70, -3004.48, -76.00), 167.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1603.08, -3004.83, -76.00), 141.0},
	["Ped63"] 			= {false, 25, "a_m_y_clubcust_03", vec3(-1577.43, -3002.77, -79.01), 0.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1577.43, -3002.77, -79.01), 104.38},
	["Ped64"] 			= {false, 25, "a_f_y_clubcust_01", vec3(-1577.49, -3003.92, -79.01), 0.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1577.49, -3003.92, -79.01), 86.69},
	["Ped65"] 			= {false, 25, "a_f_y_clubcust_03", vec3(-1575.35, -3009.11, -79.01), 0.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1575.35, -3009.11, -79.01), 11.50},
	["Ped66"] 			= {false, 25, "a_f_y_clubcust_02", vec3(-1575.74, -3006.54, -79.01), 0.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1575.74, -3006.54, -79.01), 213.43},
	["Ped67"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1590.06, -3016.99, -79.01), 0.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1590.06, -3016.99, -79.01), 189.97},
	["Ped68"] 			= {false, 25, "a_m_y_clubcust_02", vec3(-1590.07, -3018.58, -79.01), 0.0, "WORLD_HUMAN_HANG_OUT_STREET", vec3(-1590.07, -3018.58, -79.01), 104.23},
	["SittingGirl"] 	= {false, 25, "a_f_y_clubcust_02", vec3(-1612.689, -3010.791, -80.2060), -90.0},
	["Attendant"] 		= {false, 25, "s_m_y_clubbar_01", vec3(-1611.937, -3009.152, -79.2519), 0.0, "PROP_HUMAN_SEAT_CHAIR", vec3(-1611.937, -3009.152, -79.2519), -131.39},
	["PhoneGuy"] 		= {false, 25, "a_m_y_business_02", vec3(-1611.937, -3009.152, -79.2519), 0.0, "WORLD_HUMAN_STAND_MOBILE", vec3(-1611.21, -3018.67, -79.01), 0.0},
	["VomittingFemale"] = {false, 25, "s_f_y_hooker_02", vec3(-1609.22, -3015.61, -80.01), 270.0},
	["DJ"] 				= {false, 25, "ig_sol", vec3(-1602.78, -3012.62, -78.80), 270.0},
	["Dancer1"] 		= {false, 25, "u_f_y_dancerave_01", vec3(-1596.14, -3008.08, -79.21), 200.0},
	["Dancer2"] 		= {false, 25, "u_f_y_dancerave_01", vec3(-1598.42, -3015.70, -79.21), 352.0},
	["Tony"]			= {false, 25, "ig_tonyprince", vec3(-1572.28, -571.89, 108.52), 0.0, "WORLD_HUMAN_STAND_MOBILE", vec3(-1607.90, -3014.93, -75.21), 94.46},
}

local PedComponents = {
	["EntranceG"] 		= {false, 0, 3, 0, 0},
	["EntranceG"] 		= {false, 2, 3, 0, 0},
	["EntranceG"] 		= {false, 3, 3, 0, 0},
	["EntranceG"] 		= {false, 4, 1, 0, 0},
	["EntranceG"] 		= {false, 8, 1, 0, 0},
	["Bar1"] 			= {false, 0, 0, 0, 0},
	["Bar1"] 			= {false, 2, 0, 0, 0},
	["Bar1"] 			= {false, 3, 0, 0, 0},
	["Bar1"] 			= {false, 4, 0, 0, 0},
	["Bar1"] 			= {false, 8, 0, 0, 0},
	["Bar2"] 			= {false, 0, 2, 0, 0},
	["Bar2"] 			= {false, 2, 2, 0, 0},
	["Bar2"] 			= {false, 3, 2, 0, 0},
	["Bar2"] 			= {false, 4, 1, 0, 0},
	["Bar2"] 			= {false, 8, 0, 0, 0},
	["Bar3"] 			= {false, 0, 4, 0, 0},
	["Bar3"] 			= {false, 2, 4, 0, 0},
	["Bar3"] 			= {false, 3, 4, 0, 0},
	["Bar3"] 			= {false, 4, 0, 0, 0},
	["Bar3"] 			= {false, 8, 1, 0, 0},
}

local PedAnims = {
	["Bar1"] 			= {false, "mini@strip_club@drink@idle_a", "idle_a_bartender"},
	["Bar2"] 			= {false, "mini@strip_club@drink@idle_a", "idle_a_bartender"},
	["Bar3"] 			= {false, "mini@strip_club@drink@idle_a", "idle_a_bartender"},
	["Ped1"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center"},
	["Ped2"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_down"},
	["Ped3"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_right"},   
	["Ped4"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left"},
	["Ped5"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center_up"},
	["Ped6"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_right"},
	["Ped7"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_right"},
	["Ped8"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_center_down"},
	["Ped9"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_left"},
	["Ped10"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left_up"},
	["Ped11"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center_up"},
	["Ped12"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right_up"},
	["Ped13"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "med_center"}, 
	["Ped17"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down"},
	["Ped18"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center"},
	["Ped19"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_left"},  
	["Ped20"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_left"},
	["Ped21"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center"},
	["Ped22"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center"},
	["Ped23"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down"},
	["Ped24"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_center_up"},
	["Ped25"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_left"},
	["Ped26"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right"},
	["Ped27"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_center"}, 
	["Ped28"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center_down"},
	["Ped29"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_right"},
	["Ped30"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center"},
	["Ped31"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up"},
	["Ped32"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_left"},
	["Ped33"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center_down"},
	["Ped34"] 			= {false, "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_06_base_female^1"},
	["Ped35"] 			= {false, "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_06_base_male^1"},
	["Ped36"] 			= {false, "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_06_base_male^3"},
	["Ped37"] 			= {false, "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_06_base_male^6"},  
	["Ped38"] 			= {false, "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_06_base_female^4"},
	["Ped39"] 			= {false, "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_06_base_male^4"},
	["Ped40"] 			= {false, "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_06_base_female^2"},
	["Ped41"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_right"},
	["Ped42"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_center_down"},
	["Ped43"] 			= {false, "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_left"},
	["SittingGirl"] 	= {false, "anim@amb@nightclub@peds@", "amb_world_human_seat_wall_female_hands_by_sides_idle_c"},
	["VomittingFemale"] = {false, "timetable@tracy@ig_7@base", "base"},
	["DJ"] 				= {false, "anim@amb@nightclub@djs@solomun@", "sol_idle_ctr_mid_a_sol"},
	["Dancer1"] 		= {false, "anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_female^2"},
	["Dancer2"] 		= {false, "anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5"},
}

function RequestEntModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do Citizen.Wait(0) end
	SetModelAsNoLongerNeeded(model)
end

function playAnim(ped, animDict, animName)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, -1, 1, 1, false, false, false)
	RemoveAnimDict(animDict)
end

function CreatePeds()
	for k,v in pairs(InsidePeds) do
		if not v[1] then
			RequestEntModel(v[3])
			v[1] = CreatePed(v[2], v[3], v[4], v[5], false, true)
			if v[6] ~= nil then
				TaskStartScenarioAtPosition(v[1], v[6], v[7], v[8], -1, false, true)
			end
			SetModelAsNoLongerNeeded(v[2])
		end
		for q,t in pairs(PedComponents) do
			if q == k then
				t[1] = v[1]
			end
		end
		for i,o in pairs(PedAnims) do
			if i == k then
				o[1] = v[1]
			end
		end
		if k == "Dancer1" or k == "Dancer2" then
			FreezeEntityPosition(v[1], true)
		end
		if k == "Tony" then
			SetPedPropIndex(v[1], 1, 0, 0, true)
		end
		SetPedAsEnemy(v[1], false)
		SetBlockingOfNonTemporaryEvents(v[1], true)
		SetPedResetFlag(v[1], 249, true)
		SetPedConfigFlag(v[1], 185, true)
		SetPedConfigFlag(v[1], 108, true)
		SetPedConfigFlag(v[1], 106, true)
		SetPedCanEvasiveDive(v[1], false)
		N_0x2f3c3d9f50681de4(v[1], 1)
		SetPedCanRagdollFromPlayerImpact(v[1], false)
		SetPedCanRagdoll(v[1], false)
		SetPedConfigFlag(v[1], 208, true)
	end
	for k,v in pairs(PedComponents) do
		SetPedComponentVariation(v[1], v[2], v[3], v[4], v[5])
	end
	for k,v in pairs(PedAnims) do
		playAnim(v[1], v[2], v[3])
	end
end

function CreateNamedRenderTargetForModel(name, model)
	local handle = 0
	if not IsNamedRendertargetRegistered(name) then
		RegisterNamedRendertarget(name, 0)
	end
	if not IsNamedRendertargetLinked(model) then
		LinkNamedRendertarget(model)
	end
	if IsNamedRendertargetRegistered(name) then
		handle = GetNamedRendertargetRenderId(name)
	end
	return handle
end

function DrawMyNotification(title, subject, msg, icon, iconType)
	SetNotificationBackgroundColor(150)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, false)
end

function showClubNotification(msg)
	DrawMyNotification('Galaxy Nightclub', 'Tony Prince', msg, "CHAR_TONY_PRINCE", 1)
end]]

--[[function EnterClub()
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	BeginTextCommandBusyString("FMMC_PLYLOAD")
	EndTextCommandBusyString(4)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	if IsPedArmed(GetPlayerPed(-1), 7) then
		SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED" ,true)
	end
	RequestIpl("ba_int_placement_ba_interior_0_dlc_int_01_ba_milo_")
	for _, EntitySet in ipairs(EntitySets) do
		ActivateInteriorEntitySet(intID, EntitySet)
	end
	RefreshInterior(intID)
	--CreatePeds()
    RequestNamedPtfxAsset("scr_ba_club")
	while not HasNamedPtfxAssetLoaded("scr_ba_club") do Citizen.Wait(0) end
    for i,v in ipairs(clubsmoke) do
        if not DoesParticleFxLoopedExist(spawnedclubsmoke[i]) then
            UseParticleFxAssetNextCall("scr_ba_club")
            spawnedclubsmoke[i] = StartParticleFxLoopedAtCoord("scr_ba_club_smoke", v[1], v[2], 1.0, 0, 0, 0, 1)
            SetParticleFxLoopedColour(spawnedclubsmoke[i], 255.0, 255.0, 255.0, 1)
        end
	end
	for i,v in ipairs(smokemachines) do
        if not DoesParticleFxLoopedExist(spawnedsmokemachines[i]) then
            UseParticleFxAssetNextCall("scr_ba_club")
            spawnedsmokemachines[i] = StartParticleFxLoopedAtCoord("scr_ba_club_smoke_machine", v[1], v[2], 5.0, 0, 0, 0, 1)
            SetParticleFxLoopedColour(spawnedsmokemachines[i], 255.0, 255.0, 255.0, 1)
        end
    end
	RemovePtfxAsset("scr_ba_club")
	local tvmodel = "ba_prop_club_screens_01"
	local tvpos = vec3(-1600.02, -3012.55, -77.71)
	local tventity = GetClosestObjectOfType(tvpos, 0.05, tvmodel, 0, 0, 0)
	local handle = CreateNamedRenderTargetForModel("club_projector", tvmodel)
	Citizen.CreateThread(function()
		while true do
			SetTextRenderId(handle)
			SetUiLayer(4)
			SetScriptGfxDrawBehindPausemenu(1)
			DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
			SetTextRenderId(GetDefaultScriptRendertargetRenderId())
			SetScriptGfxDrawBehindPausemenu(0)
			Citizen.Wait(0)
		end
	end)
	LoadTvChannelSequence(0, "PL_SOL_LED_GALAXY", 1)
	SetTvAudioFrontend(1)
	SetTvVolume(-1.0)
	SetTvChannel(0)
	SetEntityCoords(GetPlayerPed(-1), intLoc)
	SetEntityHeading(GetPlayerPed(-1), 0.0)
	SetGameplayCamRelativeHeading(0.0)
	Citizen.Wait(1000)
	RemoveLoadingPrompt()
	DoScreenFadeIn(2000)
	Citizen.Wait(1000)
	--for k,v in pairs(InsidePeds) do
	--	FreezeEntityPosition(v[1], true)
	--end
	showClubNotification("Propriedade PRIVADA. Qualquer indício de violência irá gerar expulsão")
end]]

--[[function ExitClub()
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	BeginTextCommandBusyString("FMMC_PLYLOAD")
	EndTextCommandBusyString(4)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	for _, EntitySet in ipairs(EntitySets) do
		DeactivateInteriorEntitySet(intID, EntitySet)
	end
	RefreshInterior(intID)
	RemoveIpl("ba_int_placement_ba_interior_0_dlc_int_01_ba_milo_")
	DeletePeds()
	EnableAllControlActions(0)
	SetEntityCoords(GetPlayerPed(-1), extLoc)
	SetEntityHeading(GetPlayerPed(-1), 42.0)
	SetGameplayCamRelativeHeading(0.0)
	Citizen.Wait(1000)
	RemoveLoadingPrompt()
	DoScreenFadeIn(2000)
	Citizen.Wait(1000)
end]]

--[[Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if GetInteriorAtCoords(GetEntityCoords(GetPlayerPed(-1))) == 271617 then
			--if not DoesEntityExist(InsidePeds["Bouncer1"][1]) then
			--	ExitClub()
			--end
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 37, true)
			DisableControlAction(0, 140, true)
		end
		if #(GetEntityCoords(GetPlayerPed(-1)) - extLoc) < 50.0 then
			DrawMarker(21, extLoc, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5 ,0.5 ,0.4 , 255 , 230 , 100 , 100 , false, true, 2, true, false, false, false)
			if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				if #(GetEntityCoords(GetPlayerPed(-1)) - extLoc) < 1.0 then
					form = setupScaleform("instructional_buttons", "Enter Club", 38)
					DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)
					if IsControlJustReleased(2, 38) then
						EnterClub()
					end
				end
			end
		end
		if #(GetEntityCoords(GetPlayerPed(-1)) - intLoc) < 15.0 then
			DrawMarker(21, intLoc, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5 ,0.5 ,0.4 , 255 , 230 , 100 , 100 , false, true, 2, true, false, false, false)
			if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				if #(GetEntityCoords(GetPlayerPed(-1)) - intLoc) < 1.0 then
					form = setupScaleform("instructional_buttons", "Exit Club", 38)
					DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)
					if IsControlJustReleased(2, 38) then
						ExitClub()
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	clubBlip = AddBlipForCoord(extLoc)
	SetBlipDisplay(clubBlip, 4)
	SetBlipSprite(clubBlip, 93)
	SetBlipColour(clubBlip, 4)
	SetBlipScale(clubBlip, 0.6)
	SetBlipAsShortRange(clubBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Galaxy Nightclub")
	EndTextCommandSetBlipName(clubBlip)
end)]]




-----------------------------------------------------------------------------------------------------
-- Favela Barragem ----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()

	-- lafa2k favela grátis (otimização da favela da barragem criada pelo oldbob)
	RequestIpl("lafa2k_int_favela_gratis_01")
	RequestIpl("lafa2k_int_favela_gratis_02")
	RequestIpl("lafa2k_int_favela_gratis_03")
	RequestIpl("lafa2k_int_favela_gratis_04")
	RequestIpl("lafa2k_int_favela_gratis_05")
	RequestIpl("lafa2k_int_favela_gratis_06")
	RequestIpl("lafa2k_int_favela_gratis_07")
	RequestIpl("lafa2k_int_favela_gratis_08")
	RequestIpl("lafa2k_int_favela_gratis_09")
	RequestIpl("lafa2k_int_favela_gratis_10")
	RequestIpl("lafa2k_int_favela_gratis_11")
	RequestIpl("lafa2k_int_favela_gratis_12")
	RequestIpl("lafa2k_int_favela_gratis_13")
	RequestIpl("lafa2k_int_favela_gratis_14")
	RequestIpl("lafa2k_int_favela_gratis_15")
	RequestIpl("lafa2k_int_favela_gratis_16")
	RequestIpl("lafa2k_int_favela_gratis_17")
	RequestIpl("lafa2k_int_favela_gratis_18")
	RequestIpl("lafa2k_int_favela_gratis_19")
	RequestIpl("lafa2k_int_favela_gratis_20")
	RequestIpl("lafa2k_int_favela_gratis_21")
	RequestIpl("lafa2k_int_favela_gratis_22")
	RequestIpl("lafa2k_int_favela_gratis_23")
	RequestIpl("lafa2k_int_favela_gratis_24")
	RequestIpl("lafa2k_int_favela_gratis_25")
	RequestIpl("lafa2k_int_favela_gratis_26")
	RequestIpl("lafa2k_int_favela_gratis_27")
	RequestIpl("lafa2k_int_favela_gratis_28")
	RequestIpl("lafa2k_int_favela_gratis_29")
	RequestIpl("lafa2k_int_favela_gratis_30")
	RequestIpl("lafa2k_int_favela_gratis_31")
	RequestIpl("lafa2k_int_favela_gratis_32")
	RequestIpl("lafa2k_int_favela_gratis_33")
	RequestIpl("lafa2k_int_favela_gratis_34")
	RequestIpl("lafa2k_int_favela_gratis_35")
	RequestIpl("lafa2k_int_favela_gratis_36")
	RequestIpl("lafa2k_int_favela_gratis_37")
	RequestIpl("lafa2k_int_favela_gratis_38")
	RequestIpl("lafa2k_int_favela_gratis_39")
	RequestIpl("lafa2k_int_favela_gratis_40")
	RequestIpl("lafa2k_int_favela_gratis_41")
	RequestIpl("lafa2k_int_favela_gratis_42")
	RequestIpl("lafa2k_int_favela_gratis_43")
	RequestIpl("lafa2k_int_favela_gratis_44")
	RequestIpl("lafa2k_int_favela_gratis_45")
	RequestIpl("lafa2k_int_favela_gratis_46")
	RequestIpl("lafa2k_int_favela_gratis_47")
	RequestIpl("lafa2k_int_favela_gratis_48")
	RequestIpl("lafa2k_int_favela_gratis_49")
	RequestIpl("lafa2k_int_favela_gratis_50")
	RequestIpl("lafa2k_int_favela_gratis_51")
	RequestIpl("lafa2k_int_favela_gratis_52")
	RequestIpl("lafa2k_int_favela_gratis_53")
	RequestIpl("lafa2k_int_favela_gratis_54")
	RequestIpl("lafa2k_int_favela_gratis_55")
	RequestIpl("lafa2k_int_favela_gratis_56")
	RequestIpl("lafa2k_int_favela_gratis_57")
	RequestIpl("lafa2k_int_favela_gratis_58")
	RequestIpl("lafa2k_int_favela_gratis_59")
	RequestIpl("lafa2k_int_favela_gratis_60")
	RequestIpl("lafa2k_int_favela_gratis_61")
	RequestIpl("lafa2k_int_favela_gratis_62")
	RequestIpl("lafa2k_int_favela_gratis_63")
	RequestIpl("lafa2k_int_favela_gratis_64")
	RequestIpl("lafa2k_int_favela_gratis_65")
	RequestIpl("lafa2k_int_favela_gratis_66")
	RequestIpl("lafa2k_int_favela_gratis_67")
	RequestIpl("lafa2k_int_favela_gratis_68")
	RequestIpl("lafa2k_int_favela_gratis_69")
	RequestIpl("lafa2k_int_favela_gratis_70")
	RequestIpl("lafa2k_int_favela_gratis_71")
	RequestIpl("lafa2k_int_favela_gratis_72")
	RequestIpl("lafa2k_int_favela_gratis_73")
	RequestIpl("lafa2k_int_favela_gratis_74")
	RequestIpl("lafa2k_int_favela_gratis_75")
	RequestIpl("lafa2k_int_favela_gratis_76")
	RequestIpl("lafa2k_int_favela_gratis_77")
	RequestIpl("lafa2k_int_favela_gratis_78")
	RequestIpl("lafa2k_int_favela_gratis_79")
	RequestIpl("lafa2k_int_favela_gratis_80")
	RequestIpl("lafa2k_int_favela_gratis_81")
	RequestIpl("lafa2k_int_favela_gratis_82")
	RequestIpl("lafa2k_int_favela_gratis_83")
	RequestIpl("lafa2k_int_favela_gratis_84")
	RequestIpl("lafa2k_int_favela_gratis_85")
	RequestIpl("lafa2k_int_favela_gratis_86")
	RequestIpl("lafa2k_int_favela_gratis_87")
	RequestIpl("lafa2k_int_favela_gratis_88")
	RequestIpl("lafa2k_int_favela_gratis_89")
	RequestIpl("lafa2k_int_favela_gratis_90")
	RequestIpl("lafa2k_int_favela_gratis_91")
	RequestIpl("lafa2k_int_favela_gratis_92")
	RequestIpl("lafa2k_int_favela_gratis_93")
	RequestIpl("lafa2k_int_favela_gratis_94")
	RequestIpl("lafa2k_int_favela_gratis_95")
	RequestIpl("lafa2k_int_favela_gratis_96")
	RequestIpl("lafa2k_int_favela_gratis_97")
	RequestIpl("lafa2k_int_favela_gratis_98")
	RequestIpl("lafa2k_int_favela_gratis_99")
	RequestIpl("lafa2k_int_favela_gratis_100")
	RequestIpl("lafa2k_int_favela_gratis_101")
	RequestIpl("lafa2k_int_favela_gratis_102")
	RequestIpl("lafa2k_int_favela_gratis_103")
	RequestIpl("lafa2k_int_favela_gratis_104")
	RequestIpl("lafa2k_int_favela_gratis_105")
	RequestIpl("lafa2k_int_favela_gratis_106")
	RequestIpl("lafa2k_int_favela_gratis_107")
	RequestIpl("lafa2k_int_favela_gratis_108")
	RequestIpl("lafa2k_int_favela_gratis_109")
	RequestIpl("lafa2k_int_favela_gratis_110")
	RequestIpl("lafa2k_int_favela_gratis_01d")
	RequestIpl("lafa2k_int_favela_gratis_02d")
	RequestIpl("lafa2k_int_favela_gratis_03d")
	RequestIpl("lafa2k_int_favela_gratis_04d")
	RequestIpl("lafa2k_int_favela_gratis_05d")
	RequestIpl("lafa2k_int_favela_gratis_06d")
	RequestIpl("lafa2k_int_favela_gratis_07d")
	RequestIpl("lafa2k_int_favela_gratis_08d")
	RequestIpl("lafa2k_int_favela_gratis_09d")
	RequestIpl("lafa2k_int_favela_gratis_10d")
	RequestIpl("lafa2k_int_favela_gratis_11d")
	RequestIpl("lafa2k_int_favela_gratis_12d")
	RequestIpl("lafa2k_int_favela_gratis_13d")
	RequestIpl("lafa2k_int_favela_gratis_14d")
	RequestIpl("lafa2k_int_favela_gratis_15d")
	RequestIpl("lafa2k_int_favela_gratis_16d")
	RequestIpl("lafa2k_int_favela_gratis_17d")
	RequestIpl("lafa2k_int_favela_gratis_18d")
	RequestIpl("lafa2k_int_favela_gratis_19d")
	RequestIpl("lafa2k_int_favela_gratis_20d")
	RequestIpl("lafa2k_int_favela_gratis_21d")
	RequestIpl("lafa2k_int_favela_gratis_22d")
	RequestIpl("lafa2k_int_favela_gratis_23d")
	RequestIpl("lafa2k_int_favela_gratis_24d")
	RequestIpl("lafa2k_int_favela_gratis_25d")
	RequestIpl("lafa2k_int_favela_gratis_26d")
	RequestIpl("lafa2k_int_favela_gratis_27d")
	RequestIpl("lafa2k_int_favela_gratis_28d")
	RequestIpl("lafa2k_int_favela_gratis_29d")
	RequestIpl("lafa2k_int_favela_gratis_30d")
	RequestIpl("lafa2k_int_favela_gratis_31d")
	RequestIpl("lafa2k_int_favela_gratis_32d")
	RequestIpl("lafa2k_int_favela_gratis_33d")
	RequestIpl("lafa2k_int_favela_gratis_34d")
	RequestIpl("lafa2k_int_favela_gratis_35d")
	RequestIpl("lafa2k_int_favela_gratis_36d")
	RequestIpl("lafa2k_int_favela_gratis_37d")
	RequestIpl("lafa2k_int_favela_gratis_38d")
	RequestIpl("lafa2k_int_favela_gratis_39d")
	RequestIpl("lafa2k_int_favela_gratis_40d")
	RequestIpl("lafa2k_int_favela_gratis_41d")
	RequestIpl("lafa2k_int_favela_gratis_42d")
	RequestIpl("lafa2k_int_favela_gratis_43d")
	RequestIpl("lafa2k_int_favela_gratis_44d")
	RequestIpl("lafa2k_int_favela_gratis_45d")
	-- lafa2k favela grátis (otimização da favela da barragem criada pelo oldbob)
end)