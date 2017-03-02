PROMPT_COMMAND="update_prompt_parts;"

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM='xterm-256color';
fi;

if tput setaf 1 &> /dev/null; then
    tput sgr0; # reset colors
    bold=$(tput bold);
    reset=$(tput sgr0);
    # Solarized colors, taken from http://git.io/solarized-colors.
    black=$(tput setaf 0);
    blue=$(tput setaf 33);
    cyan=$(tput setaf 37);
    green=$(tput setaf 64);
    orange=$(tput setaf 166);
    purple=$(tput setaf 125);
    red=$(tput setaf 124);
    violet=$(tput setaf 61);
    white=$(tput setaf 15);
    yellow=$(tput setaf 136);
else
    bold='';
    reset="\e[0m";
    black="\e[1;30m";
    blue="\e[1;34m";
    cyan="\e[1;36m";
    green="\e[1;32m";
    orange="\e[1;33m";
    purple="\e[1;35m";
    red="\e[1;31m";
    violet="\e[1;35m";
    white="\e[1;37m";
    yellow="\e[1;33m";
fi;

update_git_prompt_parts() {
    local s='';
    local branchName='';
    local branchColor=$1;
    local statusColor=$2;
    local wipColor=$3;

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then
        status='';

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git branch | grep \* | cut --delimiter=' ' --fields=2- || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";

        # If the current repository is in WIP state, display a badge to that effect
        WIP="$(git log -n 1 | grep -q -c "\-\-wip\-\-" && echo 'WIP' || echo '')";

        # Vagrant is too slow to do a bunch of Git operations for every PS1
        if [ "$USER" == 'vagrant' ]; then
            status='***'
        # check if the current directory is in .git before running git checks
        elif [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null;

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                status+='+';
            fi;

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                status+='!';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                status+='?';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                status+='$';
            fi;

        fi;

        PS1_BRANCH=$branchName;
        PS1_STATUS=$status
        PS1_WIP=$WIP
    else
        PS1_BRANCH='';
        PS1_STATUS='';
        PS1_WIP='';
        return;
    fi;
}

last_pwd_parts() {
    python -c "import sys;
home, pwd, count = sys.argv[1], ' '.join(sys.argv[2:-1]), int(sys.argv[-1]);
prefix_slug = '..';
dirs = pwd.replace(home, '~').split('/');
prefix = prefix_slug if (len(dirs) > count) else '';
print prefix + '/'.join(d for d in dirs[-count:])" $HOME $PWD $1
}

update_prompt_parts() {
    
    # set PS1_BRANCH, PS1_STATUS, and PS1_WIP
    update_git_prompt_parts;

    # Format branch if it exists
    [ -n "${PS1_BRANCH}" ] && PS1_BRANCH="(${PS1_BRANCH})";

    # Format status if it exists
    [ -n "${PS1_STATUS}" ] && PS1_STATUS=" [${PS1_STATUS}]";

    # Format wip if it exists
    [ -n "${PS1_WIP}" ] && PS1_WIP=" [${PS1_WIP}]";

    # Format workon if it exists
    [ -n "${VIRTUAL_ENV}" ] && PS1_WORKON=`basename $VIRTUAL_ENV`;
    [ -n "${PS1_WORKON}" ] && PS1_WORKON="(${PS1_WORKON})";

    PS1_PWD="$(last_pwd_parts $pathSegments)";
    PS1_USER=$USER;
    PS1_HOST=$(echo $HOSTNAME | cut -d '.' -f 1);

    # Update this line if the format changes.
    PS1_MOCK=$PS1_WORKON-$USER-$PS1_HOST----$PS1_PWD-$PS1_BRANCH$PS1_STATUS$PS1_WIP;

    # The magic. If the assembled prompt is projected to be wider than the window,
    # insert a linebreak.
    [ ${#PS1_MOCK} -lt $(tput cols) ] && PS1_JOIN=' ' || PS1_JOIN='\n';

    [ -n "${PS1_WORKON}" ] && printf $baseStyle$PS1_WORKON' ';
    printf $userStyle$PS1_USER;
    printf $baseStyle@;
    printf $hostStyle$PS1_HOST;
    printf $baseStyle' in ';
    printf $pwdStyle"$PS1_PWD";
    printf "${PS1_JOIN}";
    printf $branchStyle"${PS1_BRANCH}";
    printf $statusStyle"${PS1_STATUS}";
    printf $wipStyle"${PS1_WIP}";
    printf "\n";

    PS1="\[${baseStyle}\]\$ \[${reset}\]"; # `$` (and reset color)
    export PS1;

}

### STYLES

userStyle="${blue}";
hostStyle="${cyan}";
wipStyle="${yellow}";
branchStyle="${violet}";
statusStyle="${blue}";
pwdStyle="${green}";

baseStyle="${white}"
pathSegments=4;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
    userStyle="${red}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
    hostStyle="${bold}${red}";
fi;

### TEMPLATE
# Delimiters and actual template pattern will also have to be updated
# in update_prompt_parts() if changes are made

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
