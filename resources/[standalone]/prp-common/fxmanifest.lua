fx_version "cerulean"
game "gta5"

name "prp-common"
description "Core resource for any common utility functions"
author "ProductionRP Dev Team"

-- LOGS CLIENT/SERVER ERRORS
client_script "@prp-ghosteye/client/cl_errorlog.lua"
server_script "@prp-ghosteye/server/sv_errorlog.lua"

shared_scripts {
    "shared/sh_*.lua",
}

client_scripts {
    -- POLYZONE
    "@PolyZone/client.lua",
    "@PolyZone/BoxZone.lua",
    "@PolyZone/EntityZone.lua",
    "@PolyZone/CircleZone.lua",
    "@PolyZone/ComboZone.lua",

    -- MAIN
    "**/cl_*.lua"
}

server_scripts {
    "**/sv_*.lua",
}

ui_page "html/index.html"

files {
    "html/main.js",
    "html/main.css",
    "html/index.html"
}
