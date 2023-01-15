#################################
#                               #
#                               #
#         FUNCTION FILE         #
#                               #
#                               #
#################################

# TODO: Fix init to download zsh_unplugged directly to $ZCFG
#function init(){
#  # Check if ZSH Config Directory Created. Setup Envars 
#  # Using zsh_unplugged as simple plugin script.
#  if [[ ! -d $ZCFG ]]; then
#    mkdir $ZCFG
#    if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
#      git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
#      source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh
#    fi
#  fi
#}

#############################################################
#                   zcfg - ZSH EDIT FUNC                    #
#############################################################
# Simple function to quickly edit ZSH Settings.
function zcfg (){
    __usage="
    Usage: zcfg [r] [OPTIONS]

    Mode Flags:
      {NONE}    Operates on current ZSH cofiguration
      r         Operates on Remote Chezmoi Managed ZSH configuration. 

    Arguments:
      -h,       Display Usage Information

      {NONE}    Opens Main .zshrc
      -a,       Opens Aliases
      -e,       Opens Enviorment Variables
      -f,       Opens Functions
      -p,       Opens Paths
      -s,       Opens External Scripts
    "
    # Dirty Mode Switch
    _opener="$EDITOR"
    _arg="$1"
    if [[ "$1" == 'r' ]]; then
        _opener="chezmoi edit"
        _arg="$2"
    fi

    case $_arg in

        "-a")
            eval $_opener $ZCFG/alias.zsh
            ;;

        "-e")
            eval $_opener $ZCFG/envs.zsh
            ;;

        "-f")
            eval $_opener $ZCFG/func.zsh
            ;;

        "-p")
            eval $_opener $ZCFG/paths.zsh
            ;;

        "-s")
            eval $_opener $ZCFG/src.zsh
            ;;

        "-h" | "--help")
            echo "$__usage" 
            ;;

        *)
            eval $_opener $HOME/.zshrc
            ;;
    esac
}


#############################################################
# PLUGIN MANAGER (or lack theirof)                          #
# zsh_unplugged: https://github.com/mattmc3/zsh_unplugged   #
# a simple, ultra-fast plugin handler                       #
#############################################################
function plugin-load {
  local repo plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZCFG:-$HOME/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      local -a initfiles=($plugdir/*.plugin.{z,}sh(N) $plugdir/*.{z,}sh{-theme,}(N))
      (( $#initfiles )) || { echo >&2 "No init file found '$repo'." && continue }
      ln -sf "${initfiles[1]}" "$initfile"
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

function plugin-update {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

###### ADVANCED COMMANDS ######
#Simple plugin-clone function, you must source plugins yourself!
function plugin-clone {
  local repo plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZCFG:-$HOME/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      local -a initfiles=($plugdir/*.plugin.{z,}sh(N) $plugdir/*.{z,}sh{-theme,}(N))
      (( $#initfiles )) && ln -sf "${initfiles[1]}" "$initfile"
    fi
  done
}

# Use to source as separate process.
function plugin-source {
  local plugdir
  ZPLUGINDIR=${ZPLUGINDIR:-${$ZCFG:-$HOME/.config/zsh}/plugins}
  for plugdir in $@; do
    [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
    fpath+=$plugdir
    local initfile=$plugdir/${plugdir:t}.plugin.zsh
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}
#############################################################


#1] General

# Cheat Function. 
# Shows common uses of almost any command. 
# While theres a Rust program for this...I find cheat.sh to
# be more reliable in finding results. 
function cht (){
	curl  cheat.sh/"$1"
}

# LFCD (Dependent on: lf) 
# Change directory when exiting LF
# LF is a file browser for terminal.
# Just use it. Trust me.
function lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '' 'lfcd\n'


#2] MISC.

# Command Not Found
# If command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi


#3] Custom Programs 

# MacOS
# Colorized TCPDump. Require nasty perl and usage of its dumb modules.
# Requires "ip" command – Not found on MacOS by default.
# TODO: USE https://github.com/jhunt/tcptrace which doesnt need perl modules.
#function tcpd(){
#    if [ $# -ne 1 ]; then
#        echo "Usage: tcpd <port>"
#    else
#        sudo tcpdump -ln port $1 | ~/.local/share/bin/tcpd-color.pl
#    fi
#}

# MacOS
# PUPFlare - 
# A headless Chrome browser allowing commands like CURL to query
# the full DOM with loaded Javascript. Good for CloudFlare bypass, etc.
# NOTE: PUPFlare Installed in: ~/.local/share/pupflare
# NOTE: FIXED FOR MacOS COMPATABILITY! Commands may need adjusted.
#function pf (){
#	pid=$(lsof -iTCP -sTCP:LISTEN -n -P | grep ":3000" | awk '{print $2}')
#	if [[ $1 == "-k" ]]; then
#		kill -9 "$pid"
#	elif [[ $pid == "" ]]; then 
#		echo "[@] API Handlder Not Started!"
#		echo "[!] Starting API Handlder..."
#		pushd $PWD > /dev/null 2>1&
#		cd ~/.local/share/pupflare/
#		npm start &
#		sleep 5
#		popd > /dev/null 2>1&
#		echo "[@] Use http://localhost:3000/?url= to send requests!" 
#	else
#		echo "[@] API Handlder Already Started!"
#		echo "[@] Use http://localhost:3000/?url= to send requests!" 
#	fi 
#}
