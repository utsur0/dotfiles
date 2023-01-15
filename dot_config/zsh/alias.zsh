#################################
#                               #
#                               #
#           ALIAS FILE          #
#                               #
#                               #
#################################
#1] General
alias vi='nvim'
alias vim='nvim'
alias rl='source ~/.zshrc'
alias less='less -R'

#2] LS Aliases (Depends on: Exa)
alias ls='exa'
alias l='exa -l --all --group-directories-first --git'
alias ll='exa -l --all --all --group-directories-first --git'
alias lt='exa -T --git-ignore --level=2 --group-directories-first'
alias llt='exa -lT --git-ignore --level=2 --group-directories-first'
alias lT='exa -T --git-ignore --level=4 --group-directories-first'

#####################
#                   #
#    OS Specific    #
#                   #
#####################

# USAGE: Comment/uncomment as necessary/to avoid errors.
#        Doing this and using one file is easier with chezmoi. 

# DEBIAN / UBUNTU 
# (commands requiring sudo should be followed using `sudo !!`)
# APT Aliases
#    #[-] Install
#        alias apti='apt install'
#        alias install='apt install'
#    #[-] Removal
#        alias aptrm='apt remove'
#        alias uninst='apt remove'
#        alias rmpkg='apt remove'
#        alias purge='apt purge'
#    #[-] Search
#        alias remove='apt remove'
#        alias findpkg='apt search'
    

    #[-] Custom Program Aliases

# MacOS 
# iOS Aliases (TODO: idevice commands!)
#   #[-] Jailbreak Related 
#       alias chra1n='/Applications/iOS/checkra1n.app/Contents/MacOS/checkra1n'
#
# Password Manager Aliases (BWSSH)#from this repo: https://github.com/joaojacome/bitwarden-ssh-agent
#   #[-] KeePass Aliases
#        alias kp='open /Applications/KeePassXC.app'
#        alias kpc='keepassxc-cli'
#   #[-] Bitwarden Aliases (bw-cli needed!)
#        alias bwssh='SSH_ASKPASS_REQUIRE=force python3 ~/.local/bin/bwssh.py'
#
# Homebrew 
#        alias ibrew="arch -x86_64 /usr/local/bin/brew"
#        alias brew="/opt/homebrew/bin/brew"
#
# Packwiz Aliases (Minecraft Modpack Creator Tool)
#        alias pw='packwiz'
#        alias rmd='packwiz remove'
#        alias exmd='packwiz cf export'
