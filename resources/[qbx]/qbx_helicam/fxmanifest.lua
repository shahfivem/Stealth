fx_version 'cerulean'
game 'gta5'

name 'qbx_helicam'
description 'Helicopter camera resource for Qbox'
repository 'https://github.com/Qbox-project/qbx_helicam'
version '1.0.0'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua'
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/main.lua'
}

server_script 'server/main.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/main.css',
    'config/client.lua',
    'locales/*.json'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'