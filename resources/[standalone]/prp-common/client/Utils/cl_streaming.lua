-- **********************
--    Global Functions
-- **********************
-- WHEN TRIGGERED, LOAD ANIMATION DICTIONARY (ERRORS OUT WHEN INVALID SO NO STUCK LOOPS)
function LoadAnimDict(dict, time)
    if HasAnimDictLoaded(dict) then
        return
    end

    local currTime = GetGameTimer()
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(time or 15)

        local currTimeNow = GetGameTimer()
        if (currTimeNow > currTime + 2000 and currTimeNow > currTime + 10000) then
            print("ERROR: " .. dict .. " is not a valid animation dictionary or took too long to load")
            return
        end
    end
end
exports("LoadAnimDict", LoadAnimDict)

-- WHEN TRIGGERED, LOAD MODEL (ERRORS OUT WHEN INVALID SO NO STUCK LOOPS)
function LoadModel(model, time)
    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        local currTime = GetGameTimer()

        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(time or 15)

            -- KEEP REQUESTING
            RequestModel(model)

            -- FAILSAFE
            local currTimeNow = GetGameTimer()
            if currTimeNow > currTime + 2000 and currTimeNow > currTime + 10000 then
                print("ERROR: " .. model .. " is not a valid model or took too long to load")
                return
            end
        end
    end
end
exports("LoadModel", LoadModel)

-- WHEN TRIGGERED, LOAD ANIMATION SET (ERRORS OUT WHEN INVALID SO NO STUCK LOOPS)
function LoadAnimSet(dict, time)
    if HasAnimSetLoaded(dict) then
        return
    end

    local currTime = GetGameTimer()
    RequestAnimSet(dict)
    while not HasAnimSetLoaded(dict) do
        Wait(time or 15)

        local currTimeNow = GetGameTimer()
        if (currTimeNow > currTime + 2000 and currTimeNow > currTime + 10000) then
            print("ERROR: " .. dict .. " is not a valid animation set or took too long to load")
            return
        end
    end
end
exports("LoadAnimSet", LoadAnimSet)

-- WHEN TRIGGERED, LOAD PTFX ASSET (ERRORS OUT WHEN INVALID SO NO STUCK LOOPS)
function LoadPTFXAsset(asset, time)
    if HasNamedPtfxAssetLoaded(asset) then
        return
    end

    local currTime = GetGameTimer()
    RequestNamedPtfxAsset(asset)
    while not HasNamedPtfxAssetLoaded(asset) do
        Wait(time or 15)

        local currTimeNow = GetGameTimer()
        if (currTimeNow > currTime + 2000 and currTimeNow > currTime + 10000) then
            print("ERROR: " .. dict .. " is not a valid PTFX asset or took too long to load")
            return
        end
    end
end
exports("LoadPTFXAsset", LoadPTFXAsset)
