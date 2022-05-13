# completions
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
autoload -Uz cominit
_comp_options+=(globdots)		# Include hidden files.

plug use "zsh-users/zsh-completions"

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

