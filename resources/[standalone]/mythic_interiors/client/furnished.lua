-- Thanks Stroudy <3
function CreateHotelFurnished(generator)
  local objects = {
    building  = CreateObject(GetHashKey('playerhouse_hotel'),generator.x - 0.7,generator.y-0.4,generator.z-1.42,false,false,false),
    stuff     = CreateObject(GetHashKey("v_49_motelmp_stuff"),generator.x,generator.y,generator.z,false,false,false),
    bed       = CreateObject(GetHashKey("v_49_motelmp_bed"),generator.x+1.4,generator.y-0.55,generator.z,false,false,false),
    clothes   = CreateObject(GetHashKey("v_49_motelmp_clothes"),generator.x-2.0,generator.y+2.0,generator.z+0.15,false,false,false),
    winframe  = CreateObject(GetHashKey("v_49_motelmp_winframe"),generator.x+0.74,generator.y-4.26,generator.z+1.11,false,false,false),
    winglass  = CreateObject(GetHashKey("v_49_motelmp_glass"),generator.x+0.74,generator.y-4.26,generator.z+1.13,false,false,false),
    wincurt   = CreateObject(GetHashKey("v_49_motelmp_curtains"),generator.x+0.74,generator.y-4.15,generator.z+0.9,false,false,false),
    winscreen = CreateObject(GetHashKey("v_49_motelmp_screen"),generator.x-2.21,generator.y-0.6,generator.z+0.79,false,false,false),
    trainerA  = CreateObject(GetHashKey("v_res_fa_trainer02r"),generator.x-1.9,generator.y+3.0,generator.z+0.38,false,false,false),
    trainerB  = CreateObject(GetHashKey("v_res_fa_trainer02l"),generator.x-2.1,generator.y+2.95,generator.z+0.38,false,false,false),
    sink      = CreateObject(GetHashKey("prop_sink_06"),generator.x+1.1,generator.y+4.0,generator.z,false,false,false),
    chair1    = CreateObject(GetHashKey("prop_chair_04a"),generator.x+2.1,generator.y-2.4,generator.z,false,false,false),
    chair2    = CreateObject(GetHashKey("prop_chair_04a"),generator.x+0.7,generator.y-3.5,generator.z,false,false,false),
    kettle    = CreateObject(GetHashKey("prop_kettle"),generator.x-2.3,generator.y+0.6,generator.z+0.9,false,false,false),
    tvCabinet = CreateObject(GetHashKey("Prop_TV_Cabinet_03"),generator.x-2.3,generator.y-0.6,generator.z,false,false,false),
    tv        = CreateObject(GetHashKey("prop_tv_06"),generator.x-2.3,generator.y-0.6,generator.z+0.7,false,false,false),
    toilet    = CreateObject(GetHashKey("Prop_LD_Toilet_01"),generator.x+2.1,generator.y+2.9,generator.z,false,false,false),
    clock     = CreateObject(GetHashKey("Prop_Game_Clock_02"),generator.x-2.55,generator.y-0.6,generator.z+2.0,false,false,false),
    phone     = CreateObject(GetHashKey("v_res_j_phone"),generator.x+2.4,generator.y-1.9,generator.z+0.64,false,false,false),
    ironBoard = CreateObject(GetHashKey("v_ret_fh_ironbrd"),generator.x-1.7,generator.y+3.5,generator.z+0.15,false,false,false),
    iron      = CreateObject(GetHashKey("prop_iron_01"),generator.x-1.9,generator.y+2.85,generator.z+0.63,false,false,false),
    mug1      = CreateObject(GetHashKey("V_Ret_TA_Mug"),generator.x-2.3,generator.y+0.95,generator.z+0.9,false,false,false),
    mug2      = CreateObject(GetHashKey("V_Ret_TA_Mug"),generator.x-2.2,generator.y+0.9,generator.z+0.9,false,false,false),
    binder    = CreateObject(GetHashKey("v_res_binder"),generator.x-2.2,generator.y+1.3,generator.z+0.87,false,false,false),
  }
  
  FreezeEntityPosition(objects.building,true)
	FreezeEntityPosition(objects.sink,true)
	FreezeEntityPosition(objects.chair1,true)	
	FreezeEntityPosition(objects.chair2,true)
	FreezeEntityPosition(objects.tvCabinet,true)	
	FreezeEntityPosition(objects.tv,true)		
	SetEntityHeading(objects.chair1,GetEntityHeading(objects.chair1)+270)
	SetEntityHeading(objects.chair2,GetEntityHeading(objects.chair2)+180)
	SetEntityHeading(objects.kettle,GetEntityHeading(objects.kettle)+90)
	SetEntityHeading(objects.tvCabinet,GetEntityHeading(objects.tvCabinet)+90)
	SetEntityHeading(objects.tv,GetEntityHeading(objects.tv)+90)
	SetEntityHeading(objects.toilet,GetEntityHeading(objects.toilet)+270)
	SetEntityHeading(objects.clock,GetEntityHeading(objects.clock)+90)
	SetEntityHeading(objects.phone,GetEntityHeading(objects.phone)+220)
	SetEntityHeading(objects.ironBoard,GetEntityHeading(objects.ironBoard)+90)
	SetEntityHeading(objects.iron,GetEntityHeading(objects.iron)+230)
	SetEntityHeading(objects.mug1,GetEntityHeading(objects.mug1)+20)
  SetEntityHeading(objects.mug2,GetEntityHeading(objects.mug2)+230)
  
  local POIOffsets = {}

  POIOffsets.exit = json.decode('{"x": -1.66,"y": -3.692, "z": 0.92, "h": 2.26}')
  POIOffsets.clothing = json.decode('{"x": -1.07,"y": 2.6197, "z": 0.92, "h": 2.26}')
  POIOffsets.stash = json.decode('{"x": -1.578,"y": 0.82666, "z": 0.92, "h": 2.26}')
  POIOffsets.bedstash = json.decode('{"x": 1.198,"y": 0.693, "z": 0.92, "h": 2.26}')

  -- -217.51
  return { objects, POIOffsets }
