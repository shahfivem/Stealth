fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Samuel#0008 & ZF Labo'
description 'Advanced Beekeeping System for QBCore and ESX'
Version '1.1.6'

client_script 'client/*.lua'

server_scripts { '@oxmysql/lib/MySQL.lua', 'server/*.lua' }

shared_scripts { '@sd_lib/init.lua', '@ox_lib/init.lua', 'config.lua' }

files { 'locales/*.json' }

escrow_ignore { '**/*.lua', 'config.lua', }
dependency '/assetpacks'