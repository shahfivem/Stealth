---@alias Tick fun(): nil

---@param fn fun(): any
---@return Tick
function lib.setTick( fn )

    local alive = true

    local tick = function()

        alive = false
    end

    CreateThread(function ()

        while alive do

            fn()

            Wait( 0 )
        end
    end)

    return tick
end

---@param tick Tick
function lib.clearTick( tick )

    tick()
end