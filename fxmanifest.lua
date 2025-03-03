-- NC PROTECT+
server_scripts { '@nc_PROTECT+/exports/sv.lua' }
client_scripts { '@nc_PROTECT+/exports/cl.lua' }

fx_version 'cerulean'
game 'gta5'

author '@ชิโป้#1279'
description '𝐃𝐢𝐬𝐜𝐨𝐫𝐝 : https://discord.gg/pfyjfVPvzC'
version '1.0'

client_scripts {
  "Setting.lua",
  "client/client.lua"
}

server_script {
  "Setting.lua",
  "Secure.lua",
  '@mysql-async/lib/MySQL.lua',
  "server/server.lua",
  "Webhook.lua"
}


ui_page('html/index.html')
files {
    'html/*.css',
    'html/*.html',
    'html/*.js',
    'html/img/*.png',
    'html/sounds/*.ogg',
    'html/sounds/*.mp3',
}