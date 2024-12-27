fx_version 'cerulean'
game 'gta5'

name "Brazzers Fake Plates"
author "Brazzers Development | MannyOnBrazzers#6826"
version "1.0"

lua54 'yes'

client_scripts {
    'client/*.lua',
    '@ox_lib/init.lua',
}

server_scripts {
    '@ox_lib/init.lua',
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua',
    
}

shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/*.lua',
	'shared/*.lua',
}