end

-- Thanks Stroudy <3
function CreateTier1HouseFurnished(spawn, isBackdoor, cb)
  local POIOffsets = {}
  POIOffsets.exit = json.decode('{"z":2.5,"y":-16.501171875,"x":5.01012802124,"h":2.2633972168}')
  POIOffsets.backdoor = json.decode('{"z":2.5,"y":4.3798828125,"x":0.88999176025391,"h":182.2633972168}')

  RequestModel(`playerhouse_tier1_full`)
  while not HasModelLoaded(`playerhouse_tier1_full`) do 
    Wait(100) 
    RequestModel(`playerhouse_tier1_full`)
    print("Waiting for the model to load.")
  end

  local shell = CreateObject(`playerhouse_tier1_full`, spawn.x, spawn.y, spawn.z, false, false, false)
  FreezeEntityPosition(shell, true)
  Wait(500)

  local objects = {
    dt = CreateObject(GetHashKey("V_16_DT"), spawn.x-1.21854400, spawn.y-1.04389600, spawn.z+1.39068600, false, false, false),
    mpmid01 = CreateObject(GetHashKey("V_16_mpmidapart01"), spawn.x+0.52447510, spawn.y-5.04953700, spawn.z+1.32, false, false, false),
    mpmid09 = CreateObject(GetHashKey("V_16_mpmidapart09"), spawn.x+0.82202150, spawn.y+2.29612000, spawn.z+1.88, false, false, false),
    mpmid07 = CreateObject(GetHashKey("V_16_mpmidapart07"), spawn.x-1.91445900, spawn.y-6.61911300, spawn.z+1.45, false, false, false),
    mpmid03 = CreateObject(GetHashKey("V_16_mpmidapart03"), spawn.x-4.82565300, spawn.y-6.86803900, spawn.z+1.14, false, false, false),
    midData = CreateObject(GetHashKey("V_16_midapartdeta"), spawn.x+2.28558400, spawn.y-1.94082100, spawn.z+1.32, false, false, false),
    glow = CreateObject(GetHashKey("V_16_treeglow"), spawn.x-1.37408500, spawn.y-0.95420070, spawn.z+1.135, false, false, false),
    curtins = CreateObject(GetHashKey("V_16_midapt_curts"), spawn.x-1.96423300, spawn.y-0.95958710, spawn.z+1.280, false, false, false),
    mpmid13 = CreateObject(GetHashKey("V_16_mpmidapart13"), spawn.x-4.65580700, spawn.y-6.61684000, spawn.z+1.259, false, false, false),
    mpcab = CreateObject(GetHashKey("V_16_midapt_cabinet"), spawn.x-1.16177400, spawn.y-0.97333810, spawn.z+1.27, false, false, false),
    mpdecal = CreateObject(GetHashKey("V_16_midapt_deca"), spawn.x+2.311386000, spawn.y-2.05385900, spawn.z+1.297, false, false, false),
    mpdelta = CreateObject(GetHashKey("V_16_mid_hall_mesh_delta"), spawn.x+3.69693000, spawn.y-5.80020100, spawn.z+1.293, false, false, false),
    beddelta = CreateObject(GetHashKey("V_16_mid_bed_delta"), spawn.x+7.95187400, spawn.y+1.04246500, spawn.z+1.28402300, false, false, false),
    bed = CreateObject(GetHashKey("V_16_mid_bed_bed"), spawn.x+6.86376900, spawn.y+1.20651200, spawn.z+1.33589100, false, false, false),
    beddecal = CreateObject(GetHashKey("V_16_MID_bed_over_decal"), spawn.x+7.82861300, spawn.y+1.04696700, spawn.z+1.34753700, false, false, false),
    bathDelta = CreateObject(GetHashKey("V_16_mid_bath_mesh_delta"), spawn.x+4.45460500, spawn.y+3.21322800, spawn.z+1.21116100, false, false, false),
    bathmirror = CreateObject(GetHashKey("V_16_mid_bath_mesh_mirror"), spawn.x+3.57740800, spawn.y+3.25032000, spawn.z+1.48871300, false, false, false),
    beerbot = CreateObject(GetHashKey("Prop_CS_Beer_Bot_01"), spawn.x+1.73134600, spawn.y-4.88520200, spawn.z+1.91083000, false, false, false),
    couch = CreateObject(GetHashKey("v_res_mp_sofa"), spawn.x-1.48765600, spawn.y+1.68100600, spawn.z+1.33640500, false, false, false),
    chair = CreateObject(GetHashKey("v_res_mp_stripchair"), spawn.x-4.44770800, spawn.y-1.78048800, spawn.z+1.21640500, false, false, false),
    chair2 = CreateObject(GetHashKey("v_res_tre_chair"), spawn.x+2.91325400, spawn.y-5.27835100, spawn.z+1.22746400, false, false, false),
    plant = CreateObject(GetHashKey("Prop_Plant_Int_04a"), spawn.x+2.78941300, spawn.y-4.39133900, spawn.z+2.12746400, false, false, false),
    lamp = CreateObject(GetHashKey("v_res_d_lampa"), spawn.x-3.61473100, spawn.y-6.61465100, spawn.z+2.09373700, false, false, false),
    fridge = CreateObject(GetHashKey("v_res_fridgemodsml"), spawn.x+1.90339700, spawn.y-3.80026800, spawn.z+1.29917900, false, false, false),
    micro = CreateObject(GetHashKey("prop_micro_01"), spawn.x+2.03442400, spawn.y-4.64585100, spawn.z+2.28995600, false, false, false),
    sideBoard = CreateObject(GetHashKey("V_Res_Tre_SideBoard"), spawn.x+2.84053000, spawn.y-4.30947100, spawn.z+1.24577300, false, false, false),
    bedSide = CreateObject(GetHashKey("V_Res_Tre_BedSideTable"), spawn.x-3.50363200, spawn.y-6.55289400, spawn.z+1.30625800, false, false, false),
    lamp2 = CreateObject(GetHashKey("v_res_d_lampa"), spawn.x+2.69674700, spawn.y-3.83123500, spawn.z+2.09373700, false, false, false),
    plant2 = CreateObject(GetHashKey("v_res_tre_tree"), spawn.x-4.96064800, spawn.y-6.09898500, spawn.z+1.31631400, false, false, false),
    table = CreateObject(GetHashKey("V_Res_M_DineTble_replace"), spawn.x-3.50712600, spawn.y-4.13621600, spawn.z+1.29625800, false, false, false),
    tv = CreateObject(GetHashKey("Prop_TV_Flat_01"), spawn.x-5.53120400, spawn.y+0.76299670, spawn.z+2.17236000, false, false, false),
    plant3 = CreateObject(GetHashKey("v_res_tre_plant"), spawn.x-5.14112800, spawn.y-2.78951000, spawn.z+1.25950800, false, false, false),
    chair3 = CreateObject(GetHashKey("v_res_m_dinechair"), spawn.x-3.04652400, spawn.y-4.95971200, spawn.z+1.19625800, false, false, false),
    lampStand = CreateObject(GetHashKey("v_res_m_lampstand"), spawn.x+1.26588400, spawn.y+3.68883900, spawn.z+1.35556700, false, false, false),
    stool = CreateObject(GetHashKey("V_Res_M_Stool_REPLACED"), spawn.x-3.23216300, spawn.y+2.06159000, spawn.z+1.20556700, false, false, false),
    chair4 = CreateObject(GetHashKey("v_res_m_dinechair"), spawn.x-2.82237200, spawn.y-3.59831300, spawn.z+1.25950800, false, false, false),
    chair5 = CreateObject(GetHashKey("v_res_m_dinechair"), spawn.x-4.14955100, spawn.y-4.71316600, spawn.z+1.19625800, false, false, false),
    chair6 = CreateObject(GetHashKey("v_res_m_dinechair"), spawn.x-3.80622900, spawn.y-3.37648300, spawn.z+1.19625800, false, false, false),
    plant4 = CreateObject(GetHashKey("v_res_fa_plant01"), spawn.x+2.97859200, spawn.y+2.55307400, spawn.z+1.85796300, false, false, false),
    storage = CreateObject(GetHashKey("v_res_tre_storageunit"), spawn.x+8.47819500, spawn.y-2.50979300, spawn.z+1.19712300, false, false, false),
    storage2 = CreateObject(GetHashKey("v_res_tre_storagebox"), spawn.x+9.75982700, spawn.y-1.35874100, spawn.z+1.29625800, false, false, false),
    basketmess = CreateObject(GetHashKey("v_res_tre_basketmess"), spawn.x+8.70730600, spawn.y-2.55503600, spawn.z+1.94059590, false, false, false),
    lampStand2 = CreateObject(GetHashKey("v_res_m_lampstand"), spawn.x+9.54306000, spawn.y-2.50427700, spawn.z+1.30556700, false, false, false),
    plant4 = CreateObject(GetHashKey("Prop_Plant_Int_03a"), spawn.x+9.87521400, spawn.y+3.90917400, spawn.z+1.20829700, false, false, false),
    basket = CreateObject(GetHashKey("v_res_tre_washbasket"), spawn.x+9.39091500, spawn.y+4.49676300, spawn.z+1.19625800, false, false, false),
    wardrobe = CreateObject(GetHashKey("V_Res_Tre_Wardrobe"), spawn.x+8.46626300, spawn.y+4.53223600, spawn.z+1.19425800, false, false, false),
    basket2 = CreateObject(GetHashKey("v_res_tre_flatbasket"), spawn.x+8.51593000, spawn.y+4.55647300, spawn.z+3.46737300, false, false, false),
    basket3 = CreateObject(GetHashKey("v_res_tre_basketmess"), spawn.x+7.57797200, spawn.y+4.55198800, spawn.z+3.46737300, false, false, false),
    basket4 = CreateObject(GetHashKey("v_res_tre_flatbasket"), spawn.x+7.12286400, spawn.y+4.54689200, spawn.z+3.46737300, false, false, false),
    wardrobe2 = CreateObject(GetHashKey("V_Res_Tre_Wardrobe"), spawn.x+7.24382000, spawn.y+4.53423500, spawn.z+1.19625800, false, false, false),
    basket5 = CreateObject(GetHashKey("v_res_tre_flatbasket"), spawn.x+8.03364600, spawn.y+4.54835500, spawn.z+3.46737300, false, false, false),
    switch = CreateObject(GetHashKey("v_serv_switch_2"), spawn.x+6.28086900, spawn.y-0.68169880, spawn.z+2.30326000, false, false, false),
    table2 = CreateObject(GetHashKey("V_Res_Tre_BedSideTable"), spawn.x+5.84416200, spawn.y+2.57377400, spawn.z+1.22089100, false, false, false),
    lamp3 = CreateObject(GetHashKey("v_res_d_lampa"), spawn.x+5.84912100, spawn.y+2.58001100, spawn.z+1.95311890, false, false, false),
    ashtray = CreateObject(GetHashKey("Prop_ashtray_01"), spawn.x-1.24716200, spawn.y+1.07820500, spawn.z+1.87089300, false, false, false),
    candle1 = CreateObject(GetHashKey("v_res_fa_candle03"), spawn.x-2.89289900, spawn.y-4.35329700, spawn.z+2.02881310, false, false, false),
    candle2 = CreateObject(GetHashKey("v_res_fa_candle02"), spawn.x-3.99865700, spawn.y-4.06048500, spawn.z+2.02530190, false, false, false),
    candle3 = CreateObject(GetHashKey("v_res_fa_candle01"), spawn.x-3.37733400, spawn.y-3.66639800, spawn.z+2.02526200, false, false, false),
    woodbowl = CreateObject(GetHashKey("v_res_m_woodbowl"), spawn.x-3.50787400, spawn.y-4.11983000, spawn.z+2.02589900, false, false, false),
    tablod = CreateObject(GetHashKey("V_Res_TabloidsA"), spawn.x-0.80513000, spawn.y+0.51389600, spawn.z+1.18418800, false, false, false),
    tapeplayer = CreateObject(GetHashKey("Prop_Tapeplayer_01"), spawn.x-1.26010100, spawn.y-3.62966400, spawn.z+2.37883200, false, false, false),
    woodbowl2 = CreateObject(GetHashKey("v_res_tre_fruitbowl"), spawn.x+2.77764900, spawn.y-4.138297000, spawn.z+2.10340100, false, false, false),
    sculpt = CreateObject(GetHashKey("v_res_sculpt_dec"), spawn.x+3.03932200, spawn.y+1.62726400, spawn.z+3.58363900, false, false, false),
    jewlry = CreateObject(GetHashKey("v_res_jewelbox"), spawn.x+3.04164100, spawn.y+0.31671810, spawn.z+3.58363900, false, false, false),
    basket6 = CreateObject(GetHashKey("v_res_tre_basketmess"), spawn.x-1.64906300, spawn.y+1.62675900, spawn.z+1.39038500, false, false, false),
    basket7 = CreateObject(GetHashKey("v_res_tre_flatbasket"), spawn.x-1.63938900, spawn.y+0.91133310, spawn.z+1.39038500, false, false, false),
    basket8 = CreateObject(GetHashKey("v_res_tre_flatbasket"), spawn.x-1.19923400, spawn.y+1.69598600, spawn.z+1.39038500, false, false, false),
    basket9 = CreateObject(GetHashKey("v_res_tre_basketmess"), spawn.x-1.18293800, spawn.y+0.91436380, spawn.z+1.39038500, false, false, false),
    bowl = CreateObject(GetHashKey("v_res_r_sugarbowl"), spawn.x-0.26029210, spawn.y-6.66716800, spawn.z+3.77324900, false, false, false),
    breadbin = CreateObject(GetHashKey("Prop_Breadbin_01"), spawn.x+2.09788500, spawn.y-6.57634000, spawn.z+2.24041900, false, false, false),
    knifeblock = CreateObject(GetHashKey("v_res_mknifeblock"), spawn.x+1.82084700, spawn.y-6.58438500, spawn.z+2.27399500, false, false, false),
    toaster = CreateObject(GetHashKey("prop_toaster_01"), spawn.x-1.05790700, spawn.y-6.59017400, spawn.z+2.26793200, false, false, false),
    wok = CreateObject(GetHashKey("prop_wok"), spawn.x+2.01728800, spawn.y-5.57091500, spawn.z+2.31793200, false, false, false),
    plant5 = CreateObject(GetHashKey("Prop_Plant_Int_03a"), spawn.x+2.55015600, spawn.y+4.60183900, spawn.z+1.20829700, false, false, false),
    tumbler = CreateObject(GetHashKey("p_tumbler_cs2_s"), spawn.x-0.90916440, spawn.y-4.24099100, spawn.z+2.24693200, false, false, false),
    wisky = CreateObject(GetHashKey("p_whiskey_bottle_s"), spawn.x-0.92809300, spawn.y-3.99099100, spawn.z+2.24693200, false, false, false),
    tissue = CreateObject(GetHashKey("v_res_tissues"), spawn.x+7.95889300, spawn.y-2.54847100, spawn.z+1.94013400, false, false, false),
    pants = CreateObject(GetHashKey("V_16_Ap_Mid_Pants4"), spawn.x+7.55366500, spawn.y-0.25457100, spawn.z+1.33009200, false, false, false),
    pants2 = CreateObject(GetHashKey("V_16_Ap_Mid_Pants5"), spawn.x+7.76753200, spawn.y+3.00476500, spawn.z+1.33052800, false, false, false),
    hairdryer = CreateObject(GetHashKey("v_club_vuhairdryer"), spawn.x+8.12616000, spawn.y-2.50562000, spawn.z+1.96009390, false, false, false),
  }

  print("Created the objects.")
  
  objects["shell"] = shell

  FreezeEntityPosition(objects.dt,true)
  FreezeEntityPosition(objects.mpmid01,true)
  FreezeEntityPosition(objects.mpmid09,true)
  FreezeEntityPosition(objects.mpmid07,true)
  FreezeEntityPosition(objects.mpmid03,true)
  FreezeEntityPosition(objects.midData,true)
  FreezeEntityPosition(objects.glow,true)
  FreezeEntityPosition(objects.curtins,true)
  FreezeEntityPosition(objects.mpmid13,true)
  FreezeEntityPosition(objects.mpcab,true)
  FreezeEntityPosition(objects.mpdecal,true)
  FreezeEntityPosition(objects.mpdelta,true)
  FreezeEntityPosition(objects.couch,true)
  FreezeEntityPosition(objects.chair,true)
  FreezeEntityPosition(objects.chair2,true)
  FreezeEntityPosition(objects.plant,true)
  FreezeEntityPosition(objects.lamp,true)
  FreezeEntityPosition(objects.fridge,true)
  FreezeEntityPosition(objects.micro,true)
  FreezeEntityPosition(objects.sideBoard,true)
  FreezeEntityPosition(objects.bedSide,true)
  FreezeEntityPosition(objects.plant2,true)
  FreezeEntityPosition(objects.table,true)
  FreezeEntityPosition(objects.tv,true)
  FreezeEntityPosition(objects.plant3,true)
  FreezeEntityPosition(objects.chair3,true)
  FreezeEntityPosition(objects.lampStand,true)
  FreezeEntityPosition(objects.chair4,true)
  FreezeEntityPosition(objects.chair5,true)
  FreezeEntityPosition(objects.chair6,true)
  FreezeEntityPosition(objects.plant4,true)
  FreezeEntityPosition(objects.storage2,true)
  FreezeEntityPosition(objects.basket,true)
  FreezeEntityPosition(objects.wardrobe,true)
  FreezeEntityPosition(objects.wardrobe2,true)
  FreezeEntityPosition(objects.table2,true)
  FreezeEntityPosition(objects.lamp3,true)
  FreezeEntityPosition(objects.beddelta,true)
  FreezeEntityPosition(objects.bed,true)
  FreezeEntityPosition(objects.beddecal,true)
  FreezeEntityPosition(objects.tapeplayer,true)
  FreezeEntityPosition(objects.basket7,true)
  FreezeEntityPosition(objects.basket6,true)
  FreezeEntityPosition(objects.basket8,true)
  FreezeEntityPosition(objects.basket9,true)

  print("We froze all the objects.")

  SetEntityHeading(objects.beerbot,GetEntityHeading(objects.beerbot)+90)
  SetEntityHeading(objects.couch,GetEntityHeading(objects.couch)-90)
  SetEntityHeading(objects.chair,GetEntityHeading(objects.chair)+getRotation(0.28045480))
  SetEntityHeading(objects.chair2,GetEntityHeading(objects.chair2)+getRotation(0.3276100))
  SetEntityHeading(objects.fridge,GetEntityHeading(objects.chair2)+160)
  SetEntityHeading(objects.micro,GetEntityHeading(objects.micro)-90)
  SetEntityHeading(objects.sideBoard,GetEntityHeading(objects.sideBoard)+90)
  SetEntityHeading(objects.bedSide,GetEntityHeading(objects.bedSide)+180)
  SetEntityHeading(objects.tv,GetEntityHeading(objects.tv)+90)
  SetEntityHeading(objects.plant3,GetEntityHeading(objects.plant3)+90)
  SetEntityHeading(objects.chair3,GetEntityHeading(objects.chair3)+200)
  SetEntityHeading(objects.chair4,GetEntityHeading(objects.chair3)+100)
  SetEntityHeading(objects.chair5,GetEntityHeading(objects.chair5)+135)
  SetEntityHeading(objects.chair6,GetEntityHeading(objects.chair6)+10)
  SetEntityHeading(objects.storage,GetEntityHeading(objects.storage)+180)
  SetEntityHeading(objects.storage2,GetEntityHeading(objects.storage2)-90)
  SetEntityHeading(objects.table2,GetEntityHeading(objects.table2)+90)
  SetEntityHeading(objects.tapeplayer,GetEntityHeading(objects.tapeplayer)+90)
  SetEntityHeading(objects.knifeblock,GetEntityHeading(objects.knifeblock)+180)

  print("We set the heading of all the objects.")
  
  if not isBackdoor then
    TeleportToInterior(spawn.x + 3.69693000, spawn.y - 15.400020100, spawn.z + 1.5, spawn.h)
  else
    TeleportToInterior(spawn.x + 0.88999176025391, spawn.y + 4.3798828125, spawn.z + 1.5, spawn.h)
  end

  print("We are here it seems.")
  cb({ objects = objects, POIOffsets = POIOffsets }) 
end

function CreateModernHotelFurnished(generator)
  local objects = {
    building  = CreateObject(GetHashKey('modernhotel2_shell'),generator.x - 0.7,generator.y-0.4,generator.z-1.42,false,false,false),
  }
  
  FreezeEntityPosition(objects.building,true)
  
  local POIOffsets = {}
  POIOffsets.exit = json.decode('{"z":-0.25,"y":3.70,"x":4.22,"h":2.2633972168}')
  POIOffsets.clothing = json.decode('{"z":-0.25,"y":-3.93,"x":2.28,"h":2.2633972168}')
  POIOffsets.stash = json.decode('{"z":-0.25,"y":3.08,"x":-5.04,"h":2.2633972168}')
  POIOffsets.bedstash = json.decode('{"z":-0.25,"y":-1.93,"x":-5.78,"h":2.2633972168}')

  return { objects, POIOffsets }
end