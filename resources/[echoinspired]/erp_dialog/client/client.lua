local DIALOG = {

  blur = false,
  isOpen = false,
  promise = nil,

  KeyboardInput = function(self, data)
    
    if not data then return end
    if self.promise then return end

    self.isOpen = true;

    self.promise = promise.new()

    for i=1, #data do 
      data[i].input = ''
    end

    SendReactMessage("MenuData", data)
    SetNuiFocus(self.isOpen, self.isOpen)

    SendReactMessage('setVisible', self.isOpen)
    
    self.blur = GetScreenblurFadeCurrentTime() ~= 0.0

    if not self.blur then
      TriggerScreenblurFadeIn(500)
    end

    return Citizen.Await(self.promise)

  end,

  Submit = function(self, data)
    self.isOpen = false;
    SetNuiFocus(self.isOpen, self.isOpen)
    SendReactMessage('setVisible', self.isOpen)
    
    if not self.blur then
      TriggerScreenblurFadeOut(500)
    end

    self.promise:resolve(data)
    self.promise = nil
  end

}

exports("KeyboardInput", function(...)
  return DIALOG:KeyboardInput(...)
end)

RegisterNUICallback('submit', function(data, cb)
  DIALOG:Submit(data)
  cb({})
end)

RegisterNUICallback("cancel", function(_, cb)
  DIALOG:Submit()
  cb({})
end)