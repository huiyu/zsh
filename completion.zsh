# completions
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
autoload -Uz cominit
_comp_options+=(globdots)		# Include hidden files.

plug use "zsh-users/zsh-completions"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ''

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# z.lua
plug use skywind3000/z.lua

# fzf
local fzf_path=$(which fzf)
[[ ! -f $fzf_path ]] && echo "fzf not found!"
[[ -h $fzf_path ]] && fzf_path=$(readlink -f $fzf_path)
local shell_path=$(dirname $(dirname $fzf_path))/shell
[[ -f $shell_path/completion.zsh ]] && source $shell_path/completion.zsh
[[ -f $shell_path/key-bindings.zsh ]] && source $shell_path/key-bindings.zsh

# fzf-tab
plug use Aloxaf/fzf-tab

