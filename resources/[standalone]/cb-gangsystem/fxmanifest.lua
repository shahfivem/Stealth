fx_version 'cerulean'
game 'gta5'

author 'Cool Brad Scripts'
version '1.0.4'
description 'An advanced Gang System script for FiveM RP servers'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/framework/framework.lua',
    'config/config.lua',
    'config/banneditems.lua',
    'config/badwords.lua',
    'config/blackmarket.lua',
    'config/drugselling.lua',
    'config/gangcolors.lua',
    'config/ganghints.lua',
    'config/gangzones.lua',
    'config/gifts.lua',
    'config/hideouts.lua',
    'config/missions.lua',
    'config/recipes.lua',
    'shared/functions.lua',
    'locales/en.lua' -- CHANGE THIS TO YOUR LANGUAGE
}

client_scripts {
    '@qbx_core/modules/playerdata.lua', -- For QBOX users
    'client/framework/framework.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/framework/framework.lua',
    'server/*.lua'
}

/* Open Source 
escrow_ignore {
    'shared/*.lua',
    'client/*.lua',
    'server/*.lua',
    'locales/*.lua',
    'config/*.lua',
    'client/framework/*.lua',
    'server/framework/*.lua',
    'shared/framework/*.lua',
}
*/

/* Escrow 
escrow_ignore {
    'client/framework/*.lua',
    'server/framework/*.lua',
    'shared/framework/*.lua',
    'client/target.lua',
    'client/teleport.lua',
    'client/menus.lua',
    'client/input.lua',
    'locales/*.lua',
    'config/*.lua'
}
*/

ui_page { 'nui/nui.html' }

files {
    'nui/nui.html',
    'nui/css/style.css',
    'nui/js/script.js',
    'nui/img/*',
    'logos/*',
}

lua54 'yes'