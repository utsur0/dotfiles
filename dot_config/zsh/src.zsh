#################################
#                               #
#                               #
#         SOURCING FILE         #
#     for external scripts      #
#                               #
#                               #
#################################


#####################
#                   #
#    OS Specific    #
#                   #
#####################

# DietPi (Raspberry Pi Debian) 
    #[-] SOURCE COMMAND FIX. Include scripts to be executed here!
        #for i in /etc/bashrc.d/*.sh /etc/bashrc.d/*.bash; do [ -r "$i" ] && . $i; done; unset -v i

# MacOS 
#    #[-] FZF (TODO: Install on all machines. Move to general §)
#        [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#        bindkey '^[^[[D' backward-word
#        bindkey '^[^[[C' forward-word
#
#    #[-]  PyEnv Init (TODO: Install on all machines. Move to general §)
#        if command -v pyenv 1>/dev/null 2>&1; then
#          eval "$(pyenv init -)"
#        fi
#
#    #[-] BunJS (NodeJS Replacement. Needs install. Needed?)
#       export BUN_INSTALL="/Users/winter/.bun"
#       export PATH="$PATH:$BUN_INSTALL/bin"
#       # BunJS Completions
#       [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"