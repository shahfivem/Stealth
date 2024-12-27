function GetItemLabel(item)
    if UsingOxInventory then
        return exports.ox_inventory:Items(item).label
    else
        return QBCore.Shared.Items[item].label
    end
end