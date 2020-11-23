# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"

## Use fzf for filename completion via `vim **<tab>`
complete -o default -F _fzf_path_completion -o bashdefault vim
export FZF_DEFAULT_COMMAND='
  (find . -path "*/\.*" -prune -o -type f -print -o -type l -print ! -path */.git |
      sed s/^..//) 3> /dev/null'
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}' --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort,ctrl-o:execute(vim {})+abort'"
## Do the same when we're using ctrl-t
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"

# Use bat with syntax and wrapping when we use CTRL-R to browse history
export FZF_CTRL_R_OPTS="--preview \"echo {} | cut -d\' \' -f 3- | bat --wrap character --color=always -l sh \" --preview-window wrap"
