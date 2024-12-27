fx_version 'cerulean'
game "gta5"
lua54 'yes'

author 'SkeletonNetworks'
version '1.2.0'

ui_page 'build/index.html'
--ui_page 'http://localhost:3000'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/framework/*.lua',
    'server/*.lua',
}

client_scripts {
    'client/framework/*.lua',
    'client/*.lua',
}

escrow_ignore {
    'config.lua',
    'server/framework/*.lua',
    'client/framework/*.lua',
}

files {
    'build/**',
}
dependency '/assetpacks'