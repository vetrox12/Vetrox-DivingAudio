Citizen.CreateThread(function()
    local Vetrox2 = false
    while true do
        Citizen.Wait(2000)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local waterFound, waterLevel = GetWaterHeight(playerCoords.x, playerCoords.y, playerCoords.z)
        if waterFound then
            local isDiving = playerCoords.z < waterLevel - 1.3
            if isDiving and not Vetrox2 then
                SetAudioSubmixEffectRadioFx(0, 0)
                SetAudioSubmixEffectParamInt(0, 0, `default`, 1)
                SetAudioSubmixEffectParamFloat(0, 0, `freq_low`, 300.0)
                SetAudioSubmixEffectParamFloat(0, 0, `freq_hi`, 2000.0)
                SetAudioSubmixEffectParamFloat(0, 0, `fudge`, 2.5)
                SetAudioSubmixEffectParamFloat(0, 0, `rm_mix`, 40.0)
            elseif not isDiving and Vetrox2 then
                SetAudioSubmixEffectRadioFx(0, 0)
                SetAudioSubmixEffectParamInt(0, 0, `enabled`, 0)
            end
            Vetrox2 = isDiving
        end
    end
end)