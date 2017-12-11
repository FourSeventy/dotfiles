#################### Aliases ###############################
alias ls='ls -G'        # Compact view, show colors
alias ll='ls -alh'
alias l='ls -a'
alias c='clear'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

alias h='history' # Shell History

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# IP addresses
alias localip="ipconfig getifaddr en0"

# pipe into this function to pretty print json
alias prettyjson='python -m json.tool'

################### Dev Settings #########################

#git
export GIT_EDITOR=vim


#source machine specific settings
if [ -f ./.bashrclocal ]; then
   source ./.bashrclocal 
fi


################## Sane Defaults ###########################

# Perform file tab completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=5000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"


##################### Colors ###############################


function __ {
  echo "$@"
}

function __make_ansi {
  next=$1; shift
  echo "\[\e[$(__$next $@)m\]"
}

function __make_echo {
  next=$1; shift
  echo "\033[$(__$next $@)m"
}


function __reset {
  next=$1; shift
  out="$(__$next $@)"
  echo "0${out:+;${out}}"
}

function __bold {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}1"
}

function __faint {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}2"
}

function __italic {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}3"
}

function __underline {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}4"
}

function __negative {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}7"
}

function __crossed {
  next=$1; shift
  out="$(__$next $@)"
  echo "${out:+${out};}8"
}


function __color_normal_fg {
  echo "3$1"
}

function __color_normal_bg {
  echo "4$1"
}

function __color_bright_fg {
  echo "9$1"
}

function __color_bright_bg {
  echo "10$1"
}


function __color_black   {
  echo "0"
}

function __color_red   {
  echo "1"
}

function __color_green   {
  echo "2"
}

function __color_yellow  {
  echo "3"
}

function __color_blue  {
  echo "4"
}

function __color_magenta {
  echo "5"
}

function __color_cyan  {
  echo "6"
}

function __color_white   {
  echo "7"
}

function __color_rgb {
  r=$1 && g=$2 && b=$3
  [[ r == g && g == b ]] && echo $(( $r / 11 + 232 )) && return # gray range above 232
  echo "8;5;$(( ($r * 36  + $b * 6 + $g) / 51 + 16 ))"
}

function __color {
  color=$1; shift
  case "$1" in
    fg|bg) side="$1"; shift ;;
    *) side=fg;;
  esac
  case "$1" in
    normal|bright) mode="$1"; shift;;
    *) mode=normal;;
  esac
  [[ $color == "rgb" ]] && rgb="$1 $2 $3"; shift 3

  next=$1; shift
  out="$(__$next $@)"
  echo "$(__color_${mode}_${side} $(__color_${color} $rgb))${out:+;${out}}"
}


function __black   {
  echo "$(__color black $@)"
}

function __red   {
  echo "$(__color red $@)"
}

function __green   {
  echo "$(__color green $@)"
}

function __yellow  {
  echo "$(__color yellow $@)"
}

function __blue  {
  echo "$(__color blue $@)"
}

function __magenta {
  echo "$(__color magenta $@)"
}

function __cyan  {
  echo "$(__color cyan $@)"
}

function __white   {
  echo "$(__color white $@)"
}

function __rgb {
  echo "$(__color rgb $@)"
}


function __color_parse {
  next=$1; shift
  echo "$(__$next $@)"
}

function color {
  echo "$(__color_parse make_ansi $@)"
}

function echo_color {
  echo "$(__color_parse make_echo $@)"
}


black="$(color reset black)"
red="$(color reset red)"
green="$(color reset green)"
yellow="$(color reset yellow)"
blue="$(color reset blue)"
purple="$(color reset magenta)"
cyan="$(color reset cyan)"
white="$(color reset white bold)"
orange="$(color reset red fg bright)"

bold_black="$(color black bold)"
bold_red="$(color red bold)"
bold_green="$(color green bold)"
bold_yellow="$(color yellow bold)"
bold_blue="$(color blue bold)"
bold_purple="$(color magenta bold)"
bold_cyan="$(color cyan bold)"
bold_white="$(color white bold)"
bold_orange="$(color red fg bright bold)"

