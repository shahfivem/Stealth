fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author '@linkdevelopment'
description 'A resource made for custom processing system in qbox.'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
    'shared/*.lua'
}

server_scripts {
    'src/server/*.lua',
}

client_scripts {
    'src/client/*.lua'
}