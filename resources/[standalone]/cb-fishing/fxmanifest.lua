fx_version 'cerulean'
game 'gta5'

description 'cb-fishing'
version '1.0.1'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts {
    '@qbx_core/modules/playerdata.lua', -- For QBOX users
    'client/framework.lua',
    'client/client.lua',
}

server_scripts {
    'server/framework.lua',
    'server/server.lua'
}

/* Open Source 
escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    'locales/*.lua',
    'config.lua',
}
*/

/* Escrow 
escrow_ignore {
    'client/framework.lua',
    'server/framework.lua',
    'locales/*.lua',
    'config.lua',
}
*/

lua54 'yes'