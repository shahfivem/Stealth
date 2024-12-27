local taskStatus = {
  active = false,
  id = 0,
  status = 0
}

-- Transfer exports, blah.

function closeGuiFail()
  taskStatus['status'] = 2;
end

function closeGui()
  taskStatus['status'] = 2;
end

exports('closeGui', closeGui)
exports('closeGuiFail', closeGuiFail)

-- Actual code:

RegisterNUICallback('finished', function(data, cb)
  taskStatus['status'] = 3;
  cb("Thank you!")
end)



local function updateStatus(type)
  CreateThread(function()
    SendReactMessage("updateStatus", type);
    Wait(1250)
    SendReactMessage("updateStatus", "normal");
    SendReactMessage("setVisible", false);
    TriggerEvent('erp_progressbar:visible', false)
  end)
end

AddEventHandler('blackbars', function(blackbarson)
  SendReactMessage("updateBlackbars", blackbarson);
end)


exports('updateStatus', updateStatus)

local speaking = false
local speakingWidth = 0

-- length, text, runcheck, ignoreclear, keepweapon, vehicle, distcheck, animation

local function taskBar(data)

  local length, text, runcheck, ignoreclear, keepweapon, vehicle, distcheck, animation, desc, preventCancel, showTime, flopcheck, holdKey = data.length, data.text, data.runcheck, data.ignoreclear, data.keepweapon, data.vehicle, data.distcheck, data.animation, data.desc, data.preventCancel, data.showTime, data.flopcheck, data.holdKey
  local keepoutofvehicle = data.keepoutofvehicle
  local bypassCaffeine = data.bypasscaffeine
  local stopRunning = data.stopRunning
  local disable = data.disable
  local plyPed = PlayerPedId()
  local startPos = GetEntityCoords(plyPed)
  local dict, anim, prop, scenario, stuck, animTime = "", "", "", "", false, 0
  speakingWidth = 0
  speaking = data.speaking or false
  
  if not keepweapon then
    TriggerEvent('ox_inventory:disarm', PlayerPedId(), true)
    Wait(500)
  end

  if not bypassCaffeine and LocalPlayer.state.caffeinated then length = length * 0.7 end
  if animation and animation['dict'] then
    dict = animation['dict']
    anim = animation['anim']
    prop = animation['prop'] or ""
    stuck = animation['stuck'] or false
    animTime = animation['animTime'] or 0

    if not HasAnimDictLoaded(dict) then
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
      end
    end
  elseif animation and animation['scenario'] then
    scenario = animation['scenario']
    if not IsPedUsingScenario(plyPed, scenario) then
      ClearPedTasks(plyPed)
      TaskStartScenarioInPlace(plyPed, scenario, 0, true)
    end
  end
  
  if taskStatus['active'] then return 0 end -- Return 0% has been completed if there is already an ongoing progress bar!
  taskStatus['active'] = true;
  
  local id = taskStatus['id'] + 1;
  taskStatus['id'] = id;
  taskStatus['status'] = 1;

  SendReactMessage("updateError", false);
  SendReactMessage("setVisible", true);

  TriggerEvent('erp_progressbar:visible', true)

  SendReactMessage("updateWidth", 0);
  SendReactMessage("updateText", text or "")
  SendReactMessage("updateDesc", desc or "")
  SendReactMessage("preventCancel", preventCancel or false)
  SendReactMessage("showTime", showTime or false)
  SendReactMessage("updateTime", math.ceil(length / 1000));

  local targetTimer = GetGameTimer() + length
  local createdProp = 0

  local targetWidth = speaking and length or 100
  
  while taskStatus['id'] == id and taskStatus['status'] == 1 do

    Wait(0)
    
    local currentTimer = GetGameTimer();

    if currentTimer > targetTimer and not speaking then
      taskStatus['status'] = 3
    elseif speaking and speakingWidth > 100.0 then
      taskStatus['status'] = 3
    end

    local diff = length - (targetTimer - currentTimer)
    local width = math.ceil((diff / length) * 100);

    if holdKey then
        if not IsControlPressed(0, 38) and not IsDisabledControlPressed(0, 38) then
            targetTimer = GetGameTimer() + length
        end
    end

    if disable then
      if disable.mouse then
          DisableControlAction(0, 1, true) -- Look left-right
          DisableControlAction(0, 2, true) -- Look up-down
          DisableControlAction(0, 106, true) -- Mouse control override
      end

      if disable.movement then
          DisableControlAction(0, 30, true) -- Move left-right
          DisableControlAction(0, 31, true) -- Move up-down
          DisableControlAction(0, 21, true) -- Sprint
          DisableControlAction(0, 36, true) -- Duck
      end

      if disable.car then
          DisableControlAction(0, 63, true) -- Veh move left
          DisableControlAction(0, 64, true) -- Veh move right
          DisableControlAction(0, 71, true) -- Veh accelerate
          DisableControlAction(0, 72, true) -- Veh brake
          DisableControlAction(0, 75, true) -- Veh exit
      end

      if disable.combat then
          DisableControlAction(0, 25, true) -- Aim
          DisablePlayerFiring(PlayerId(), true) -- Prevent firing
      end
  end

    if speaking then
      if NetworkIsPlayerTalking(PlayerId()) then
        speakingWidth = speakingWidth + 0.2
      else
        speakingWidth = speakingWidth - 0.1
      end
      width = speakingWidth
    end

    if speakingWidth > length then
      speakingWidth = length
    elseif speakingWidth < 0 then
      speakingWidth = 0
    end
    
    if width > targetWidth then
      width = targetWidth
    elseif width < 0 then
      width = 0
    end

    if showTime then
      SendReactMessage("updateTime", math.ceil((targetTimer - currentTimer) / 1000));
    end

    SendReactMessage("updateWidth", width);

    if runcheck then
      if IsPedClimbing(plyPed) or IsPedJumping(plyPed) or IsPedSwimming(plyPed) then
        taskStatus = { active = false, id = 0, status = 0 }
        updateStatus("error")
        if anim ~= "" then
          StopAnimTask(plyPed, dict, anim, 2.0)
          if DoesEntityExist(createdProp) then
            DetachEntity(createdProp, 1, 1)
            DeleteEntity(createdProp)
          end
        end
        if scenario ~= "" then
          ClearPedTasks(plyPed)
        end
        return width
      end
    end

    if IsPedShooting(plyPed) then
      taskStatus = { active = false, id = 0, status = 0 }
      updateStatus("error")
      if anim ~= "" then
        StopAnimTask(plyPed, dict, anim, 2.0)
        if DoesEntityExist(createdProp) then
          DetachEntity(createdProp, 1, 1)
          DeleteEntity(createdProp)
        end
      end
      if scenario ~= "" then
        ClearPedTasks(plyPed)
      end
      return width
    end

    if keepoutofvehicle then
      if IsPedInAnyVehicle(plyPed, false) then
        taskStatus = { active = false, id = 0, status = 0 }
        updateStatus("error")
        if anim ~= "" then
          StopAnimTask(plyPed, dict, anim, 2.0)
          if DoesEntityExist(createdProp) then
            DetachEntity(createdProp, 1, 1)
            DeleteEntity(createdProp)
          end
        end
        if scenario ~= "" then
          ClearPedTasks(plyPed)
        end
        return width
      end
    end

    if vehicle ~= nil and vehicle ~= false then
      local driverPed = GetPedInVehicleSeat(vehicle, -1)
      if driverPed ~= plyPed then
        taskStatus = { active = false, id = 0, status = 0 }
        updateStatus("error")
        if anim ~= "" then
          StopAnimTask(plyPed, dict, anim, 2.0)
          if DoesEntityExist(createdProp) then
            DetachEntity(createdProp, 1, 1)
            DeleteEntity(createdProp)
          end
        end
        if scenario ~= "" then
          ClearPedTasks(plyPed)
        end
        return width
      end
    end

    if distcheck ~= nil then
      if #(GetEntityCoords(plyPed) - startPos) > distcheck then
        taskStatus = { active = false, id = 0, status = 0 }
        updateStatus("error")
        if anim ~= "" then
          StopAnimTask(plyPed, dict, anim, 2.0)
          if DoesEntityExist(createdProp) then
            DetachEntity(createdProp, 1, 1)
            DeleteEntity(createdProp)
          end
        end
        if scenario ~= "" then
          ClearPedTasks(plyPed)
        end
        return width
      end
    end

    if flopcheck then
      if IsPedRagdoll(plyPed) or IsPedBeingStunned(plyPed, 1) then
        taskStatus = { active = false, id = 0, status = 0 }
        updateStatus("error")
        if anim ~= "" then
          StopAnimTask(plyPed, dict, anim, 2.0)
          if DoesEntityExist(createdProp) then
            DetachEntity(createdProp, 1, 1)
            DeleteEntity(createdProp)
          end
        end
        if scenario ~= "" then
          ClearPedTasks(plyPed)
        end
        return width
      end
    end

    if not preventCancel then
      if IsControlJustReleased(0, 202) then
        taskStatus = { active = false, id = 0, status = 0 }
        updateStatus("error")
        if anim ~= "" then
          StopAnimTask(plyPed, dict, anim, 2.0)
          if DoesEntityExist(createdProp) then
            DetachEntity(createdProp, 1, 1)
            DeleteEntity(createdProp)
          end
        end
        if scenario ~= "" then
          ClearPedTasks(plyPed)
        end
        return width
      end
    end

    if anim ~= "" then
      if not IsEntityPlayingAnim(plyPed, dict, anim, 3) then
        local flag = 49
        if stuck then flag = 0; end
        if animation.flag then flag = animation.flag end
        TaskPlayAnim(plyPed, dict, anim, 3.0, 1.0, -1, flag, 0, 0, 0, 0 )
      end
      if prop ~= "" then
        if not DoesEntityExist(createdProp) then
          local propData = PropEmotes[prop]
          if propData then
            local tPos = GetOffsetFromEntityInWorldCoords(plyPed, propData.xOffset, propData.yOffset, propData.zOffset)
            createdProp = CreateObject(propData.hash, tPos, 1, 1, 0)
            AttachEntityToEntity(createdProp, plyPed, GetPedBoneIndex(plyPed, propData.bone), propData.xPos, propData.yPos, propData.zPos, propData.xRot, propData.yRot, propData.zRot, 1, propData.softSpinning, propData.collision, propData.isPed, propData.rotationOrder, propData.fixedRot)
          end
        end
      end
    end

    if scenario ~= "" then
      if not IsPedUsingScenario(plyPed, scenario) then
        ClearPedTasks(plyPed)
        TaskStartScenarioInPlace(plyPed, scenario, 0, true)
      end
    end

    if stopRunning then
      DisableControlAction(0, 21, true)
    end

  end

  local res = taskStatus['status']
  if res == 2 then
    local diff = length - GetGameTimer();
    local total = math.ceil((diff / length) * 100);
    taskStatus = { active = false, id = 0, status = 0 }
    updateStatus("orange")
    if anim ~= "" then
      StopAnimTask(plyPed, dict, anim, 2.0)
      if DoesEntityExist(createdProp) then
        DetachEntity(createdProp, 1, 1)
		    DeleteEntity(createdProp)
      end
    end
    if scenario ~= "" then
      ClearPedTasks(plyPed)
    end
    SendReactMessage("updateWidth", 0);
    return total;
  else
    SendReactMessage("setVisible", false);
    TriggerEvent('erp_progressbar:visible', false)
    taskStatus = { active = false, id = 0, status = 0 }
    if anim ~= "" then
      StopAnimTask(plyPed, dict, anim, 2.0)
      if DoesEntityExist(createdProp) then
        DetachEntity(createdProp, 1, 1)
		    DeleteEntity(createdProp)
      end
    end
    if scenario ~= "" then
      ClearPedTasks(plyPed)
    end
    SendReactMessage("updateWidth", 0);
    return 100
  end;
end

exports('taskBar', taskBar)

function isTaskbarFree()
  return not taskStatus['active']
end

exports('isTaskbarFree', isTaskbarFree)