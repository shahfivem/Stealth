fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
shared_script '@ox_lib/init.lua'


client_scripts  {
    '@qbx_core/modules/playerdata.lua',
    'client.lua',
}

server_script 'server.lua'