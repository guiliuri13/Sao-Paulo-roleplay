cfg = {}

-- Deixe true se ao abater a vaca o player deve conduzir ela para o abatedouro;
-- Deixe false se a vaca deve ir andando sozinha;
cfg.follow_player = true

-- Quantidade de leite que cada vaca da;
cfg.max_leite = 10

-- Pemissão para pessoa poder usar este emprego;
cfg.permission = "trabalho.leiteiro"

-- Quatidade aleat?ria de carne que da ao abater a vaca;
cfg.max_carne = 10
cfg.min_carne = 5

-- Tempo (em segundos) para o leite de cada vaca encher;
cfg.cooldown_timer = 240

-- Tempo (em segundos) para limpar as vacas mortas e spawnar todas as vacas de volta no curral;
cfg.spawn_timer = 600

--Curral
cfg.vacas = {
	{2264.4033203125,4894.5498046875,40.894309997559},
	{2256.8244628906,4903.4877929688,40.877770996094},
	{2249.3813476563,4910.9145507813,40.729549407959},
	{2240.9504394531,4919.4052734375,40.772453308105},
    {2233.2053222656,4926.8774414063,40.830112457275},
    {2225.2092285156,4936.9018554688,40.934513092041},
    {2203.4482421875,4915.189453125,40.60920715332},
    {2212.525390625,4905.9272460938,40.786613464355},
    {2219.0004882813,4898.7119140625,40.750946044922},
    {2227.8937988281,4890.3491210938,40.702388763428},
    {2235.8818359375,4882.5180664063,40.928550720215},
    {2245.1042480469,4873.5932617188,40.849323272705},
    {2242.6496582031,4850.5522460938,40.745040893555},
    {2248.5417480469,4842.787109375,40.657173156738},
    {2256.1640625,4835.6625976563,40.657218933105},
}

--Abatedouro
cfg.abatedouro = {2310.4997558594,4884.8510742188,41.808258056641}

-- Propriedades do item
local peso_leite = 1.0
local sede_leite = 20
local peso_carne = 2.0
local fome_carne = 40

-- Item
cfg.leite= {
  ["leite"] = {
    name = "Leite de vaca",
    desc = "",
    choices = function(args)
	  local menu = {}
      menu["Beber"] = {function(player,choice)
        local user_id = vRP.getUserId(player)
        if user_id ~= nil then
          if vRP.tryGetInventoryItem(user_id,"leite",1,false) then
            vRP.varyThirst(user_id,-sede_leite)
            vRPclient.notify(player,"~b~Bebendo leite.")
            local seq = {
              {"mp_player_intdrink","intro_bottle",1},
              {"mp_player_intdrink","loop_bottle",1},
              {"mp_player_intdrink","outro_bottle",1}
            }
            vRPclient.playAnim(player,true,seq,false)
            vRP.closeMenu(player)
          end
        end
      end}
	  return menu
    end,
	weight = peso_leite
  },
  ["carne"] = {
    name = "Carne de vaca",
    desc = "",
    choices = function(args)
	  local menu = {}
      menu["Comer"] = {function(player,choice)
        local user_id = vRP.getUserId(player)
        if user_id ~= nil then
          if vRP.tryGetInventoryItem(user_id,"carne",1,false) then
            vRP.varyHunger(user_id,-fome_carne)
            vRPclient.notify(player,"~b~Comendo carne.")
            local seq = {
              {"mp_player_intdrink","intro_bottle",1},
              {"mp_player_intdrink","loop_bottle",1},
              {"mp_player_intdrink","outro_bottle",1}
            }
            vRPclient.playAnim(player,true,seq,false)
            vRP.closeMenu(player)
          end
        end
      end}
	  return menu
    end,
	weight = peso_carne
  },
}

return cfg
