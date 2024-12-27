fx_version "cerulean"

game "gta5"

author 'Project X'

description 'House Robbery by Project X'

version '1.0.9'

shared_scripts{
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    "config/*.lua",
    'locales/*.lua',
}

client_scripts{
    'opensource/client/client.lua',
    'encrypted/client/client_ipl.lua',
    'encrypted/client/client_shell.lua',
}

server_scripts{
    'opensource/server/server.lua',
    'encrypted/server/server_ipl.lua',
    'encrypted/server/server_shell.lua',
}

lua54 "yes"

escrow_ignore {
    'config/*.lua',
    'locales/*.lua',
    'opensource/client/client.lua',
    'opensource/server/server.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'