underline_black="$(color black underline)"
underline_red="$(color red underline)"
underline_green="$(color green underline)"
underline_yellow="$(color yellow underline)"
underline_blue="$(color blue underline)"
underline_purple="$(color magenta underline)"
underline_cyan="$(color cyan underline)"
underline_white="$(color white underline)"
underline_orange="$(color red fg bright underline)"

background_black="$(color black bg)"
background_red="$(color red bg)"
background_green="$(color green bg)"
background_yellow="$(color yellow bg)"
background_blue="$(color blue bg)"
background_purple="$(color magenta bg)"
background_cyan="$(color cyan bg)"
background_white="$(color white bg bold)"
background_orange="$(color red bg bright)"

normal="$(color reset)"
reset_color="$(__make_ansi '' 39)"

# These colors are meant to be used with `echo -e`
echo_black="$(echo_color reset black)"
echo_red="$(echo_color reset red)"
echo_green="$(echo_color reset green)"
echo_yellow="$(echo_color reset yellow)"
echo_blue="$(echo_color reset blue)"
echo_purple="$(echo_color reset magenta)"
echo_cyan="$(echo_color reset cyan)"
echo_white="$(echo_color reset white bold)"
echo_orange="$(echo_color reset red fg bright)"

echo_bold_black="$(echo_color black bold)"
echo_bold_red="$(echo_color red bold)"
echo_bold_green="$(echo_color green bold)"
echo_bold_yellow="$(echo_color yellow bold)"
echo_bold_blue="$(echo_color blue bold)"
echo_bold_purple="$(echo_color magenta bold)"
echo_bold_cyan="$(echo_color cyan bold)"
echo_bold_white="$(echo_color white bold)"
echo_bold_orange="$(echo_color red fg bright bold)"

echo_underline_black="$(echo_color black underline)"
echo_underline_red="$(echo_color red underline)"
echo_underline_green="$(echo_color green underline)"
echo_underline_yellow="$(echo_color yellow underline)"
echo_underline_blue="$(echo_color blue underline)"
echo_underline_purple="$(echo_color magenta underline)"
echo_underline_cyan="$(echo_color cyan underline)"
echo_underline_white="$(echo_color white underline)"
echo_underline_orange="$(echo_color red fg bright underline)"

echo_background_black="$(echo_color black bg)"
echo_background_red="$(echo_color red bg)"
echo_background_green="$(echo_color green bg)"
echo_background_yellow="$(echo_color yellow bg)"
echo_background_blue="$(echo_color blue bg)"
echo_background_purple="$(echo_color magenta bg)"
echo_background_cyan="$(echo_color cyan bg)"
echo_background_white="$(echo_color white bg bold)"
echo_background_orange="$(echo_color red bg bright)"

echo_normal="$(echo_color reset)"
echo_reset_color="$(__make_echo '' 39)"


############################## BASE THEME ################################

SCM_CHECK=${SCM_CHECK:=true}

SCM_THEME_PROMPT_DIRTY=' ✗'
SCM_THEME_PROMPT_CLEAN=' ✓'
SCM_THEME_PROMPT_PREFIX=' |'
SCM_THEME_PROMPT_SUFFIX='|'
SCM_THEME_BRANCH_PREFIX=''
SCM_THEME_TAG_PREFIX='tag:'
SCM_THEME_DETACHED_PREFIX='detached:'
SCM_THEME_BRANCH_TRACK_PREFIX=' → '
SCM_THEME_BRANCH_GONE_PREFIX=' ⇢ '
SCM_THEME_CURRENT_USER_PREFFIX=' ☺︎ '
SCM_THEME_CURRENT_USER_SUFFIX=''

CLOCK_CHAR='☆'

