function fish_prompt
    set -l retc red
    test $status = 0; and set retc green

    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream auto

    function _nim_prompt_wrapper
        set retc $argv[1]
        set -l field_name $argv[2]
        set -l field_value $argv[3]

        echo -n ' '
        set_color normal
        test -n $field_name
        and echo -n $field_name:
        set_color $retc
        echo -n $field_value
    end

    set_color $retc
    echo -n '┌─ '
    set_color -o green

    if functions -q fish_is_root_user; and fish_is_root_user
        set_color -o red
    else
        set_color -o yellow
    end

    echo -n ' '
    #echo -n $USER
    #set_color -o white

    if test -z "$SSH_CLIENT"
        set_color -o blue
    else
        set_color -o cyan
    end

    if test "$PWD" != "$HOME"
      set_color $retc
      echo -n '─ '
      set_color -o blue
      echo -n (prompt_pwd)
      set_color -o green
    end

    function fish_mode_prompt
    end

    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        set -l mode
        switch $fish_bind_mode
            case default
                set mode (set_color --bold red)N
            case insert
                set mode (set_color --bold green)I
            case replace_one
                set mode (set_color --bold green)R
                echo '[R]'
            case replace
                set mode (set_color --bold cyan)R
            case visual
                set mode (set_color --bold magenta)V
        end
        set mode $mode(set_color normal)
        _nim_prompt_wrapper $retc '' $mode
    end


    # Virtual Environment
    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and _nim_prompt_wrapper $retc V (basename "$VIRTUAL_ENV")

    # git
    set -l prompt_git (fish_git_prompt '%s')
    if test -n "$prompt_git"
      set_color $retc
      echo -n ' ─'
      _nim_prompt_wrapper green '' $prompt_git
    end

    # New line
    echo

    # Background jobs
    set_color normal

    for job in (jobs)
        set_color $retc
        echo -n '│ '
        set_color brown
        echo $job
    end

    set_color normal
    set_color $retc
    echo -n '└─❯'
    set_color -o red
    echo -n '$ '
    set_color normal
end
