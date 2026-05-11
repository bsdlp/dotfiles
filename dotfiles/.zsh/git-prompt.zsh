_dotfiles_git_prompt() {
    emulate -L zsh

    command git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

    local branch
    branch="$(command git symbolic-ref --quiet --short HEAD 2>/dev/null)" \
        || branch="$(command git rev-parse --short HEAD 2>/dev/null)" \
        || return
    branch="${branch//\%/%%}"

    local state=""
    if ! command git diff --quiet --ignore-submodules -- 2>/dev/null; then
        state="${state}*"
    fi
    if ! command git diff --cached --quiet --ignore-submodules -- 2>/dev/null; then
        state="${state}+"
    fi
    if [[ -n "$(command git ls-files --others --exclude-standard 2>/dev/null)" ]]; then
        state="${state}?"
    fi

    if [[ -n "$state" ]]; then
        print -nr -- " %F{magenta}${branch}%f%F{yellow}:${state}%f"
    else
        print -nr -- " %F{magenta}${branch}%f"
    fi
}
