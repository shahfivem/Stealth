return {
    defaultStressRelief = {
        min = 0,
        max = 4
    },
    ---@class anim
    ---@field clip string
    ---@field dict string
    ---@field flag number

    ---@class prop
    ---@field model string
    ---@field bone number
    ---@field pos vector3
    ---@field rot vector3

    ---@class stressRelief
    ---@field min number
    ---@field max number

    ---@class consumable
    ---@field min number
    ---@field max number
    ---@field anim anim?
    ---@field prop table?
    ---@field stressRelief table?

    ---@class consumableAlcohol : consumable
    ---@field alcoholLevel number?

    consumables = {
        ---@type table<string, consumable>
        food = {
            
        },

        ---@type table<string, consumable>
        drink = {
        },

        ---@type table<string, consumableAlcohol>
        alcohol = {
        },
    },
}