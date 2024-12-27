fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author '@fobozo'
description 'Custom ShowCard Script made for @ERP'
version '1.0.0'

shared_scripts { 'shared/*.lua', '@ox_lib/init.lua' }
client_script 'src/client/*.lua'
server_script 'src/server/*.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/app.js',
    'html/images/*.png',
    'html/images/*.jpg',
    'html/images/*.svg',
    'html/images/*.gif'
}
