# bring in some aliases
if [ -f $HOME/.aliasrc ]; then
    source $HOME/.aliasrc
fi

# set up git completion, if available
# see https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi

if [ -d /usr/local/bin ]; then
    export PATH=/usr/local/bin:$PATH
fi

if [ -d $HOME/Library/Python/3.6/bin ]; then
    export PATH=$HOME/Library/Python/3.6/bin:$PATH
fi

# some java-related setup 
export COMMON_OPTS="-Xms1024m -Xmx4096m -XX:PermSize=1024m"
export MAVEN_OPTS=$COMMON_OPTS
export GRADLE_OPTS=$COMMON_OPTS
eval jdk8

# display the branch name if it's available
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
