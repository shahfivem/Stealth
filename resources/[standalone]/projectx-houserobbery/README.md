# Project X House Robbery

House Robbery Script - Project X

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Tebex](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)

## Installation

### Required Dependencies if you want to use the script as is

[Renewed qb-phone](https://github.com/Renewed-Scripts/qb-phone) (**Optional** For the pre-configured group system)
[Skill-System](**Optional** You will have to search for one that looks best to you)
[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch) (For the pre-configured dispatch)

[Minigames](https://drive.google.com/file/d/1lOhbP99Yu0cIHBmz4-EbCB_mR4D0cNO5/view?usp=sharing) (Download and place in your standalone folder)

-- ESX and QBOX Frameworks:
[qb-interior](https://github.com/qbcore-framework/qb-interior) (Works with ESX, free resource by K4MBI for default shells, if you don't have it, you need to download it)

### Add this to server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
  ensure qb-phone -- If you installed the group work system
  ensure Your Skill System -- If you installed a skill system
  ensure projectx-houserobbery
```

#### qb inventory items

```lua
 ["x_artpiece"]     = {["name"] = "x_artpiece",       ["label"] = "Art",       ["weight"] = 25000,  ["type"] = "item",   ["image"] = "xartpiece.png",   ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Some fancy Art"},
 ["x_television"]     = {["name"] = "x_television",    ["label"] = "TV",       ["weight"] = 25000,  ["type"] = "item",   ["image"] = "xtelevision.png",  ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Flat Screen TV"},
 ["musicequipment"]      = {["name"] = "musicequipment",     ["label"] = "Music Equipment",    ["weight"] = 25000,  ["type"] = "item",   ["image"] = "musicequipment.png",   ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Music Equipment"},
 ["pcequipment"]       = {["name"] = "pcequipment",      ["label"] = "Computer Equipment",   ["weight"] = 25000,  ["type"] = "item",   ["image"] = "xpcequipment.png",    ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Computer Equipment"},
 ["microwave"]        = {["name"] = "microwave",         ["label"] = "Microwave",     ["weight"] = 25000,  ["type"] = "item",   ["image"] = "xmicrowave.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Heats things up"},
 ["coffeemaker"]      = {["name"] = "coffeemaker",      ["label"] = "Coffee Machine",    ["weight"] = 25000,  ["type"] = "item",   ["image"] = "xcoffeemaker.png",  ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes a delicious expresso"},
 ["x_painting"]     = {["name"] = "x_painting",       ["label"] = "Painting",        ["weight"] = 25000,  ["type"] = "item",   ["image"] = "xpainting.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Just a work of art,"},
 ["x_painting2"]     = {["name"] = "x_painting2",     ["label"] = "Painting",        ["weight"] = 25000,  ["type"] = "item",   ["image"] = "xpainting2.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Just a work of art,"},
 ["x_guitar"]             = {["name"] = "x_guitar",           ["label"] = "Guitar",           ["weight"] = 25000,   ["type"] = "item",    ["image"] = "xguitar.png",         ["unique"] = true,    ["useable"] = false,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Music Equipment"},
 ["x_suitcase"]             = {["name"] = "x_suitcase",          ["label"] = "Suitcase",           ["weight"] = 25000,   ["type"] = "item",    ["image"] = "xsuitcase.png",       ["unique"] = true,    ["useable"] = false,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Work Suitcase"},
```

### ox_Inventory items

```lua
 ["x_coffeemaker"] = {
  label = "Coffee Maker",
  weight = 500,
  stack = true,
  close = false,
  description = "To make that perfect cup of Joe!",
  client = {
    image = "x_coffeemaker.png"
  }
 },

 ["x_artpiece"] = {
  label = "Art Piece",
  weight = 500,
  stack = true,
  close = false,
  description = "A unique piece of art!",
  client = {
    image = "x_artpiece.png"
  }
 },

 ["x_guitar"] = {
  label = "Guitar",
  weight = 300,
  stack = true,
  close = false,
  description = "A guitar!",
  client = {
    image = "x_guitar.png"
  }
 },

 ["x_microwave"] = {
  label = "Microwave",
  weight = 800,
  stack = true,
  close = false,
  description = "A microwave - for heating things up!",
  client = {
    image = "x_microwave.png"
  }
 },

 ["x_musicequipment"] = {
  label = "Coffee Maker",
  weight = 500,
  stack = true,
  close = false,
  description = "The keys to success.. As some Dj's would say",
  client = {
    image = "x_musicequipment.png"
  }
 },

 ["x_painting"] = {
  label = "Painting",
  weight = 200,
  stack = true,
  close = false,
  description = "A modern work of art!",
  client = {
    image = "x_painting.png"
  }
 },

 ["x_painting2"] = {
  label = "Painting",
  weight = 200,
  stack = true,
  close = false,
  description = "A modern work of art!",
  client = {
    image = "x_painting2.png"
  }
 },

 ["x_pcequipment"] = {
  label = "PC",
  weight = 600,
  stack = true,
  close = false,
  description = "A PC, for gaming?! Well of course it is!",
  client = {
    image = "x_pcequipment.png"
  }
 },

 ["x_suitcase"] = {
  label = "Suit Case",
  weight = 200,
  stack = true,
  close = false,
  description = "A leather suitcase, what the hell is inside of this?",
  client = {
    image = "x_suitcase.png"
  }
 },

 ["x_television"] = {
  label = "Television",
  weight = 800,
  stack = true,
  close = false,
  description = "A modern flatscreen TV",
  client = {
    image = "x_television.png"
  }
 },
```

### Renewed-Weaponscarry (Optional, **Not Required**) (QBCore Only)

[Renewed-Weaponscarry](https://github.com/Renewed-Scripts/Renewed-Weaponscarry)

### Items to add to the weapons-carry script (Thanks to Xandrice#0001)

-- House Robbery Items

```lua
    pcequipment = {
        model = 'prop_dyn_pc_02',
        bone = 24817,
        pos = vec3(0.09, 0.43, 0.05),
        rot = vec3(91.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    coffeemaker = {
        model = 'prop_coffee_mac_02',
        bone = 24817,
        pos = vec3(0.02, 0.43, 0.03),
        rot = vec3(91.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    x_artpiece = {
        model = 'v_res_sculpt_decf',
        bone = 24817,
        pos = vec3(-0.25, 0.43, 0.00),
        rot = vec3(0.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    musicequipment = {
        model = 'prop_speaker_06',
        bone = 24817,
        pos = vec3(-0.10, 0.43, 0.05),
        rot = vec3(180.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    microwave = {
        model = 'prop_microwave_1',
        bone = 24817,
        pos = vec3(-0.20, 0.43, 0.05),
        rot = vec3(91.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    x_suitcase = {
        model = 'prop_ld_suitcase_01',
        bone = 24817,
        pos = vec3(-0.10, 0.43, 0.05),
        rot = vec3(0.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    x_television = {
        model = 'sm_prop_smug_tv_flat_01',
        bone = 24817,
        pos = vec3(-0.20, 0.43, 0.0),
        rot = vec3(0.0, -90.0, 180.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    x_painting = {
        model = 'ch_prop_vault_painting_01c',
        bone = 24817,
        pos = vec3(-0.18, 0.43, 0.05),
        rot = vec3(180.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    x_painting2 = {
        model = 'ch_prop_vault_painting_01d',
        bone = 24817,
        pos = vec3(-0.18, 0.43, 0.05),
        rot = vec3(180.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    x_guitar = {
        model = 'sf_prop_sf_guitar_case_01a',
        bone = 24817,
        pos = vec3(-0.01, 0.50, 0.05),
        rot = vec3(90.0, 0.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },
```
