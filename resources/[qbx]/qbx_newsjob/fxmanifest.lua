fx_version 'cerulean'
game 'gta5'

description 'QBX_NewsJob'
repository 'https://github.com/Qbox-project/qbx_newsjob'
version '1.0.1'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
    '@qbx_core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/main.lua',
    'client/camera.lua'
}

server_script {
    'server/main.lua'
}

files {
    'config/client.lua',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'