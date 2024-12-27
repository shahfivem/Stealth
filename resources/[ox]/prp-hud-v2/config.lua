-- Weapons in this array will not show the ammo count in the hud.
HudConfig = {
    ExcludedWeapons = {
        [`WEAPON_SPEEDRADAR`] = true,
        [`WEAPON_PETROLCAN`] = true,
        [`weapon_scanner`] = true,
        [`WEAPON_PRESSUREWASHER`] = true,
        [`WEAPON_CHAINSAW`] = true,
        [`WEAPON_DRILL`] = true,
    }
}

Presets = {
    DEFAULT = {
        Label = "Default",

        Settings = {
            mapFormat = "circle",
            mapAxis = {
                x = 0.0,
                y = -0.02
            },

            barsLocation = "horizontal",
            barsAlignment = "custom",
            barsStyle = "fill",
            barsAxis = {
                x = 1,
                y = 1
            },

            textAlignment = "center",
            locationAlignment = "center",
            locationAxis = {
                x = 0,
                y = 0
            },
            locationOnFoot = false,

            speedometerStyle = "new"
        }
    },
    LEGACY = {
        Label = "Legacy (Old)",

        Settings = {
            mapFormat = "rectangular",
            mapAxis = {
                x = 0.0,
                y = 0.03,
            },

            barsLocation = "horizontal",
            barsAlignment = "center",
            barsStyle = "fill",
            barsAxis = {
                x = 1,
                y = 1,
            },

            textAlignment = "left",
            locationAlignment = "custom",
            locationAxis = {
                x = 16,
                y = 95,
            },
            locationOnFoot = true,

            speedometerStyle = "old"
        }
    }
}

WelcomeScreens = {
    {
        imageURL = "img/welcome/welcome_1.png",
        isVideo = false,
        title = "Welcome to ProdigyRP!",
        parts = {
            {
                title = "Your new apartment!",
                text = "In your F1 Menu - or by targeting the tablet on your apartment wall with your 'third eye' pressing alt, you'll be able to decorate your brand new home with our intuitive housing system. Also - in your welcome package we've given you some complimentary furniture to get started!"
            },
            {
                title = "Your phone",
                text = "In your inventory you'll find your phone, if you right click your phone you will be able to open it and place your sim card inside. In the top corner of your inventory you'll find the utility tab which will allow you to equip your phone."
            },
            {
                title = "Civilian Work",
                text = "Pick your choice of civilian work by opening your phone and downloading the Labor or Zoomer Driver apps. Both apps contain loads of honest work through out the map that all of progression and skill tree benefits!"
            },
            {
                title = "Skill Trees",
                text = "In the radial menu you will find a tab called 'Perk Menu'. In this menu you will find a whole host of civilian or criminal skill tree's that you can level by completing the associated activity type. You can level one skill tree at a time, but please take note that there is a daily XP cap to prevent excessive grinding."
            },
        }
    },
    {
        imageURL = "img/welcome/welcome_2.png",
        isVideo = false,
        title = "Some more information",
        parts = {
            {
                title = "No arena cats!",
                text = "We have a new rule for 2.0 to maintain authenticity with clothing to prevent players from dressing as toxic rp environment subcultures or to obvious FiveM Arena callouts like combinations of bowl cut hair, surgical gloves, cat ears, and goggles."
            },
            {
                title = "Open a ticket for rulebreaks",
                text = "Open a ticket on discord for rule breaks - don't bring it in character! Breaking character is one of the most severe rulebreaks on the server and will overshadow most complaints."
            },
            {
                title = "Lockpicks",
                text = "It's much easier to hotwire or unlock a stolen car using a screwdriver or a lock pick. You can try to hotwire local cars, but it is MUCH harder."
            },
            {
                title = "Animations and Clothing",
                text = "In the radial menu you can find visualized emotes that are placeable in the world that you can favorite or set any key combination to utilize on the fly. In addition we have a menu to unequip clothing pieces and giving them to your friends... or robbers. Pay attention to this feature because if you manage to get your hand on some rare sneakers or clothing you might have to hand those over in a stick up with a rival gang or professional criminal."
            },
        }
    }
}