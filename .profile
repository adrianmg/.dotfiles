# PATH SETUP
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH" # RVM
export PATH="/usr/local/go/bin:$PATH" # Go
export PATH="/opt/homebrew/bin:$PATH" # Homebrew (Apple Silicon)
export PATH="/Applications/Ghostty.app/Contents/MacOS:$PATH" # Ghostty
export PATH="$HOME/.fnm:$PATH" # fnm (Node version manager)
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/sbin:$PATH"

# FNM (Fast Node Manager) environment
eval "$(fnm env)"

# bun.sh
BUN_INSTALL="/Users/adrianmg/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# RUN APPS
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias calc='bc -l'
#alias gh='/Applications/gh'


# FOLDERS
alias projects="cd $HOME/Projects"
alias lab="cd $HOME/Projects/lab"
alias findextension=findextension
function findextension {
  find . -name "*.$1" -type f $2
}
alias finder="open -a Finder ./"
# colored folders
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto' ||

# WEB SIMPLE SERVER
alias webserver="python -m SimpleHTTPServer 8000"

# GIT
alias g="git"
alias gs="git status"
alias gcm="git commit --message"
alias gd="git diff"
alias gp="git push"

git config --global user.email "adrianmg@github.com"
git config --global user.name "Adrian Mato"
git config --global github.user "adrianmg"

# LOOK ON BASH HISTORY
eval "$(mcfly init bash)"

# PROMPT CUSTOMIZATION
# git: get current branch in repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo " ♜ ${BRANCH}${STAT}"
  else
    echo ""
  fi
}
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}
# PROMPT: colors
export PS1="\[\e[36m\]\W\[\e[93m\]\`parse_git_branch\` \[\033[39m\]➜ "

# Love2D Editor
#alias love="/Applications/love.app/Contents/MacOS/love"

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# get rid of zsh warning on kick-off
export BASH_SILENCE_DEPRECATION_WARNING=1
