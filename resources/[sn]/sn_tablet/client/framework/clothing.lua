function manageWorkOutfits()
    if Config.appearance == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:OutfitManagementMenu', {type = 'Job'})
    elseif Config.appearance == 'fivem-appearance' then
        TriggerEvent('fivem-appearance:client:OutfitManagementMenu', {type = 'Job'})
    elseif Config.appearance == 'sn_appearance' then
        TriggerEvent('sn_appearance:client:manageOutfits', {type = 'job'})
    end
end

function openOutfitMenu(job)
    if Config.appearance == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:openOutfitMenu')
    elseif Config.appearance == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:openOutfitMenu')
    elseif Config.appearance == 'fivem-appearance' then
        TriggerEvent('fivem-appearance:client:openOutfitMenu')
    elseif Config.appearance == 'codem-appearance' then
        TriggerEvent('codem-apperance:OpenWardrobe')
    elseif Config.appearance == 'raid_clothes' then
        TriggerEvent('raid_clothes:openmenu')
    elseif Config.appearance == 'sleek-clothestore' then
        exports['sleek-clothestore']:OpenWardrobe()
    elseif Config.appearance == 'rcore_clothes' then
        TriggerEvent('rcore_clothes:openOutfits')
    elseif Config.appearance == 'ak47_clothing' then
        TriggerEvent('ak47_clothing:openOutfitMenu')
    elseif Config.appearance == 'sn_appearance' then
        TriggerEvent('sn_appearance:client:openMenu', job and 'locker' or 'outfitMenu')
    end
end

exports('manageWorkOutfits', manageWorkOutfits)
exports('openOutfitMenu', openOutfitMenu)
exports('getAppearanceType', Config.appearance)