fx_version 'cerulean'
game 'gta5'

name "cb-businesses"
description "An all-in-one business script for FiveM"
author "Cool Brad Scripts"
version "1.0.0"

lua54 'yes'
use_experimental_fxv2_oal 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua',
	'shared/recipes/*.lua',
	'shared/jobs/*.lua',
	'locales/en.lua'
}

client_scripts {
	'@qbx_core/modules/playerdata.lua', -- For QBOX users
	'client/*.lua',
	'@PolyZone/client.lua', 
	'@PolyZone/BoxZone.lua', 
	'@PolyZone/EntityZone.lua', 
	'@PolyZone/CircleZone.lua', 
	'@PolyZone/ComboZone.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}