local Translations = {
    error = {
        no_water = "You are not near water",
        no_fish = "You failed to catch the fish",
        already_fishing = "You are already fishing",
        nobait = "You need fishing bait to fish",
        cantanchor = "You cannot drop anchor with the engine on.",
        cantanchorboat = "You cannot use the anchor without a boat.",
        nochum = "You have no chum left and you have stopped fishing.",
        freshwater = "You cannot net fish in fresh water",
        missingchum = "You cannot net fish without chum",
        cannotfish = "You cannot fish for these type of fish in this area",
        cannotfishland = "You cannot fish on land",
        shallowwater = "You cannot fish for these type of fish in this area",
        notlevel = "You are not a high enough level to catch these fish",
        noboat = "You need to be in a boat to catch fish with a net",
        nolicenseshop = "You need a fishing license to access the shop",
        nolicensexp = "You need a fishing license to view your XP",
        lockpickvehicle = "You cannot open this box in a vehicle",
        nolockpick = "You need a lockpick to open this",
        treasurefail = "You have failed to open the treasure"
    },
    success = {
        fishing = "You are fishing",
        caught = "You successfully caught the fish",
        anchored = "You have anchored your boat",
        removeanchor = "You have picked up your anchor",
        speed = "You have reached "..Config.NetSpeed.." mph and will start catching fish",
        treasurestart = "Opening...",
        treasuresuccess = "You have successfully opened the treasure",
    },
    primary = {
        bite = "You feel a bite...",
        tooslow = "Please reach "..Config.NetSpeed.." mph or greater to start fishing",
        chum = "There is no chum in your bag. You add more."
    },
    anchor = {
        dropanchor = "Dropping Anchor",
        pickupanchor = "Picking Up Anchor"
    },
    net = {
        dropnet = "Dropping Net",
        pickupnet = "Picking Up Net"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
