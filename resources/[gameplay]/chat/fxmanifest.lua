fx_version 'adamant'
game 'gta5'
lua54 'yes'

ui_page 'html/index.html'

files {
  'html/index.html',
  --'html/css/index.css',
  'html/js/config.default.js',
  --'html/js/config.js',
  'html/js/App.js',
  'html/js/Message.js',
  'html/js/Suggestions.js',
  'html/vendor/vue.2.3.3.min.js',
  'html/vendor/flexboxgrid.6.3.1.min.css',
  'html/vendor/animate.3.5.2.min.css',
  'html/vendor/latofonts.css',
  'html/vendor/fonts/LatoRegular.woff2',
  'html/vendor/fonts/LatoRegular2.woff2',
  'html/vendor/fonts/LatoLight2.woff2',
  'html/vendor/fonts/LatoLight.woff2',
  'html/vendor/fonts/LatoBold.woff2',
  'html/vendor/fonts/LatoBold2.woff2',
  'html/css/style.css',
}

shared_script '@ox_lib/init.lua'

client_scripts {
  'client/cl_chat.lua',
}

server_scripts {
  'server/utils.lua',
  'server/commands.lua',
  'server/sv_chat.lua',
  'server/main.lua',
}