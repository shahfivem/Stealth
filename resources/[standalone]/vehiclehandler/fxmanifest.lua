fx_version  'cerulean'
game        'gta5'
lua54       'yes'

name        'vehiclehandler'
description 'Collision/damage handling for FiveM.'
author      'QuantumMalice'
version '1.3.3'

files {
    'data/progress.lua',
    'data/vehicle.lua',
    'modules/handler.lua'
}

shared_script '@ox_lib/init.lua'
client_script 'client.lua'
server_script 'server.lua'