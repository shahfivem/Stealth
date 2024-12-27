
Config = {}

Config.Coords = vector3(-152.3512, -37.9303, 54.3961) -- Insert Arena Coords
Config.Distance = 5 -- Acces Menu Distance
Config.apikey = "5B8001BCC98FE6279F2541CB25926E28" --  https://steamcommunity.com/dev/apikey
Config.Namep = "Stealth" -- LobbyName Prefix
Config.NameNumber = 4 -- How many characters
Config.drawtextorfloating = "floating" -- drawtext or floating 
Config.OxInventory = true -- ox inventory using = true
Config.BlackTime = 20 -- the caller will be blindfolded for how many seconds
Config.Weapon = {
	Name = "weapon_musket", -- Weapon Name
	Ammo = 20, -- Ammo Count
}
Config.GameFinishRevive = true -- finish game characters revive ?
Config.DevMode = false -- If true, the hash id of the object you have transformed will be notified to you via F8, if you wish, you can set it to blacklist via config.

Config.Maps = {
	{
		MapName = "Above the Roofs",
		information = "How about being a little off the ground? Many fun moments await you on the rooftops with its fun large area.",
		Area = vector3(-162.8536, -202.2048, 82.7025),
		Distance = 195,
		map_img = "./img/map1.png",
		red =  {
			[1] = vector4(-144.0510, -112.8375, 92.7024, 162.6926),
			[2] = vector4(-140.2230, -113.0178, 92.7024, 163.7247),
			[3] = vector4(-137.8646, -113.9138, 92.7024, 162.3982),
			[4] = vector4(-135.9010, -114.5698, 92.7024, 154.9198),
			[5] = vector4(-133.4471, -115.9336, 92.7024, 152.8878),
		},
		blue = {
			[1] = vector4(-214.4986, -375.0380, 65.0497, 339.9521),
			[2] = vector4(-217.3938, -373.8465, 65.0497, 338.3839),
			[3] = vector4(-221.2654, -372.2809, 65.0497, 7.7501),
			[4] = vector4(-225.1874, -371.1859, 65.0497, 347.5505),
			[5] = vector4(-229.0925, -370.3087, 65.0497, 346.4017),
		}
	},
	{
		MapName = "Abandoned Hospital",
		information = "An interesting experience! Be prepared to have fun with the hospital's terrible weather.",
		Area = vector3(239.0195, -1379.5881, 38.5344),
		Distance = 45,
		map_img = "./img/map2.png",
		red =  {
			[1] = vector4(239.0195, -1379.5881, 38.5344, 315.9783),
			[2] = vector4(240.6588, -1380.9246, 38.5344, 319.9131),
			[3] = vector4(243.3769, -1378.0336, 38.5344, 139.9014),
			[4] = vector4(242.4135, -1377.1851, 38.5344, 140.5002),
			[5] = vector4(241.4959, -1376.3384, 38.5344, 136.6043),
		},
		blue = {
			[1] = vector4(254.4363, -1359.1565, 28.6494, 156.1743),
			[2] = vector4(255.4323, -1359.8145, 28.6494, 146.0312),
			[3] = vector4(256.6952, -1360.8401, 28.6494, 137.2132),
			[4] = vector4(254.7101, -1361.8452, 28.6494, 134.8236),
			[5] = vector4(253.7290, -1361.1575, 28.6494, 130.0426),
		}
	},
	{
		MapName = "Yatch Ship",
		information = "A lot of fun in a huge ship on the water.",
		Area = vector3(-1466.3849, 6769.4775, 7.0181),
		Distance = 111,
		map_img = "./img/map3.png",
		red =  {
			[1] = vector4(-1466.3849, 6769.4775, 7.0181, 251.6684),
			[2] = vector4(-1467.0276, 6767.9033, 7.0223, 243.2463),
			[3] = vector4(-1467.7123, 6766.6172, 7.0309, 247.3777),
			[4] = vector4(-1469.2025, 6768.2290, 7.0976, 252.2155),
			[5] = vector4(-1468.8796, 6769.4336, 7.1002, 250.1479),
		},
		blue = {
			[1] = vector4(-1422.7372, 6755.5220, 7.9715, 80.8801),
			[2] = vector4(-1423.3071, 6753.9712, 7.9715, 77.4634),
			[3] = vector4(-1423.7021, 6751.8950, 7.9715, 77.9983),
			[4] = vector4(-1424.9685, 6752.8760, 7.9715, 58.8805),
			[5] = vector4(-1424.1968, 6754.9297, 7.9715, 63.6881),
		}
	},
}

Config.Blips = {
	Blip = true,
	Name = "Hide And Seek",
	sprite = 491,
	color = 4,
	scale = 1.0,
}

Config.Langs = {
	OpenMenu = "[E] - Open Menu",
	password = "incorrect password."
}
Config.BlackListObjects = { -- List of objects that will not be transformed You can install the Prop Name script to learn the code of the object, or you can open dev mode via config and then check f8 to learn the code of the object you transformed.
	"-1559154913",
	"2010966735",
	"1374371923",
	"993353915",
	"-1721110035",
	"-17667531344",
	"-15591554913",
	"-169864321",
	"1760672481",
	"-619864321",
	"1319392426",
	"-53484673",
	"-1117396024",
	"270388964",
	"-822947892",
	"-1585219143",
	"321871119",
	"-845118873",
	"1984157061",
	"-194424366",
	"-1095443412",
	"291642981",
	"-2025086469",
	"996113921",
	"1217034051",
	"-1650862906",
	"2067114511",
	"-951553860",
	"1946809594",
	"-1320760438",
	"-1847044452",
	"-439830743",
	"-717890986",
	"-1664982460",
	"1487401018",
	"1729911864",
	"1181350742",
	"-1610165324",
	"-875057463",
	"716584927",
	"-770740285",
	"1653893025",
	"1964400974",
	"-320848029",
	"14722111",
	"-283574096",
	"580361003",
	"1415151278",
	"-984671127",
	"19644000974",
	"984424205",
	"1579586191",
	"-6939641",
	"232771564",
	"-286280212",
	"2120038965",
	"1173660835",
	"712268108",
	"2268389500",
	"1536155685",
	"-331509782",
	"-1183731840",
	"374758529",
	"-253978396",
	"2607106",
	"-1432298883",
	"-954257764",
	"323771564",
	"927372848",
	"2003032008",
	"2003032008",
	"1318384423",
	"1652015642", -- musket hash
}