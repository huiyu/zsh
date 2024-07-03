# Colors
autoload -Uz colors && colors

plug use "zsh-users/zsh-syntax-highlighting"
plug use "apjanke/agnosterj-zsh-theme"
export AGNOSTER_PROMPT_SEGMENTS=(status git dir k8s aws azure gcp)

# FIXME: Something wrong with p10k and z.lua, 
#   1. z.lua fzf compatibility problem: see https://github.com/skywind3000/z.lua/issues/186#issuecomment-1726664918
#   2. p10k broken in intellij idea: see https://github.com/romkatv/powerlevel10k/issues/2682
#     using $IDEA_INITIAL_DIRECTORY to detect if in idea 

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
