local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")



RegisterServerEvent('patrao_contratar')
AddEventHandler('patrao_contratar', function()


	if vRP.hasPermission(user_id,"comandante.permissao", "owner.permissao") then 
	    RegisterCommand('group-pm',function(source,args,rawCommand)
	    local idpm = vRP.prompt(source, "Digite o rg do PM a ser contratado:","")
        local identity = vRP.getUserIdentity(idpm)
        if vRP.hasPermission(user_id,"comandante.permissao") then
            if args[1] and args[2] then
                local identity44 = vRP.getUserIdentity(args[1])
                vRP.addUserGroup(parseInt(args[1]),args[2])   
            end
        else
            TriggerClientEvent("Notify",source,"negado","Sem permissao")
        end
    end
    

end)
RegisterServerEvent('patrao_promover')
AddEventHandler('patrao_promover', function()


    RegisterCommand('promoverpm',function(source,args,rawCommand)
        local idpm = vRP.prompt(source, "Digite o rg do PM a ser contratado:","")
        local identity = vRP.getUserIdentity(idpm)
        if vRP.hasPermission(user_id,"comandante.permissao", "owner.permissao") then
            if args[1] then
                local identity44 = vRP.getUserIdentity(args[1])
                if vRP.hasGroup(parseInt(args[1]), "Cabo") or vRP.hasGroup(parseInt(args[1]), "cabopaisana")then
                    vRP.addUserGroup(parseInt(args[1]),"Tenente")
                    vRP.removeUserGroup(parseInt(args[1]),"Cabo")
                    TriggerClientEvent("Notify",source,"aviso","Policial promovido!")
                
                elseif vRP.hasGroup(parseInt(args[1]), "Tenente") or vRP.hasGroup(parseInt(args[1]), "tenentepaisana")then
                    vRP.addUserGroup(parseInt(args[1]),"Sargento")
                    vRP.removeUserGroup(parseInt(args[1]),"Tenente")
                    TriggerClientEvent("Notify",source,"aviso","Policial promovido!")
                
                elseif vRP.hasGroup(parseInt(args[1]), "Sargento") or vRP.hasGroup(parseInt(args[1]), "sargentopaisana")then
                    vRP.addUserGroup(parseInt(args[1]),"Comandante")
                    vRP.removeUserGroup(parseInt(args[1]),"Sargento")
                    TriggerClientEvent("Notify",source,"aviso","Policial promovido!")
                
                elseif vRP.hasGroup(parseInt(args[1]), "Comandante") or vRP.hasGroup(parseInt(args[1]), "comandantepaisana")then
                    vRP.addUserGroup(parseInt(args[1]),"Cabo")
                    vRP.removeUserGroup(parseInt(args[1]),"Comandante")
                    TriggerClientEvent("Notify",source,"aviso","Policial promovido!")
                end
            end
        else
            TriggerClientEvent("Notify",source,"negado","Sem permissao")
        end
    end


end)
RegisterServerEvent('patrao_demitir')
AddEventHandler('patrao_demitir', function()


    RegisterCommand('remover-pm',function(source,args,rawCommand)
        local idpm = vRP.prompt(source, "Digite o rg do PM a ser contratado:","")
        local identity = vRP.getUserIdentity(idpm)
        if vRP.hasPermission(user_id,"comandante.permissao", "owner.permissao") then
            if args[1] then
               local identity44 = vRP.getUserIdentity(parseInt(args[1]))
               
               vRP.removeUserGroup(parseInt(args[1]),"Sargento")
               vRP.removeUserGroup(parseInt(args[1]),"Cabo")
               vRP.removeUserGroup(parseInt(args[1]),"Tenente")

            end
        else
            TriggerClientEvent("Notify",source,"negado","Sem permissao")
        end
    end
    


end)



--recruta.permissao
--soldado.permissao
--cabo.permissao
--sargento.permissao
--tenente.permissao
--capitao.permissao
--major.permissao
--coronel.permissao