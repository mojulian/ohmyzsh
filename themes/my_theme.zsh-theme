# meh. Dark Blood Rewind, a new beginning.

current_time() {
    echo "🕑 %{$fg_bold[blue]%}%D{[%H:%M:%S]}%{$reset_color%}"
}

right_triangle() {
   echo $'\ue0b0'
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

ok_username() {
   ARROW_FG="016"
   ARROW_BG="015"
   NEXT_ARROW_BG="183"
   NEXT_ARROW_FG="015"
   echo "$(arrow_start) %n $(arrow_end)"
}

err_username() {
   ARROW_FG="016"
   ARROW_BG="160"
   NEXT_ARROW_BG="183"
   NEXT_ARROW_FG="160"
   echo "$(arrow_start) %n $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "%(?.$(ok_username).$(err_username))"
}
directory() {
   ARROW_FG="016"
   ARROW_BG="183"
   NEXT_ARROW_BG="139"
   NEXT_ARROW_FG="183"
   echo "$(arrow_start) %2~ $(arrow_end)"
}
git_prompt() {
   ARROW_FG="016"
   ARROW_BG="139"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="096"
   echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}
where_am_I() {
   echo "👁 👉🏼: %{$reset_color%}%{$fg[white]%}[%~]"
}
who_am_I() {
   echo "🚀 $fg_bold[white]%}[/dev/%y]%{$reset_color%}"
}
correct_or_not() {
    echo "%(?.👌🏼.🤬)"
}
# %{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%H:%M:%S]} %{$reset_color%} $fg[red]%}[%{$fg_bold[white]%}/dev/%y%{$reset_color%}%{$fg[red]%}] %{$(git_prompt_info)%}%(?,,%{$fg[red]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[red]%}])\
PROMPT=$'$(username)$(directory)$(git_prompt)
$(where_am_I) - $(who_am_I) \
🤔 %{$fg_bold[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '
RPROMPT='$(git_prompt_status) $(current_time) $(correct_or_not)'

# set the git_prompt_info text
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
# ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✏️ %{$fg[green]%}"
# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="✏️"
ZSH_THEME_GIT_PROMPT_CLEAN="✨"

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"
