-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

MF_Purge = {}
local MFP = MF_Purge
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

MFP.Version = '1.0.10'

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

MFP.DrawTextDist = 10.0 -- meters for drawtext (above ammo boxes) to appear
MFP.InteractDist = 2.0 -- x meters from loot box to interact
MFP.LegionSpawnDist = 100.0 -- spawn ammo boxes at x meters from legion.
MFP.EnemySpawnDist = 300.0 -- spawn enemies at x meters from player

MFP.SpawnThreadTimer = 5 -- seconds (less = more lag... i think)
MFP.LootRespawnTimer = 5 -- minutes

MFP.MinBoxAmmo = 100 -- from loot
MFP.MaxBoxAmmo = 500 -- ^
MFP.InteractTimer = 10 -- seconds (for looting lootboxes)
MFP.MinPurgeAmmo = 100 -- from loot
MFP.MaxPurgeAmmo = 500 -- ^

MFP.TrafficDensity = 0.5 -- traffic density to while purge not active.
MFP.PedDensity = 0.5  -- same as above, for peds.
MFP.HealBonesOnRespawn = true

-- given to player at start of purge
MFP.PurgeWeapons = {
  [1] = 'WEAPON_REVOLVER',
  [2] = 'WEAPON_MICROSMG',
  [3] = 'WEAPON_MG',
  [4] = 'WEAPON_ASSAULTRIFLE',
  [5] = 'WEAPON_PUMPSHOTGUN',

  [6] = 'WEAPON_WEAPON_HEAVYPISTOL',
  [7] = 'WEAPON_MINISMG',
  [8] = 'WEAPON_COMBATMG',
  [9] = 'WEAPON_CARBINERIFLE',
  [10] = 'WEAPON_BULLPUPSHOTGUN',

  [11] = 'WEAPON_PISTOL50',
  [12] = 'WEAPON_ASSAULTSMG',
  [13] = 'WEAPON_SPECIALCARBINE',
  [14] = 'WEAPON_ASSAULTSHOTGUN',

  [15] = 'WEAPON_RPG',
  [16] = 'WEAPON_GRENADELAUNCHER',
}

-- when player dies near legion square, teleport to one of these.
MFP.SpawnLocations = {
  [1] = vector3(296.48,-0583.33,43.14),
  [2] = vector3(-55.70,-1104.22,26.43),
  [3] = vector3(306.22,-1162.22,29.29),
  [4] = vector3(379.44,-0766.03,29.29),
}

-- from the crates
MFP.CrateWeapons = {
  'WEAPON_REVOLVER', 'WEAPON_PISTOL', 'WEAPON_COMBATPISTOL', 'WEAPON_APPISTOL', 'WEAPON_PISTOL50', 'WEAPON_SNSPISTOL', 
  'WEAPON_HEAVYPISTOL','WEAPON_VINTAGEPISTOL', 'WEAPON_DOUBLEACTION', 'WEAPON_ASSAULTSHOTGUN',
  'WEAPON_MICROSMG','WEAPON_MINISMG','WEAPON_SMG','WEAPON_ASSAULTSMG', 'WEAPON_MACHINEPISTOL',
  'WEAPON_ASSAULTRIFLE', 'WEAPON_CARBINERIFLE', 'WEAPON_ADVANCEDRIFLE', 'WEAPON_SPECIALCARBINE', 
  'WEAPON_BULLPUPRIFLE', 'WEAPON_COMPACTRIFLE', 'WEAPON_DBSHOTGUN', 'WEAPON_HEAVYSHOTGUN',
  'WEAPON_MG','WEAPON_COMBATMG','WEAPON_PUMPSHOTGUN','WEAPON_SAWNOFFSHOTGUN','WEAPON_BULLPUPSHOTGUN',
  
}

