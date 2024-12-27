local taskActive = false
local taskStatus = 0;

function closeGuiFail()
  taskActive = false
  taskStatus = 2;
  SendReactMessage('setVisible', taskActive)
  TriggerEvent('erp_progressbar:visible', taskActive)
end

function closeGui()
  taskActive = false
  taskStatus = 2;
  SendReactMessage('setVisible', taskActive)
  TriggerEvent('erp_progressbar:visible', taskActive)
end

AddEventHandler('blackbars', function(blackbarson)
  SendReactMessage("updateBlackbars", blackbarson);
end)

function closeNormalGui()
  taskActive = false
  taskStatus = 2;
  SendReactMessage('setVisible', taskActive)
  TriggerEvent('erp_progressbar:visible', taskActive)
end

exports('closeGuiFail', closeGuiFail)
exports('closeGui', closeGui)
exports('closeNormalGui', closeNormalGui)

local function taskBar(length, gap)
  if gap < 10 then gap = 10 end
  if taskActive then return 0 end;
  taskActive = true

  local left = math.random(15,90)

  SendReactMessage('setVisible', true)
  TriggerEvent('erp_progressbar:visible', true)
  SendReactMessage('setTarget', left)
  SendReactMessage('setLeft', 1)
  SendReactMessage('setGap', gap)

  taskStatus = 1;

  Wait(500)
  
  local targetTimer = GetGameTimer() + length
  
  while taskStatus == 1 and taskActive do
    Wait(0)

    local currentTimer = GetGameTimer()
    if currentTimer > targetTimer then
      taskStatus = 2
    end
    if IsPedRagdoll(PlayerPedId()) then
      taskStatus = 2
    end

    local diff = length - (targetTimer - currentTimer); 
    local sLeft = math.ceil((diff / length) * 100);
    if sLeft > 100 then
      sLeft = 100
    end

    if IsControlPressed(0, 38) then

      local leftOffset = left - (gap)

      local pass = sLeft >= leftOffset and sLeft <= left + gap

      taskStatus = pass and 3 or 2

    end

    SendReactMessage('setLeft', sLeft)
  end

  if taskStatus == 2 then
    SendReactMessage('setVisible', false)
    TriggerEvent('erp_progressbar:visible', false)
    taskActive = false
    return 0
  elseif taskStatus == 3 then
    SendReactMessage('setVisible', false)
    TriggerEvent('erp_progressbar:visible', false)
    taskActive = false
    return 100
  end 
end

exports('taskBar', taskBar)


--[[CreateThread(function()
  Wait(1000)
  print( taskBar(10000, 10) )
end)]]