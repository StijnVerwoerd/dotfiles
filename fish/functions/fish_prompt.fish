function fish_prompt
    set -l reset (set_color normal)

    set user_bg_color "ffaa00"
    set host_bg_color "f4852f"
    set dir_bg_color "343656"


    # Segment 1: user
    set -l color1 (set_color -b $user_bg_color $dir_bg_color)
    set -l arrow1 (set_color -b $host_bg_color $user_bg_color)
    set -l arrow4 (set_color -b $user_bg_color $user_bg_color)
    set -l segment1 "$arrow4$color1"(whoami) "$arrow1$reset"

    # Segment 2: host
    set -l color2 (set_color -b $host_bg_color $dir_bg_color)
    set -l arrow2 (set_color -b $dir_bg_color $host_bg_color)
    set -l segment2 "$color2" (hostname|cut -d . -f 1)" $arrow2$reset"

    # Segment 3: current dir
    set -l color3 (set_color -b $dir_bg_color 22BBFF)
    set -l arrow3 (set_color -b black $dir_bg_color)
    set -l segment3 "$color3 "(prompt_pwd)" $arrow3$reset"

    echo -n "$segment1$segment2$segment3 "
end