-- for the AI
MFP.EnemyWeapons = {
  'WEAPON_ASSAULTRIFLE', 'WEAPON_CARBINERIFLE', 'WEAPON_ADVANCEDRIFLE', 'WEAPON_SPECIALCARBINE','WEAPON_MG','WEAPON_COMBATMG', 'WEAPON_MINIGUN',
  'WEAPON_BULLPUPRIFLE', 'WEAPON_COMPACTRIFLE', 'WEAPON_MICROSMG','WEAPON_MINISMG','WEAPON_SMG','WEAPON_ASSAULTSMG', 'WEAPON_MACHINEPISTOL',  
}

-- legion ammo gameobjects
MFP.LegionLocation = vector3(219.74,-904.19,30.69)
MFP.LegionObjects = {
  ['bAmmoCrate'] = 'ex_prop_crate_ammo_bc',
  ['sAmmoCrate'] = 'ex_prop_crate_ammo_sc',
  ['sAmmoBox'] = 'bkr_prop_gunlocker_ammo_01a',
  ['bAmmoBox'] = 'hei_prop_heist_ammo_box',
  ['sAmmoPackA'] = 'prop_ld_ammo_pack_01',
  ['sAmmoPackB'] = 'prop_ld_ammo_pack_02',
  ['sAmmoPackC'] = 'prop_ld_ammo_pack_03',
  ['bSuppliesCrate'] = 'prop_box_wood02a_pu',
}

-- ammo box group locations
MFP.LegionStashLocs = {
  [1] = vector3(219.74,-904.19,30.69),
  [2] = vector3(208.70,-942.41,30.68),
  [3] = vector3(175.15,-919.14,30.68),
}

-- stash GO offsets
MFP.LegionObjLocs = {
  [vector4( 000.00,  000.00,00.00,290.00)] = 'bAmmoCrate',
  [vector4( 002.34,  000.21,00.00,035.15)] = 'sAmmoCrate',
  [vector4( 000.92,  002.20,00.00,180.98)] = 'sAmmoCrate',
  [vector4( 001.30,  001.38,00.00,178.68)] = 'bAmmoBox',
  [vector4( 001.34,  001.10,00.00,025.19)] = 'bAmmoBox',
  [vector4(-000.35,  001.22,00.00,058.11)] = 'sAmmoBox',
  [vector4( 002.14,  002.42,00.00,294.55)] = 'sAmmoBox',
}

-- spawn ai at these locs
MFP.EnemyLocs = {
  [1]  = vector4( 0291.05, -0284.81, 0053.98,  000.0),
  [2]  = vector4( 0155.98, -0077.06, 0067.55,  000.0),
  [3]  = vector4( 0433.47,  0223.00, 0103.16,  000.0),
  [4]  = vector4(-0355.89,  0028.82, 0047.76,  000.0),
  [5]  = vector4(-0943.36,  0595.79, 0101.00,  000.0),
  [6]  = vector4(-1309.70, -0410.95, 0034.34,  000.0),
  [7]  = vector4(-1158.15, -1551.14, 0004.26,  000.0),
  [8]  = vector4(-0315.52, -1028.51, 0030.38,  000.0),
  [9]  = vector4( 0717.69, -0894.08, 0024.07,  000.0),
  [10] = vector4( 0084.71, -1971.77, 0020.78,  000.0),
  [11] = vector4( 0045.58, -1046.59, 0029.19,  000.0),
  [12] = vector4(-0708.20, -0876.00, 0023.53,  000.0),
  [13] = vector4( 0968.42, -2226.41, 0030.55,  000.0),
  [14] = vector4(-0033.88, -1541.19, 0030.67,  000.0),
  [15] = vector4( 0217.69, -0936.36, 0024.14,  000.0),
  [16] = vector4( 0246.01, -0752.69, 0030.87,  000.0),
}

