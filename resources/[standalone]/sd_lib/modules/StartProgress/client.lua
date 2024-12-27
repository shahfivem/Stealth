local EnableOX = false -- Enable use of ox_lib for progressbars if available

--- Selects and returns the most appropriate function for starting a progress bar.
-- This function determines the best method for displaying progress bars based on the current game setup
-- (e.g., availability of ox_lib and configuration settings) or the active framework (ESX, QBCore).
---@return function A function tailored to start progress bars using the determined method.
local ProgressBar = function()
    -- Check if lib is available and use lib.progressBar if it is.
    if lib ~= nil and EnableOX then
        return function(identifier, label, duration, completed, notfinished)
            if lib.progressBar({
                duration = duration,  
                label = label,      
                useWhileDead = false,
                allowSwimming = true, 
                canCancel = true,  
                disable = { move = true } 
            }) then 
                completed()
            else 
                notfinished()
            end
        end
    else
        -- Return a function tailored to the active framework's method of showing progress bars
        if Framework == 'esx' then
            return function(identifier, label, duration, completed, notfinished)
                exports.esx_progressbar:Progressbar(label, duration, {
                    FreezePlayer = true,
                    onFinish = completed
                })
            end
        elseif Framework == 'qb' then
            return function(identifier, label, duration, completed, notfinished)
                QBCore.Functions.Progressbar(identifier, label, duration, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, completed, notfinished)
            end
        end
        
        -- Fallback function in case no method is configured
        return function(identifier, label, duration, completed, notfinished)
            error(string.format("No progress bar method configured. Unable to start progress for: %s", label))
            -- Optionally, call notfinished callback here if needed
        end
    end
end

--- The chosen method for starting a progress bar, determined at the time of script initialization.
local StartProgress = ProgressBar()

-- Function to start a progress tracking mechanism.
---@param identifier string The unique identifier for the progress instance.
---@param label string The label that describes the progress.
---@param duration number The duration for which the progress should be tracked.
---@param completed function Callback function to execute when progress completes.
---@param notfinished function Callback function to execute if progress does not complete.
---@param options table Optional parameters to customize the progress behavior.
SD.StartProgress = function(identifier, label, duration, completed, notfinished, options)
    StartProgress(identifier, label, duration, completed, notfinished, options)
end

return SD.StartProgress
