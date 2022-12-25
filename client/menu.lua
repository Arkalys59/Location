

local OpenRental = false 
MenuRental = RageUI.CreateMenu("Location", " ")
MenuRental.Closed = function()
    OpenRental = false 
end

local Lock = true

function OpenMenuRental(Type)
    if OpenRental then 
        OpenRental = false 
        RageUI.Visible(MenuRental, false)
        return
    else
        OpenRental = true 
        RageUI.Visible(MenuRental, true)
        CreateThread(function()
            while OpenRental do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(MenuRental, function()
                    if Type.Type == "Vehicle" then
                        RageUI.Separator("↓ ~b~Les véhicules disponible~s~ ↓ ")
                        RageUI.Line()
                        for k,v in pairs(Location.Vehicle) do 
                            RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Prix.."$~s~ →→", LeftBadge = RageUI.BadgeStyle.Star}, Lock, {
                                onSelected = function()
                                    TriggerServerEvent("BuyVehicle", v.Name, v.Prix, Type.Type, v.SpawnVehicle, v.Label)
                                    RageUI.CloseAll()
                                    OpenRental = false 
                                    Lock = false
                                    Wait(10000)
                                    Lock = true
                                end
                            })
                        end
                    elseif Type.Type == "Bateau" then 
                        for k,v in pairs(Location.Bateau) do 
                            RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Prix.."$~s~ →→", LeftBadge = RageUI.BadgeStyle.Star}, Lock, {
                                onSelected = function()
                                    TriggerServerEvent("BuyVehicle", v.Name, v.Prix, Type.Type, v.SpawnVehicle, v.Label)
                                    RageUI.CloseAll()
                                    OpenRental = false 
                                    Lock = false
                                    Wait(10000)
                                    Lock = true
                                end
                            })
                        end
                    elseif Type.Type == "Helico" then 
                        for k,v in pairs(Location.Helico) do 
                            RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Prix.."$~s~ →→", LeftBadge = RageUI.BadgeStyle.Star}, Lock, {
                                onSelected = function()
                                    TriggerServerEvent("BuyVehicle", v.Name, v.Prix, Type.Type, v.SpawnVehicle, v.Label)
                                    RageUI.CloseAll()
                                    OpenRental = false 
                                    Lock = false
                                    Wait(10000)
                                    Lock = true
                                end
                            })
                        end

                    elseif Type.Type == "Avion" then 
                        for k,v in pairs(Location.Avion) do 
                            RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Prix.."$~s~ →→", LeftBadge = RageUI.BadgeStyle.Star}, Lock, {
                                onSelected = function()
                                    TriggerServerEvent("BuyVehicle", v.Name, v.Prix, Type.Type, v.SpawnVehicle, v.Label)
                                    RageUI.CloseAll()
                                    OpenRental = false 
                                    Lock = false
                                    Wait(10000)
                                    Lock = true
                                end
                            })
                        end

                    end
                end)
                Wait(0)
            end
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    end
end