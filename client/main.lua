ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



CreateThread(function()
for k,v in pairs(Location.Point) do 
        local blip = AddBlipForCoord(v.Pos)
        SetBlipSprite(blip, v.Blip)
        SetBlipScale(blip, v.ScaleBlip)
        SetBlipColour(blip, v.BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.BlipText)
        EndTextCommandSetBlipName(blip)

        local hash = GetHashKey(v.NamePed)
        while not HasModelLoaded(hash) do RequestModel(hash)  Wait(10) end
        Ped = CreatePed(1, hash, v.Pos.x, v.Pos.y, v.Pos.z-1, v.HeadingPed, false, true)
        FreezeEntityPosition(Ped, true)
        SetEntityInvincible(Ped, true)
        SetBlockingOfNonTemporaryEvents(Ped, true)
        
        if (v.ActiveAnim) then 
            TaskStartScenarioInPlace(Ped, v.Animation)
        end
    end
    while true do 
        local interval = 500 
        local PlayerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Location.Point) do 
            local Dest = v.Pos
            local dist = #(PlayerPos-Dest)
            if dist <= 3 then 
                interval = 0
                ESX.ShowHelpNotification(v.HelpText) 
                if IsControlJustPressed(1, 51) then 
                    OpenMenuRental(v)
                end
            end
        end
        Wait(interval)
    end
end)