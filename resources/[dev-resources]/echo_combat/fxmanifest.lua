game 'common'
fx_version 'cerulean'

lua54 'yes'

author 'Flawws'
description 'Combat Script for EchoRP'
version '1.0.0'

ui_page 'html/index.html'

files {
  'html/**'
}

shared_scripts {
    '@ox_lib/init.lua',
	'shared/*.lua'
}

client_scripts {
    '@qbx_core/modules/playerinit.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}