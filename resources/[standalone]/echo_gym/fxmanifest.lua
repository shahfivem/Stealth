fx_version 'cerulean'
game 'gta5'

client_script 'client.lua'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
shared_scripts {
    '@ox_lib/init.lua',
    'shared.lua',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
