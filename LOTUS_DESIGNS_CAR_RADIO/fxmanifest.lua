fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

description 'https://discord.gg/RMD3dvazUG'
author 'Jaelix'
version '1.0.0'

server_scripts { 'server/*.lua' }

client_scripts { 'client/*.lua' }

ui_page 'html/index.html'
files { 
  "html/*",
}

dependencies {
	'xsound',
}
