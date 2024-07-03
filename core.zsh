#!/bin/zsh
DEBUG=0

plug () {
  local action=$1
  local action_params=$*[2,-1]

  _debug "Running action:" $action $action_params

  case "$action" in
    use) 
      _use $action_params
      ;;
    source)
      _source $action_params
      ;;
    *) 
      echo "TODO: error message"
      ;;
  esac
}


_info () {
  print $*
}

_debug () {
  if (($DEBUG)) {
    print "DEBUG:" $*
  }
}

_source () {
  local f="$ZDOTDIR/$1"
  [[ -f "$f" ]] && source "$f"
}


_use () {
  local module=${1:t}
  if [[ $module =~ ^(.*)-zsh-theme$ ]]; then
    module=${match[1]}
  fi
  _debug "Loading" $module
  if [[ -d "$ZDOTDIR/modules/$module" ]]; then
    _source "modules/$module/$module.plugin.zsh" \
      || _source "modules/$module/$module" \
      || _source "modules/$module/$module.zsh" \
      || _source "modules/$module/$module.zsh-theme" \
      || _source "modules/$module/install.zsh"
  else
    git clone "https://github.com/$1.git" "$ZDOTDIR/modules/$module" && _use $1
  fi
}


