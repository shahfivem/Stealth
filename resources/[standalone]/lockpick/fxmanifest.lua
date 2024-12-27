fx_version 'adamant'
game 'gta5'
lua54 'yes'
version '1.0.0'

client_script 'lockpicking_client.lua'

export "lockpick"
ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/img/*.png',
	'html/sounds/pinbreak.ogg',
	'html/sounds/lockUnlocked.ogg',
	'html/sounds/lockpick.ogg',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
}