SCM_GIT_SHOW_DETAILS=${SCM_GIT_SHOW_DETAILS:=true}
SCM_GIT_SHOW_REMOTE_INFO=${SCM_GIT_SHOW_REMOTE_INFO:=auto}
SCM_GIT_IGNORE_UNTRACKED=${SCM_GIT_IGNORE_UNTRACKED:=false}
SCM_GIT_SHOW_CURRENT_USER=${SCM_GIT_SHOW_CURRENT_USER:=false}

SCM_GIT='git'
SCM_GIT_CHAR='±'
SCM_GIT_DETACHED_CHAR='⌿'
SCM_GIT_AHEAD_CHAR="↑"
SCM_GIT_BEHIND_CHAR="↓"
SCM_GIT_UNTRACKED_CHAR="?:"
SCM_GIT_UNSTAGED_CHAR="U:"
SCM_GIT_STAGED_CHAR="S:"

SCM_HG='hg'
SCM_HG_CHAR='☿'

SCM_SVN='svn'
SCM_SVN_CHAR='⑆'

SCM_NONE='NONE'
SCM_NONE_CHAR='○'

RVM_THEME_PROMPT_PREFIX=' |'
RVM_THEME_PROMPT_SUFFIX='|'

VIRTUALENV_THEME_PROMPT_PREFIX=' |'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'

RBENV_THEME_PROMPT_PREFIX=' |'
RBENV_THEME_PROMPT_SUFFIX='|'

RBFU_THEME_PROMPT_PREFIX=' |'
RBFU_THEME_PROMPT_SUFFIX='|'

function scm {
  if [[ "$SCM_CHECK" = false ]]; then SCM=$SCM_NONE
  elif [[ -f .git/HEAD ]]; then SCM=$SCM_GIT
  elif which git &> /dev/null && [[ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]]; then SCM=$SCM_GIT
  elif [[ -d .hg ]]; then SCM=$SCM_HG
  elif which hg &> /dev/null && [[ -n "$(hg root 2> /dev/null)" ]]; then SCM=$SCM_HG
  elif [[ -d .svn ]]; then SCM=$SCM_SVN
  else SCM=$SCM_NONE
  fi
}

function scm_prompt_char {
  if [[ -z $SCM ]]; then scm; fi
  if [[ $SCM == $SCM_GIT ]]; then SCM_CHAR=$SCM_GIT_CHAR
  elif [[ $SCM == $SCM_HG ]]; then SCM_CHAR=$SCM_HG_CHAR
  elif [[ $SCM == $SCM_SVN ]]; then SCM_CHAR=$SCM_SVN_CHAR
  else SCM_CHAR=$SCM_NONE_CHAR
  fi
}

function scm_prompt_vars {
  scm
  scm_prompt_char
  SCM_DIRTY=0
  SCM_STATE=''
  [[ $SCM == $SCM_GIT ]] && git_prompt_vars && return
  [[ $SCM == $SCM_HG ]] && hg_prompt_vars && return
  [[ $SCM == $SCM_SVN ]] && svn_prompt_vars && return
}

function scm_prompt_info {
  scm
  scm_prompt_char
  SCM_DIRTY=0
  SCM_STATE=''
  [[ $SCM == $SCM_GIT ]] && git_prompt_info && return
  [[ $SCM == $SCM_HG ]] && hg_prompt_info && return
  [[ $SCM == $SCM_SVN ]] && svn_prompt_info && return
}

function git_status_summary {
  awk '
  BEGIN {
    untracked=0;
    unstaged=0;
    staged=0;
  }
  {
    if (!after_first && $0 ~ /^##.+/) {
      print $0
      seen_header = 1
    } else if ($0 ~ /^\?\? .+/) {
      untracked += 1
    } else {
      if ($0 ~ /^.[^ ] .+/) {
        unstaged += 1
      }
      if ($0 ~ /^[^ ]. .+/) {
        staged += 1
      }
    }
    after_first = 1
  }
  END {
    if (!seen_header) {
      print
    }
    print untracked "\t" unstaged "\t" staged
  }'
}