-- spawn armored vehicles at these locs
MFP.VehicleLocs = {
  [2]  = vector4( 0148.75, -0125.61, 0054.82,  070.00),
  [3]  = vector4( 0466.64,  0253.67, 0103.20,  340.00),
  [4]  = vector4(-0441.25,  0061.36, 0057.98,  267.00),
  [6]  = vector4(-1278.02, -0439.10, 0034.22,  212.66),
  [7]  = vector4(-1189.28, -1492.47, 0004.37,  218.00),
  [8]  = vector4(-0332.56, -0993.96, 0030.38,  257.00),
  [9]  = vector4( 0738.07, -0844.35, 0025.01,  240.00),
  [10] = vector4( 0112.73, -1935.04, 0020.72,  033.43),  
}

-- vehicles to spawn models
MFP.VehicleModels = {
  [1] = 'cerberus',
  [2] = 'hauler2',
  [3] = 'phantom2',
  [4] = 'riot2',
  [5] = 'barrage',
  [6] = 'halftrack',
  [7] = 'bruiser',
  [8] = 'dune5',
  [9] = 'insurgent',
  [10] = 'technical2',
  [11] = 'wastelander',
}

-- classes of AI
MFP.EnemyGroups = {
  [1] = {
    ["Style"] = "Army",
    ["Relationship"] = 0xE3D976F3,
    ["Formation"] = 1,
    ["GroupSpacing"] = {[1] = 10.0,[2] = 10.0,[3] = 10.0},
    ["EngageDist"] = 500.0,

    ["Abilities"] = {
      Health = 500,
      Movement = 3,
      Range = 2,
      Ability = 100,
      Accuracy = 90,
      Pattern = "FIRING_PATTERN_FULL_AUTO",

      CombatAttributes = {
        [0] = true,
        [1] = true,
        [2] = true,
        [3] = true,
        [5] = true,
        [20] = true,
        [46] = true,
        [52] = true,
        [292] = false,
        [1424] = true,
      },

      CombatFloats = {
        [0] = 0.1,
        [1] = 2.0,
        [3] = 1.25,
        [4] = 10.0,
        [5] = 1.0,
        [8] = 0.1,
        [11] = 20.0,
        [12] = 9.0,
        [16] = 10.0,
      },
    },
    ["Peds"] = {
      [1] = 'mp_m_freemode_01',
      [2] = 'mp_m_freemode_01',
      [3] = 'mp_m_freemode_01',
      [4] = 'mp_m_freemode_01',
      [5] = 'mp_m_freemode_01',
      [6] = 'mp_m_freemode_01',
      [7] = 'mp_m_freemode_01',
      [8] = 'mp_m_freemode_01',
    },
  },
  [2] = {
    ["Style"] = "Clown",
    ["Relationship"] = 0x4325F88A,
    ["Formation"] = 1,
    ["GroupSpacing"] = {[1] = 10.0,[2] = 10.0,[3] = 10.0},
    ["EngageDist"] = 500.0,

    ["Abilities"] = {
      Health = 500,
      Movement = 3,
      Range = 2,
      Ability = 100,
      Accuracy = 80,
      Pattern = "FIRING_PATTERN_SEMI_AUTO",

      CombatAttributes = {
        [0] = true,
        [1] = true,
        [2] = true,
        [3] = true,
        [5] = true,
        [20] = true,
        [46] = true,
        [52] = true,
        [292] = false,
        [1424] = true,
      },

      CombatFloats = {
        [0] = 0.1,
        [1] = 2.0,
        [3] = 1.25,
        [4] = 10.0,
        [5] = 1.0,
        [8] = 0.1,
        [11] = 20.0,
        [12] = 9.0,
        [16] = 10.0,
      },
    },
    ["Peds"] = {
      [1] = 's_m_y_clown_01',
      [2] = 's_m_y_clown_01',
      [3] = 's_m_y_clown_01',
      [4] = 's_m_y_clown_01',
      [5] = 's_m_y_clown_01',
      [6] = 's_m_y_clown_01',
      [7] = 's_m_y_clown_01',
      [8] = 's_m_y_clown_01',
    },
  },
}
      
    -- SetPedComponentVariation(plyPed,  1,   0, 0, 0) -- face
    -- SetPedComponentVariation(plyPed,  1,   0, 0, 0) -- hair (or mask?)
    -- SetPedComponentVariation(plyPed,  2,   0, 0, 0) -- mask (or hair?)
    -- SetPedComponentVariation(plyPed,  3,   0, 0, 0) -- arms
    -- SetPedComponentVariation(plyPed,  4,  21, 0, 0) -- pants
    -- SetPedComponentVariation(plyPed,  5,   0, 0, 0) -- bag
    -- SetPedComponentVariation(plyPed,  6,  34, 0, 0) -- shoes
    -- SetPedComponentVariation(plyPed,  7,   0, 0, 0) -- accs
    -- SetPedComponentVariation(plyPed,  8,  15, 0, 0) -- tshirt
    -- SetPedComponentVariation(plyPed,  9,   0, 0, 0) -- gadgets
    -- SetPedComponentVariation(plyPed, 10,   0, 0, 0) -- logos
    -- SetPedComponentVariation(plyPed, 11, 187, 3, 0) -- torso
    -- SetPedComponentVariation(plyPed, 12,   0, 0, 0) -- hat
    -- SetPedComponentVariation(plyPed, 13,   0, 0, 0) -- glasses
    -- SetPedComponentVariation(plyPed, 14,   0, 0, 0) -- ears

