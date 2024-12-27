fx_version 'cerulean'
game "gta5"
lua54 'yes'

author 'SkeletonNetworks'
version '1.0.0'

ui_page 'web/build/index.html'
--ui_page 'http://localhost:3000/'

files {
    'web/build/**',
    'web/assets/**',
    'web/assets/**/**'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua',
    'config.lua'
}

client_scripts {
    'client/framework/*.lua',
    'client/framework/garages/*.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/framework/*.lua',
    'server/framework/garages/*.lua',
    'server/*.lua'
}

dependencies {
    'ox_lib',
    'bob74_ipl', -- only needed if using ipls
    'sn_tablet',
    'screenshot-basic'
}

escrow_ignore {
    'config.lua',
    'shared/*.lua',
    'server/framework/*.lua',
    'server/framework/garages/*.lua',
    'client/framework/*.lua',
    'client/framework/garages/*.lua',
}
dependency '/assetpacks'