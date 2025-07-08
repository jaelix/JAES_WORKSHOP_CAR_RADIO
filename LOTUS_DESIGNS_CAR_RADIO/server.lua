local activeRadios = {}

RegisterServerEvent("car_radio:play")
AddEventHandler("car_radio:play", function(netID, url, volume)
    activeRadios[netID] = { url = url, volume = volume }
    TriggerClientEvent("car_radio:play", -1, url, volume)
end)

RegisterServerEvent("car_radio:stop")
AddEventHandler("car_radio:stop", function(netID)
    activeRadios[netID] = nil
    TriggerClientEvent("car_radio:stop", -1)
end)

RegisterServerEvent("car_radio:setVolume")
AddEventHandler("car_radio:setVolume", function(netID, volume)
    if activeRadios[netID] then
        activeRadios[netID].volume = volume
        TriggerClientEvent("car_radio:setVolume", -1, volume)
    end
end)