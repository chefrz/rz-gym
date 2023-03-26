
fx_version 'cerulean'
game 'gta5'

ui_page 'ui/main.html'

files {
    'ui/main.html',
    'ui/css/*.css',
    'ui/js/*.js',
}

server_scripts {
    'server/main.lua',
    'config.lua'
}

client_scripts {
    'client/functions.lua',
    'config.lua',
}

exports {
    "SkillMenu",
    "UpdateSkill",
    "GetCurrentSkill",
    "UpdateSkillRemove"
}