let currentVehicle = nil
let isDriver = false
let volume = 0.5

RegisterCommand("caradio", function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        currentVehicle = vehicle
        isDriver = GetPedInVehicleSeat(vehicle, -1) == ped

        SetNuiFocus(true, true)
        SendNUIMessage({ type = "show", volume = volume })
    else
        TriggerEvent('chat:addMessage', { args = { '[Car Radio]', 'You must be in a vehicle to use the radio!' }, color = {255, 0, 0} })
    end
end)

RegisterNUICallback("playSound", function(data)
    if currentVehicle then
        TriggerServerEvent("car_radio:play", VehToNet(currentVehicle), data.url, volume)
    end
end)

RegisterNUICallback("stopSound", function()
    if currentVehicle then
        TriggerServerEvent("car_radio:stop", VehToNet(currentVehicle))
    end
end)

RegisterNUICallback("setVolume", function(data)
    volume = data.volume
    if currentVehicle then
        TriggerServerEvent("car_radio:setVolume", VehToNet(currentVehicle), volume)
    end
end)

RegisterNUICallback("closeRadio", function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent("car_radio:play")
AddEventHandler("car_radio:play", function(url, vol)
    SendNUIMessage({ type = "play", url = url, volume = vol })
end)

RegisterNetEvent("car_radio:stop")
AddEventHandler("car_radio:stop", function()
    SendNUIMessage({ type = "stop" })
end)

RegisterNetEvent("car_radio:setVolume")
AddEventHandler("car_radio:setVolume", function(vol)
    SendNUIMessage({ type = "setVolume", volume = vol })
end)