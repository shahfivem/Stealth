fx_version 'adamant'
game 'gta5'
lua54 'yes'

shared_script '@ox_lib/init.lua'
shared_script '**/sh_*.lua'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'cl_*.lua',
	'**/cl_*.lua'
}

server_script '**/sv_tow.lua'