ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord(color, name, message, footer,webhook)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                ["text"] = footer,
              },
          }
      }
  
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end


RegisterNetEvent("BuyVehicle")
AddEventHandler("BuyVehicle", function(Name, Prix, Type, SpawnVehicle, Label)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local GetMoney = xPlayer.getMoney()
    local NamePlayer = GetPlayerName(_src)
    if GetMoney >= Prix then 
        if Type == "Bateau" then
            xPlayer.removeMoney(Prix)
            TriggerClientEvent("esx:showNotification", _src, "~g~Vous venez de louer "..Label)
            sendToDiscord(12975872,"Location", "**Le joueur** : "..NamePlayer.." viens de louer un bateau :"..Label, "Create By Ceek", LogsLocation)
            local Bateau = CreateVehicle(Name, SpawnVehicle, true, true)
            TaskWarpPedIntoVehicle(_src, Bateau, -1)
        elseif Type == "Vehicle" then
            xPlayer.removeMoney(Prix)
            sendToDiscord(12975872,"Location", "**Le joueur** : "..NamePlayer.." viens de louer un vehicule : "..Label, "Create By Ceek", LogsLocation)
            TriggerClientEvent("esx:showNotification", _src, "~g~Vous venez de louer "..Label)
            local Vehicle = CreateVehicle(Name, SpawnVehicle, true, true)
            TaskWarpPedIntoVehicle(_src, Vehicle, -1)
        elseif Type == "Helico" then
            xPlayer.removeMoney(Prix)
            sendToDiscord(12975872,"Location", "**Le joueur** : "..NamePlayer.." viens de louer un Helico : "..Label, "Create By Ceek", LogsLocation)
            TriggerClientEvent("esx:showNotification", _src, "~g~Vous venez de louer "..Label)
            local Vehicle = CreateVehicle(Name, SpawnVehicle, true, true)
            TaskWarpPedIntoVehicle(_src, Vehicle, -1)
        elseif Type == "Avion" then
            xPlayer.removeMoney(Prix)
            sendToDiscord(12975872,"Location", "**Le joueur** : "..NamePlayer.." viens de louer un avion : "..Label, "Create By Ceek", LogsLocation)
            TriggerClientEvent("esx:showNotification", _src, "~g~Vous venez de louer "..Label)
            local Vehicle = CreateVehicle(Name, SpawnVehicle, true, true)
            TaskWarpPedIntoVehicle(_src, Vehicle, -1)
        end
    else 
        TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent")
    end
end)