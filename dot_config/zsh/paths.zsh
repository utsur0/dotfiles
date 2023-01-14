#################################
#                               #
#                               #
#           PATHS FILE          #
#                               #
#                               #
#################################
#
#1] General

# Just in case it is not default
    export PATH=/usr/local/bin:$PATH

#2] Custom Programs

#3] Misc.

#####################
#                   #
#    OS Specific    #
#                   #
#####################

# Snap (Universal Linux Appstore for Snap App Packages).
#    export PATH=/snap/bin:$PATH

# MacOS 
# Note: MacOS has a path helper daemon script.
#       found in /etc/paths and /etc/paths.d/
#
#    #[-] Default macOS PATH (in case you disable above)
#        #export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
#
#    #[-] I store Full CLI Application here. 
#        export PATH="/Applications/CLI:$PATH"
#
#    #[-] Heres ya damn conventional location. 
#        export PATH="/Users/winter/.local/bin:$PATH"
#        
#    #[-] Homebrew PATH (Apple Silicon) 
#        export PATH="/opt/homebrew/bin/:$PATH"
#        
#    #[-] libimobiledevice & proper libxml2 (manual install loc.) 
#        export PATH="$PATH:/usr/local/opt/libimobiledevice/bin"
#        export PATH="$PATH:/usr/local/opt/libxml2/bin"
#
#    #[-] Overrides.
#        #export PATH="/opt/homebrew/opt/curl/bin:$PATH"
#        #export PATH="/usr/local/opt/python@3.7/bin:$PATH"
#        #export PATH="/opt/homebrew/lib/python3.10/site-packages:$PATH"
#    
#    #[-] Misc. 
