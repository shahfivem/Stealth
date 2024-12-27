fx_version 'cerulean'
game 'gta5'

Author 'Samuel#0008'
Description 'A library of functions, that also bridges frameworks and common 3rd party resources.'
Version '1.1.2'

client_scripts {
    'resource/client/client.lua',
}

server_scripts {
    'resource/server/server.lua',
}

files {
    'init.lua',
    'modules/**/shared.lua',
    'modules/**/client.lua',
    'modules/**/server.lua',
}

shared_scripts {
    -- '@ox_lib/init.lua',
    'resource/init.lua',
} 

lua54 'yes'