MFP.Styles = {
  ["Army"] = {
    [1] = {
      [0] = 0, -- face
      [1] = 62, -- mask
      [2] = 6, -- hair
      [3] = 4, -- arms
      [4] = 89 , -- pants
      [5] = 41, -- bag
      [6] = 61, -- shoes
      [7] = 112, -- chain
      [8] = 15, -- tshirt
      [9] = 16, -- vest
      [10] = 0, -- logos
      [11] = 221, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [2] = {
      [0] = 0, -- face
      [1] = 64, -- mask
      [2] = 6, -- hair
      [3] = 0, -- arms
      [4] = 46 , -- pants
      [5] = 0, -- bag
      [6] = 61, -- shoes
      [7] = 112, -- chain
      [8] = 15, -- tshirt
      [9] = 0, -- vest
      [10] = 0, -- logos
      [11] = 0, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [3] = {
      [0] = 0, -- face
      [1] = 41, -- mask
      [2] = 6, -- hair
      [3] = 4, -- arms
      [4] = 87 , -- pants
      [5] = 0, -- bag
      [6] = 70, -- shoes
      [7] = 112, -- chain
      [8] = 53, -- tshirt
      [9] = 10, -- vest
      [10] = 0, -- logos
      [11] = 53, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [4] = {
      [0] = 0, -- face
      [1] = 39, -- mask
      [2] = 6, -- hair
      [3] = 4, -- arms
      [4] = 97, -- pants
      [5] = 0, -- bag
      [6] = 62, -- shoes
      [7] = 112, -- chain
      [8] = 101, -- tshirt
      [9] = 0, -- vest
      [10] = 0, -- logos
      [11] = 212, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [5] = {
      [0] = 0, -- face
      [1] = 40, -- mask
      [2] = 0, -- hair
      [3] = 2, -- arms
      [4] = 87 , -- pants
      [5] = 0, -- bag
      [6] = 71, -- shoes
      [7] = 112, -- chain
      [8] = 15, -- tshirt
      [9] = 16, -- vest
      [10] = 0, -- logos
      [11] = 239, -- torso
      [12] = 101, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
  },  ["Clown"] = {
    [1] = {
      [0] = 2, -- face
      [1] = 2, -- mask
      [2] = 2, -- hair
      [3] = 2, -- arms
      [4] = 2 , -- pants
      [5] = 2, -- bag
      [6] = 2, -- shoes
      [7] = 2, -- chain
      [8] = 2, -- tshirt
      [9] = 2, -- vest
      [10] = 2, -- logos
      [11] = 2, -- torso
      [12] = 2, -- hat
      [13] = 2, -- glasses
      [14] = 2, -- ears
    },
    [2] = {
      [0] = 3, -- face
      [1] = 3, -- mask
      [2] = 3, -- hair
      [3] = 2, -- arms
      [4] = 3 , -- pants
      [5] = 3, -- bag
      [6] = 3, -- shoes
      [7] = 3, -- chain
      [8] = 3, -- tshirt
      [9] = 3, -- vest
      [10] = 3, -- logos
      [11] = 3, -- torso
      [12] = 3, -- hat
      [13] = 3, -- glasses
      [14] = 3, -- ears
     },
  },
}

MFP.StyleColors = {
  ["Army"] = {
    [1] = {
      [0] = 0, -- face
      [1] = 0, -- mask
      [2] = 6, -- hair
      [3] = 0, -- arms
      [4] = 1, -- pants
      [5] = 0, -- bag
      [6] = 1, -- shoes
      [7] = 0, -- chain
      [8] = 0, -- tshirt
      [9] = 0, -- vest
      [10] = 0, -- logos
      [11] = 1, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [2] = {
      [0] = 0, -- face
      [1] = 0, -- mask
      [2] = 6, -- hair
      [3] = 0, -- arms
      [4] = 0, -- pants
      [5] = 0, -- bag
      [6] = 1, -- shoes
      [7] = 0, -- chain
      [8] = 0, -- tshirt
      [9] = 0, -- vest
      [10] = 0, -- logos
      [11] = 11, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [3] = {
      [0] = 0, -- face
      [1] = 0, -- mask
      [2] = 6, -- hair
      [3] = 0, -- arms
      [4] = 1, -- pants
      [5] = 0, -- bag
      [6] = 20, -- shoes
      [7] = 0, -- chain
      [8] = 2, -- tshirt
      [9] = 3, -- vest
      [10] = 0, -- logos
      [11] = 2, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [4] = {
      [0] = 0, -- face
      [1] = 0, -- mask
      [2] = 6, -- hair
      [3] = 0, -- arms
      [4] = 20, -- pants
      [5] = 0, -- bag
      [6] = 0, -- shoes
      [7] = 0, -- chain
      [8] = 1, -- tshirt
      [9] = 0, -- vest
      [10] = 0, -- logos
      [11] = 1, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
    [5] = {
      [0] = 0, -- face
      [1] = 0, -- mask
      [2] = 0, -- hair
      [3] = 0, -- arms
      [4] = 1, -- pants
      [5] = 0, -- bag
      [6] = 20, -- shoes
      [7] = 0, -- chain
      [8] = 0, -- tshirt
      [9] = 0, -- vest
      [10] = 0, -- logos
      [11] = 0, -- torso
      [12] = 0, -- hat
      [13] = 0, -- glasses
      [14] = 0, -- ears
    },
  },  
  ["Clown"] = {
    [1] = {
      [0] = 0, -- face
      [1] = 2, -- mask
      [2] = 2, -- hair
      [3] = 0, -- arms
      [4] = 2 , -- pants
      [5] = 2, -- bag
      [6] = 2, -- shoes
      [7] = 2, -- chain
      [8] = 2, -- tshirt
      [9] = 2, -- vest
      [10] = 2, -- logos
      [11] = 2, -- torso
      [12] = 3, -- hat
      [13] = 2, -- glasses
      [14] = 2, -- ears
    },
    [2] = {
      [0] = 0, -- face
      [1] = 0, -- mask
      [2] = 3, -- hair
      [3] = 0, -- arms
      [4] = 3 , -- pants
      [5] = 3, -- bag
      [6] = 3, -- shoes
      [7] = 3, -- chain
      [8] = 3, -- tshirt
      [9] = 3, -- vest
      [10] = 3, -- logos
      [11] = 3, -- torso
      [12] = 3, -- hat
      [13] = 3, -- glasses
      [14] = 3, -- ears
     },
  },
}

