
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name "advlaptop"
version "1"

shared_scripts {
	'@ox_lib/init.lua',
    'config.lua',
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}