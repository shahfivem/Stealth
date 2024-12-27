ConfigFirst = {}

ConfigFirst.EnteringVehicle = false -- Forced First person if the player is driving a vehicle. (Only the Driver, not the other players.

ConfigFirst.Options = {
    Vehicle = true, -- Forced First Person when you are aiming inside of a vehicle only.
    ForcedFirst = false, -- Forced First Person when the player is Aiming/Shooting.
    Bike = false, -- Enables forced first person when Aiming/Shooting On a Bike.
}


if ConfigFirst.Options.ForcedFirst then
  CreateThread(function()
      while true do
          sleep = 1000
          local _, weapon = GetCurrentPedWeapon(PlayerPedId())
          local unarmed = `WEAPON_UNARMED`
          if weapon == unarmed then
              sleep = 1000
          else
              sleep = 1
              if IsPlayerFreeAiming(PlayerId()) then
                  SetFollowPedCamViewMode(4)
              else
                  SetFollowPedCamViewMode(0)
              end
          end
          Wait(sleep)
      end
  end)
end


if ConfigFirst.Options.Vehicle then
  CreateThread(function()
      while true do
          local ped = PlayerPedId()
          local _, weapon = GetCurrentPedWeapon(ped)
          local unarmed = `WEAPON_UNARMED`
          local inVeh = GetVehiclePedIsIn(PlayerPedId(), false)
          sleep = 1000
          if IsPedInAnyVehicle(PlayerPedId()) and weapon ~= unarmed then
              sleep = 1
              if IsControlJustPressed(0, 25) then
                  SetFollowVehicleCamViewMode(4)
              elseif IsControlJustReleased(0, 25) then
                  SetFollowVehicleCamViewMode(0)
              end
          end
          Wait(sleep)
      end
  end)
end


if ConfigFirst.Options.Bike then
  CreateThread(function()
      while true do
          sleep = 1000
          local _, weapon = GetCurrentPedWeapon(PlayerPedId())
          local unarmed = `WEAPON_UNARMED`
          if IsPedOnAnyBike(PlayerPedId()) and weapon ~= unarmed then
              sleep = 1
              if IsControlJustPressed(0, 25) then
                  SetCamViewModeForContext(2, 4)
              elseif IsControlJustReleased(0, 25) then
                  SetCamViewModeForContext(2, 0)
              end
          else
              sleep = 1000
          end
          Wait(sleep)
      end
  end)
end