fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
client_script "@prp-base/components/cl_error.lua"
client_script "@prp-pwnzor/client/check.lua"

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'config.lua',
    'client/client.lua',
    'client/lib.lua',
    'client/modules/*.lua',
    --'demo_games.lua',
}

server_scripts {
    'config.lua',
    'server/*.lua',
}

data_file "SCALEFORM_DLC_FILE" "stream/minimap/int3232302352.gfx"

files {
    "stream/minimap/int3232302352.gfx"
}

ui_page 'ui/dist/index.html'
files { "ui/dist/index.html", 'ui/dist/**/*.*' }

escrow_ignore {
    "server/**/*.lua",
    "config.lua",
}
dependency '/assetpacks'