# Function to get Git branch and status
# Define the main prompt
PROMPT="%(?:%{$fg_bold[yellow]%}➜ :%{$fg_bold[magenta]%}➜ ) %{$fg_bold[red]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

# Define Git prompt components
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}git:(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
git_prompt_info() {
  local ref
  if ref=$(git symbolic-ref --short HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null); then
    if [[ -n $(git status --porcelain 2> /dev/null) ]]; then
      echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${ZSH_THEME_GIT_PROMPT_DIRTY}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    else
      echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    fi
  fi
}

