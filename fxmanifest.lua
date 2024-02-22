fx_version 'cerulean'
game 'gta5'
author 'Cyrix'
description 'C-CharacterKill'
version '1.0.0'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    'config.lua'
}

lua54 'yes'