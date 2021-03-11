export ZSH_THEME_GIT_PROMPT_PREFIX="("
export ZSH_THEME_GIT_PROMPT_SUFFIX=")"
export ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
export ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[blue]%}●"
export ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
export ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
export ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
export PROMPT='%B%(?..[%?] )%b%n@%U%m%u$(gitprompt)> '
export RPROMPT='%~'