function git_prompt_vars {
  local details=''
  SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  if [[ "$(git config --get bash-it.hide-status)" != "1" ]]; then
    [[ "${SCM_GIT_IGNORE_UNTRACKED}" = "true" ]] && local git_status_flags='-uno'
    local status_lines=$((git status --porcelain ${git_status_flags} -b 2> /dev/null ||
                          git status --porcelain ${git_status_flags}    2> /dev/null) | git_status_summary)
    local status=$(awk 'NR==1' <<< "$status_lines")
    local counts=$(awk 'NR==2' <<< "$status_lines")
    IFS=$'\t' read untracked_count unstaged_count staged_count <<< "$counts"
    if [[ "${untracked_count}" -gt 0 || "${unstaged_count}" -gt 0 || "${staged_count}" -gt 0 ]]; then
      SCM_DIRTY=1
      if [[ "${SCM_GIT_SHOW_DETAILS}" = "true" ]]; then
        [[ "${staged_count}" -gt 0 ]] && details+=" ${SCM_GIT_STAGED_CHAR}${staged_count}" && SCM_DIRTY=3
        [[ "${unstaged_count}" -gt 0 ]] && details+=" ${SCM_GIT_UNSTAGED_CHAR}${unstaged_count}" && SCM_DIRTY=2
        [[ "${untracked_count}" -gt 0 ]] && details+=" ${SCM_GIT_UNTRACKED_CHAR}${untracked_count}" && SCM_DIRTY=1
      fi
      SCM_STATE=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    fi
  fi

  [[ "${SCM_GIT_SHOW_CURRENT_USER}" == "true" ]] && details+="$(git_user_info)"

  SCM_CHANGE=$(git rev-parse --short HEAD 2>/dev/null)

  local ref=$(git symbolic-ref -q HEAD 2> /dev/null)
  if [[ -n "$ref" ]]; then
    SCM_BRANCH=${SCM_THEME_BRANCH_PREFIX}${ref#refs/heads/}
    local tracking_info="$(grep "${SCM_BRANCH}\.\.\." <<< "${status}")"
    if [[ -n "${tracking_info}" ]]; then
      [[ "${tracking_info}" =~ .+\[gone\]$ ]] && local branch_gone="true"
      tracking_info=${tracking_info#\#\# ${SCM_BRANCH}...}
      tracking_info=${tracking_info% [*}
      local remote_name=${tracking_info%%/*}
      local remote_branch=${tracking_info#${remote_name}/}
      local remote_info=""
      local num_remotes=$(git remote | wc -l 2> /dev/null)
      [[ "${SCM_BRANCH}" = "${remote_branch}" ]] && local same_branch_name=true
      if ([[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "auto" ]] && [[ "${num_remotes}" -ge 2 ]]) ||
          [[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "true" ]]; then
        remote_info="${remote_name}"
        [[ "${same_branch_name}" != "true" ]] && remote_info+="/${remote_branch}"
      elif [[ ${same_branch_name} != "true" ]]; then
        remote_info="${remote_branch}"
      fi
      if [[ -n "${remote_info}" ]];then
        if [[ "${branch_gone}" = "true" ]]; then
          SCM_BRANCH+="${SCM_THEME_BRANCH_GONE_PREFIX}${remote_info}"
        else
          SCM_BRANCH+="${SCM_THEME_BRANCH_TRACK_PREFIX}${remote_info}"
        fi
      fi
    fi
    SCM_GIT_DETACHED="false"
  else
    local detached_prefix=""
    ref=$(git describe --tags --exact-match 2> /dev/null)
    if [[ -n "$ref" ]]; then
      detached_prefix=${SCM_THEME_TAG_PREFIX}
    else
      ref=$(git describe --contains --all HEAD 2> /dev/null)
      ref=${ref#remotes/}
      [[ -z "$ref" ]] && ref=${SCM_CHANGE}
      detached_prefix=${SCM_THEME_DETACHED_PREFIX}
    fi
    SCM_BRANCH=${detached_prefix}${ref}
    SCM_GIT_DETACHED="true"
  fi

  local ahead_re='.+ahead ([0-9]+).+'
  local behind_re='.+behind ([0-9]+).+'
  [[ "${status}" =~ ${ahead_re} ]] && SCM_BRANCH+=" ${SCM_GIT_AHEAD_CHAR}${BASH_REMATCH[1]}"
  [[ "${status}" =~ ${behind_re} ]] && SCM_BRANCH+=" ${SCM_GIT_BEHIND_CHAR}${BASH_REMATCH[1]}"

  local stash_count="$(git stash list 2> /dev/null | wc -l | tr -d ' ')"
  [[ "${stash_count}" -gt 0 ]] && SCM_BRANCH+=" {${stash_count}}"

  SCM_BRANCH+=${details}

  SCM_PREFIX=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  SCM_SUFFIX=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
}

function svn_prompt_vars {
  if [[ -n $(svn status 2> /dev/null) ]]; then
    SCM_DIRTY=1
    SCM_STATE=${SVN_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
  else
    SCM_DIRTY=0
    SCM_STATE=${SVN_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  fi
  SCM_PREFIX=${SVN_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  SCM_SUFFIX=${SVN_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
  SCM_BRANCH=$(svn info 2> /dev/null | awk -F/ '/^URL:/ { for (i=0; i<=NF; i++) { if ($i == "branches" || $i == "tags" ) { print $(i+1); break }; if ($i == "trunk") { print $i; break } } }') || return
  SCM_CHANGE=$(svn info 2> /dev/null | sed -ne 's#^Revision: ##p' )
}

# this functions returns absolute location of .hg directory if one exists
# It starts in the current directory and moves its way up until it hits /.
# If we get to / then no Mercurial repository was found.
# Example:
# - lets say we cd into ~/Projects/Foo/Bar
# - .hg is located in ~/Projects/Foo/.hg
# - get_hg_root starts at ~/Projects/Foo/Bar and sees that there is no .hg directory, so then it goes into ~/Projects/Foo
function get_hg_root {
    local CURRENT_DIR=$(pwd)

    while [ "$CURRENT_DIR" != "/" ]; do
        if [ -d "$CURRENT_DIR/.hg" ]; then
            echo "$CURRENT_DIR/.hg"
            return
        fi

        CURRENT_DIR=$(dirname $CURRENT_DIR)
    done
}

function hg_prompt_vars {
    if [[ -n $(hg status 2> /dev/null) ]]; then
      SCM_DIRTY=1
        SCM_STATE=${HG_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    else
      SCM_DIRTY=0
        SCM_STATE=${HG_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
    fi
    SCM_PREFIX=${HG_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
    SCM_SUFFIX=${HG_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}

    HG_ROOT=$(get_hg_root)

    if [ -f $HG_ROOT/branch ]; then
        # Mercurial holds it's current branch in .hg/branch file
        SCM_BRANCH=$(cat $HG_ROOT/branch)
    else
        SCM_BRANCH=$(hg summary 2> /dev/null | grep branch: | awk '{print $2}')
    fi

    if [ -f $HG_ROOT/dirstate ]; then
        # Mercurial holds various information about the working directory in .hg/dirstate file. More on http://mercurial.selenic.com/wiki/DirState
        SCM_CHANGE=$(hexdump -n 10 -e '1/1 "%02x"' $HG_ROOT/dirstate | cut -c-12)
    else
        SCM_CHANGE=$(hg summary 2> /dev/null | grep parent: | awk '{print $2}')
    fi
}

function rvm_version_prompt {
  if which rvm &> /dev/null; then
    rvm=$(rvm-prompt) || return
    if [ -n "$rvm" ]; then
      echo -e "$RVM_THEME_PROMPT_PREFIX$rvm$RVM_THEME_PROMPT_SUFFIX"
    fi
  fi
}

function rbenv_version_prompt {
  if which rbenv &> /dev/null; then
    rbenv=$(rbenv version-name) || return
    $(rbenv commands | grep -q gemset) && gemset=$(rbenv gemset active 2> /dev/null) && rbenv="$rbenv@${gemset%% *}"
    if [ $rbenv != "system" ]; then
      echo -e "$RBENV_THEME_PROMPT_PREFIX$rbenv$RBENV_THEME_PROMPT_SUFFIX"
    fi
  fi
}

function chruby_version_prompt {
  if declare -f -F chruby &> /dev/null; then
    if declare -f -F chruby_auto &> /dev/null; then
      chruby_auto
    fi

    ruby_version=$(ruby --version | awk '{print $1, $2;}') || return

    if [[ ! $(chruby | grep '*') ]]; then
      ruby_version="${ruby_version} (system)"
    fi
    echo -e "${CHRUBY_THEME_PROMPT_PREFIX}${ruby_version}${CHRUBY_THEME_PROMPT_SUFFIX}"
  fi
}

function ruby_version_prompt {
  echo -e "$(rbfu_version_prompt)$(rbenv_version_prompt)$(rvm_version_prompt)$(chruby_version_prompt)"
}

function git_user_info {
  # support two or more initials, set by 'git pair' plugin
  SCM_CURRENT_USER=$(git config user.initials | sed 's% %+%')
  # if `user.initials` weren't set, attempt to extract initials from `user.name`
  [[ -z "${SCM_CURRENT_USER}" ]] && SCM_CURRENT_USER=$(printf "%s" $(for word in $(git config user.name | tr 'A-Z' 'a-z'); do printf "%1.1s" $word; done))
  [[ -n "${SCM_CURRENT_USER}" ]] && printf "%s" "$SCM_THEME_CURRENT_USER_PREFFIX$SCM_CURRENT_USER$SCM_THEME_CURRENT_USER_SUFFIX"
}

# backwards-compatibility
function git_prompt_info {
  git_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_SUFFIX"
}

function svn_prompt_info {
  svn_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_SUFFIX"
}

function hg_prompt_info() {
  hg_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH:${SCM_CHANGE#*:}$SCM_STATE$SCM_SUFFIX"
}

function scm_char {
  scm_prompt_char
  echo -e "$SCM_CHAR"
}

function prompt_char {
    scm_char
}

function clock_char {
  DATE_STRING=$(date +"%Y-%m-%d %H:%M:%S")
  echo -e "${bold_cyan}$DATE_STRING ${red}$CLOCK_CHAR"
}



######################## THEME ##################################

SCM_THEME_PROMPT_PREFIX="|"
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${green}✓${normal}"
SCM_GIT_CHAR="${green}±${normal}"
SCM_SVN_CHAR="${bold_cyan}⑆${normal}"
SCM_HG_CHAR="${bold_red}☿${normal}"

scm_prompt() {
    CHAR=$(scm_char) 
    if [ $CHAR = $SCM_NONE_CHAR ] 
        then 
            return
        else 
            echo "[$(scm_char)$(scm_prompt_info)]"
    fi 
}

pure_prompt() {
    ps_host="${bold_blue}\h${normal}";
    ps_user="${green}\u${normal}";
    ps_user_mark="${green}→ ${normal}";
    ps_root="${red}\u${red}";
    ps_root_mark="${red}# ${normal}"
    ps_path="${yellow}\w${normal}";

    # make it work
    case $(id -u) in
        0) PS1="$ps_root@$ps_host$(scm_prompt):$ps_path\n$ps_root_mark"
            ;;
        *) PS1="$ps_user@$ps_host$(scm_prompt):$ps_path\n$ps_user_mark"
            ;;
    esac
}

PROMPT_COMMAND=pure_prompt;
