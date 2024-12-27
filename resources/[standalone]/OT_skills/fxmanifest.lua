fx_version "cerulean"
author "stuxxy"
version '1.4.0'

lua54 'yes'

games {
  "gta5",
  "rdr3"
}

ui_page 'web/build/index.html'

shared_scripts {
  '@es_extended/imports.lua',
  '@ox_lib/init.lua',
  'shared/config.lua',
  'shared/util.lua'
}

server_script {
  '@oxmysql/lib/MySQL.lua',
  'server/open.lua',
  'server/main.lua'
}

client_script {
  'client/open.lua',
  'client/main.lua'
}

files {
  'web/build/index.html',
  'web/build/**/*'
}