#################################
#                               #
#                               #
#          ENVARS FILE          #
#                               #
#                               #
#################################
#1] General 
    export ZPLUGINDIR="${ZPLUGINDIR:-$ZCFG/plugins}"
    export LANG=en_US.UTF-8

# Starship ZSH Prompt
    export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Git more info
    export GITSTATUS_LOG_LEVEL=DEBUG

#2] Custom Programs

#3] Misc.

#####################
#                   #
#    OS Specific    #
#                   #
#####################
#
# Linux (Universal)
#    #[-] Editor
#        export EDITOR='/snap/bin/nvim'

# MacOS
#    #[-] Editor
#        export EDITOR='/opt/homebrew/bin/nvim'
#
#    #[-] NODE TRUST STORE OS Location
#        export NODE_OPTIONS="--use-openssl-ca"
#        export NODE_EXTRA_CA_CERTS="/Users/winter/Documents/Records/Certificates/RootCA/MCP-CA(Root).crt"
#
#    #[-] PKG CONFIG
#        #export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
#        export PKG_CONFIG_PATH="$HOMEBREW_CELLAR/openssl@3/3.0.2/lib/pkgconfig/:$PKG_CONFIG_PATH"
#        export PKG_CONFIG_PATH="$HOMEBREW_CELLAR/python@3.9/3.9.10/lib/pkgconfig/:$PKG_CONFIG_PATH"
#        export PKG_CONFIG_PATH="$HOMEBREW_CELLAR/openssl@1.1/1.1.1n/lib/pkgconfig/:$PKG_CONFIG_PATH"
#        #export PKG_CONFIG_PATH="$HOMEBREW_CELLAR/libplist/2.2.0/lib/pkgconfig/:$PKG_CONFIG_PATH"
#        export PKG_CONFIG_PATH="$HOMEBREW_CELLAR/libxml2/2.9.13/lib/pkgconfig/:$PKG_CONFIG_PATH"
#        #export PKG_CONFIG_PATH="/usr/local/opt/python@3.7/lib/pkgconfig:$PKG_CONFIG_PATH"
