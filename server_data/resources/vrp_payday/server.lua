local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_salar")

salarios = {

    -- POLICIA´S

    {"forcanacional.permissao", 12000},
    {"rota.permissao", 10000},

    {"coronel.permissao", 12},
    {"major.permissao", 123},
    {"capitao.permissao", 1234},
    {"tenente.permissao", 12345},
    {"sargento.permissao", 12345},
    {"cabo.permissao", 12345},
    {"soldado.permissao", 12345},
    {"recruta.permissao", 12345},
   
    ---

    {"paisanacoronel.permissao", 32},
    {"paisanamajor.permissao", 321},
    {"paisanacapitao.permissao", 4321},
    {"paisanatenente.permissao", 54321}, 
    {"paisanasargento.permissao", 32},
    {"paisanacabo.permissao", 321},
    {"paisanasoldado.permissao", 4321},
    {"paisanarecruta.permissao", 54321}, 


----------------------------------------------------------------------------------------------------
    -- SAMUUU XUXU
----------------------------------------------------------------------------------------------------


    {"paramedicoo.permissao", 654},
    {"enfermeiro.permissao", 321},
    {"medicogeral.permissao", 789},
    {"cirurgiao.permissao", 456},
    {"diretor.permissao", 123},

    ---
 
    {"paisanadiretor.permissao", 987 },
    {"paisanacirurgiao.permissao", 654},
    {"paisanamedicogeral.permissao", 321},
    {"paisanaenfermeiro.permissao", 789},
    {"paisanaparamedico.permissao", 456},
 

-----------------------------------------------------------

   {"paisanarota.permissao", 8000},
   {"paisanaparamedico.permissao", 9000},
   {"paisanaforcanacional.permissao", 10000},



   -- EMPREGOS´S
   {"taxista.permissao", 500 },
   {"paisanataxista.permissao", 500 },   
   {"mecanico.permissao", 5000},
   {"paisanabennys.permissao", 5000},


   
   -- OUTRO´S
   {"instrutor.permissao", 10000},
   {"Advogado.permissao", 10000}
} 


RegisterServerEvent('salar')
AddEventHandler('salar', function(salar)
	local user_id = vRP.getUserId(source)
	vRP.giveInventoryItem(user_id,"vale", 15)
	for i,v in pairs(salarios) do
		permisiune = v[1]
		if vRP.hasPermission(user_id, permisiune)then
			salar = v[2]
			vRP.giveBankMoney(user_id,salar)
			TriggerClientEvent("Notify",source,"sucesso","Salario recebido - R$ "..salar..",00")
		end
	end
end)
