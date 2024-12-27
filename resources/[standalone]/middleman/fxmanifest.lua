fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'Item Exchange Script with Per-Item Rewards'
version '1.0.0'
lua54 'yes'
-- Dependencies
shared_scripts {
    '@ox_lib/init.lua', -- Required for notifications
    'config.lua'
}

-- Client and Server Scripts
client_scripts {
    'client/main.lua', -- Client-side logic
}

server_scripts {
    'server/main.lua', -- Server-side logic
}
