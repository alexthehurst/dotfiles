export PATH=$PATH:~/scripts:~/python/bin:/Library/PostgreSQL/9.3/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="$PATH:/usr/local/Cellar/mtr/0.86/sbin"
export PATH="/usr/local/sbin:$PATH"

source ~/.dotfiles/.bash_profile_portable
source ~/.dotfiles/.bash_profile_python

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
export PATH=$PATH:/Users/alexhurst/Hurst/scripts/tick


# MAC

alias t='tick.sh'
alias tt='ticktick.sh'

alias pastick='tick `pbpaste`'
alias tab="csvfix ascii_table"
alias d="~/code/Diary.py/diary.py"
alias ahcalc="~/code/ahcalc/ahcalc/ahcalc.py"
alias check="cd ~/Hurst/code/Hurst/website_checker/website_checker;python3 website_checker.py;cd -"
alias st='open -a Sublime\ Text'
alias copy="pbcopy < "
