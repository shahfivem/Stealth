this_is_a_map 'yes'
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]
--
name 'fd_radio_v2'
version      '1.8.7'
repository 'https://https://github.com/FelisDevelopment/fd_radio_v2'
description 'Felis Development Radio v2'

data_file 'DLC_ITYP_REQUEST' 'stream/prop_radio.ytyp'

--[[ Manifest ]]
--
dependencies {
    '/server:5104',
    '/onesync',
    'pma-voice',
    'ox_lib'
}

files {
    'web/dist/index.html',
    'web/dist/**/*',
}

ui_page 'web/dist/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locale.lua',
    'modules/**/shared.lua',
}

client_scripts {
    'modules/**/client.lua',
    'modules/**/client/*.lua'
}

server_scripts {
    'modules/**/server.lua',
    'modules/**/server/*.lua'
}

escrow_ignore {
    "config.lua",
    "locale.lua",
    "modules/bridge/**",
    "modules/callback/**",
    "data/**",
    "optional/**",
    "modules/jammer/client/pickup_init.lua"
}

dependency '/assetpacks'