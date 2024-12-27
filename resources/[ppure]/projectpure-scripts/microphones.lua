Microphones = {
    usingMic = nil,

    defaultRanges = {
        main = 30,
        microphone = 30,
        megaphone = 50,
        vehicle = 60
    },

    vehicles = {
        [`nkcruiser`] = true,
        [`polbuff`] = true,
        [`nkvstr`] = true,
        [`polalamo`] = true,
        [`nkballer7`] = true,
        [`nkscout`] = true,
        [`cara`] = true,
        [`polchaser`] = true,
        [`policeb1`] = true,
        [`echo_polbike`] = true,
        [`polbullet2`] = true,
        [`apoliceu10`] = true,
        [`apoliceu9`] = true,
        [`prevolter`] = true,
        [`apoliceu15`] = true,
        [`apoliceu13`] = true,
        [`fibsultan`] = true,
        [`polcoquette4`] = true,
        [`nkdominator3`] = true,
        [`nkgauntlet4`] = true,
        [`bearcat`] = true,
        [`as350`] = true,
        [`lcpdpigeon`] = true,
        [`pigeonp`] = true,
        [`pbike`] = true,
        [`pbus`] = true,
        [`fibs`] = true,
        [`echo_polstainer`] = true,
        [`echo_polaleutian`] = true,
        [`echo_polbuffalo4`] = true,
        [`echo_polbuffalos`] = true,
        [`echo_polkomoda`] = true,
        [`echo_polsandstorm`] = true,
        [`echo_polscout`] = true,
        [`echo_polcypher`] = true,
        [`echo_poldom`] = true,
        [`echo_polgauntlet`] = true,
        [`echo_polr300`] = true,
        [`echo_polschgt`] = true,
        [`echo_polvigero`] = true,
        [`echo_polsandstorm2`] = true,
    },

    submixFilter = nil,
    submix = {
        [`default`] = 0,
        [`freq_low`] = 0.0,
        [`freq_hi`] = 10000.0,
        [`rm_mod_freq`] = 300.0,
        [`rm_mix`] = 0.2,
        [`fudge`] = 0.0,
        [`o_freq_lo`] = 200.0,
        [`o_freq_hi`] = 5000.0,
    },

    setSubmix = function(self, mType, bool)
        TriggerEvent('erp-sounds:PlayOnOne', bool and 'Upgrade' or 'Downgrade', 0.5)
        if mType == 'microphone' then
            MumbleSetAudioInputIntent(bool and `music` or `speech`)
        else
            TriggerServerEvent('erp-scripts:applySubmix', bool)
        end
    end,

    removeObjects = function(self)
        local objects = GetGamePool('CObject')
        for _, entity in pairs(objects) do
            if DoesEntityExist(entity) then
                if IsEntityAttachedToEntity(entity, cache.ped) or IsEntityAttachedToEntity(cache.ped, entity) then
                    DeleteEntity(entity)
                end
            end
        end
    end,

    clearOverride = function(self)
        if self.usingMic then
            Microphones:setSubmix(self.usingMic, false)
            self.usingMic = nil
            exports["pma-voice"]:clearProximityOverride()
            self:removeObjects()
        end
    end,

    toggleMicrophone = function(self, mType, bool, range)
        if not self.usingMic and bool then
            if self:doChecks() then return end
            self.usingMic = mType
            local _range = range or self.defaultRanges['main']
            self:setSubmix(mType, true)
            exports["pma-voice"]:overrideProximityRange(_range, true)
        elseif self.usingMic and not bool then
            if self.usingMic ~= mType then return end
            self.usingMic = nil
            self:setSubmix(mType, false)
            exports["pma-voice"]:clearProximityOverride()
        end
    end,

    toggleMegaphoneVehicle = function(self)
        if self:isEmergencyModel() then
            if self.usingMic then
                Microphones:toggleMicrophone('vehicle', false)
                lib.notify({
                    description = 'Vehicle Megaphone: Disabled',
                    type = 'inform'
                })
            else
                Microphones:toggleMicrophone('vehicle', true, self.defaultRanges['vehicle'])
                lib.notify({
                    description = 'Vehicle Megaphone: Enabled',
                    type = 'inform'
                })
            end
        end
    end,

    useItem = function(self, emote, range)
        if self.usingMic then
            self:toggleMicrophone(emote, false)
            exports["shah-notifications"]:SendAlert('inform', 'Range: disabled')
        else
            local _range = range or self.defaultRanges[emote] or self.defaultRanges['main']
            exports.echo_emotes:OnEmotePlay(emote)
            self:toggleMicrophone(emote, true, _range)
            exports["shah-notifications"]:SendAlert(('Range: %s'):format(_range))
        end
    end,

    isEmergencyModel = function(self)
        if not cache.vehicle then return false end
        if cache.seat and (cache.seat > 0) then return false end
        local model = GetEntityModel(cache.vehicle)
        return self.vehicles[model] or false
    end,

    doChecks = function(self)
        local isHandcuffed = false
        local isDead = LocalPlayer.state.isdead
        return isHandcuffed or isDead
    end
}

CreateThread(function()
    Microphones.submixFilter = CreateAudioSubmix("Megaphone")
    SetAudioSubmixEffectRadioFx(Microphones.submixFilter, 0)
    for hash, value in pairs(Microphones.submix) do
        SetAudioSubmixEffectParamInt(Microphones.submixFilter, 0, hash, value)
    end
    AddAudioSubmixOutput(Microphones.submixFilter, 0)
end)

RegisterNetEvent('erp-scripts:updateSubmixStatus', function(state, source)
    if state then
        MumbleSetSubmixForServerId(source, Microphones.submixFilter)
    else
        MumbleSetSubmixForServerId(source, -1)
    end
end)

AddEventHandler('ox_inventory:usedItem', function(name, slotId, metadata)
    -- Check if the used item is either 'microphone' or 'megaphone'
    if name == 'microphone' or name == 'megaphone' then
        -- Set range based on metadata, or use default if no override is specified
        local range = metadata.override_range or Microphones.defaultRanges['main']
        
        if not Microphones.usingMic and not metadata.override_range then
            -- Set max range based on item default or the provided range
            local max_range = Microphones.defaultRanges[name] or range
            
            -- Use lib.input to adjust range with a slider
            local input = lib.inputDialog('Adjust Range', {
                { type = 'slider', label = 'Value', step = 1, min = 5, max = max_range },
            })
            -- Update range if user input is valid
            range = (input and input[1]) or range
        end
        
        -- Use the item with the determined range
        Microphones:useItem(name, range)
    end
end)


AddStateBagChangeHandler('dead', 'global', function(_, key, value)
    if value and value[cache.serverId] then
        Microphones:clearOverride()
    end
end)

lib.addKeybind({
    name = 'vehicle_megaphone',
    description = 'Vehicle Megaphone (Emergency)',
    defaultKey = 'F7',
    onPressed = function(self)
        Microphones:toggleMegaphoneVehicle()
    end
})

lib.onCache('vehicle', function(value)
	if not value and Microphones.usingMic then
		Microphones:toggleMegaphoneVehicle()
	end
end)