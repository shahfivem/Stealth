function getBusinessFunds(job)
    if Config.society == 'sn_corejobs' then
        return exports.sn_corejobs:getBusinessFunds(job)
    elseif Config.society == 'qb-banking' then
        return exports['qb-banking']:GetAccountBalance(job)
    elseif Config.society == 'Renewed-Banking' then
        return exports['Renewed-Banking']:getAccountMoney(job)
    elseif Config.society == 'esx_society' then
        local society, money
        TriggerEvent('esx_society:getSociety', job, function(soci)
            society = soci
        end)
        TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
            money = account.money
        end)
        return money or 0
    end
    return 0
end

function addBusinessFunds(job, amount, reason)
    if Config.society == 'sn_corejobs' then
        return exports.sn_corejobs:addBusinessFunds(job, amount, reason)
    elseif Config.society == 'qb-banking' then
        exports['qb-banking']:AddMoney(job, amount, reason)
    elseif Config.society == 'Renewed-Banking' then
        exports['Renewed-Banking']:addAccountMoney(job, amount, reason)
    elseif Config.society == 'esx_society' then
        TriggerServerEvent('esx_society:depositMoney', job, amount)
    end
end

function removeBusinessFunds(job, amount, reason)
    if Config.society == 'sn_corejobs' then
        return exports.sn_corejobs:removeBusinessFunds(job, amount, reason)
    elseif Config.society == 'qb-banking' then
        exports['qb-banking']:RemoveMoney(job, amount, reason)
    elseif Config.society == 'Renewed-Banking' then
        exports['Renewed-Banking']:removeAccountMoney(job, amount, reason)
    elseif Config.society == 'esx_society' then
        TriggerServerEvent('esx_society:withdrawMoney', job, amount)
    end
end

lib.callback.register('sn_tablet:callback:getfunds', function(source, job)
    return getBusinessFunds(job)
end)

exports('getBusinessFunds', getBusinessFunds)
exports('addBusinessFunds', addBusinessFunds)
exports('removeBusinessFunds', removeBusinessFunds)