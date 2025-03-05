shopt -s expand_aliases

parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' ; }
PS1='\[\033[1;31m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h \[\033[1;32m\]$PWD$(parse_git_branch):\n# \[\033[0m\]'

export CLICOLOR=1

alias ll='ls -lha --color'
alias grep='grep --color'

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# bash_completion
[[ -r "/etc/profile.d/bash_completion.sh" ]] && . "/etc/profile.d/bash_completion.sh"
[[ -r "${LOCAL_BIN}/etc/profile.d/bash_completion.sh" ]] && . "${LOCAL_BIN}/etc/profile.d/bash_completion.sh"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. <(asdf completion bash)

# ssh
eval $(ssh-agent -s)
grep -slR "PRIVATE" ~/.ssh | xargs ssh-add

# aws cli
complete -C 'aws_completer' aws

# kubectl
alias k=kubectl
complete -F __start_kubectl k

# direnv
eval "$(direnv hook bash)"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# history size
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "

ulimit -n 10240
uname -n -r -m

. "$HOME/.bash_aliases"
