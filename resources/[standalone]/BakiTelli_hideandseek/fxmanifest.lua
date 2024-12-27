fx_version 'cerulean'

game 'gta5'

ui_page 'html/ui.html'

client_scripts {
	'shared/config.lua',
	'client.lua',
	'shared/client.lua',
}

server_scripts {
	'shared/config.lua',
	'server.lua',
	'shared/server.lua',
}

files {
	'html/ui.html',
	'html/*.css',
	'html/*.js',
	'html/img/*.png',
	'html/img/*.svg',
	'html/font/*.ttf',
}
lua54 'yes'

escrow_ignore {
	'shared/*.lua'
}
