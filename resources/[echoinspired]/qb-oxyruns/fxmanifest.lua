fx_version 'cerulean'
game 'gta5'
lua54 'yes'

dependencies {
	'PolyZone'
}
shared_script 	'@ox_lib/init.lua'
shared_script 'shared/sh_config.lua'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
	'client/cl_main.lua'
}

server_script 'server/sv_main.lua'