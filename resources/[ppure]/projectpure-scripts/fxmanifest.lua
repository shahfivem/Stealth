fx_version 'cerulean'
game 'gta5'
lua54 'yes'

-- Shared libraries
shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
}

-- Client scripts
client_scripts {
    '@qbx_core/modules/playerdata.lua',
    '*.lua'
}

-- Server scripts
server_scripts {
    'server/emsserver.lua',
    'server/photolightsserver.lua',
    'server/d.lua'
}
