function ReviveFunction()
  Citizen.Wait(6000)
  TriggerEvent("hospital:client:Revive")
  Citizen.Wait(1000)
end

function giveWeapon()
  if Config.OxInventory then 
    exports.ox_inventory:weaponWheel(true)
  end
  local playerPed = PlayerPedId()
  GiveWeaponToPed(playerPed, GetHashKey(Config.Weapon.Name ), 0, false, true)
  SetCurrentPedWeapon(playerPed, GetHashKey(Config.Weapon.Name ), true)
  SetPedAmmo(playerPed, GetHashKey(Config.Weapon.Name ), Config.Weapon.Ammo)
end


function DeleteWeapon()
  if Config.OxInventory then 
    exports.ox_inventory:weaponWheel(false)
  end
  local playerPed = PlayerPedId()
  RemoveWeaponFromPed(playerPed, GetHashKey(Config.Weapon.Name))
end

function DrawText3D(x,y,z, text)
      local onScreen,_x,_y=World3dToScreen2d(x,y,z)
      local px,py,pz=table.unpack(GetGameplayCamCoords())
      
      SetTextScale(0.35, 0.35)
      SetTextFont(4)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 215)
    
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
      local factor = (string.len(text)) / 370
      DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end

  function ShowFloatingHelpNotification(msg, coords,r)
    AddTextEntry('FloatingHelpNotification'..'_'..r, msg)
    SetFloatingHelpTextWorldPosition(1, coords.x,coords.y,coords.z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('FloatingHelpNotification'..'_'..r)
    EndTextCommandDisplayHelp(2, false, false, -1)
end