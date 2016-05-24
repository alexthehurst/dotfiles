export PATH=$PATH:~/scripts:~/python/bin:/Library/PostgreSQL/9.3/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="$PATH:/usr/local/Cellar/mtr/0.86/sbin"
export PATH="/usr/local/sbin:$PATH"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

export PATH=$PATH:/Users/alexhurst/Hurst/scripts/tick

# Source all the profile components. Anything starting with .bash_profile_
# Presumes that dotfiles/deploy.sh has been run since adding any profiile components.
for f in ~/.bash_profile_*; do source $f; done;
