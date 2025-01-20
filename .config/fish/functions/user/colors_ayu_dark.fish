set -g BACKGROUND    "0a0e14"
set -g FOREGROUND    "b3b1ad"

set -g BLACK         "01060e"
set -g RED           "ea6c73"
set -g GREEN         "91b362"
set -g ORANGE        "f9af4f"
set -g BLUE          "53bdfa"
set -g YELLOW        "fae994"
set -g TEAL          "90e1c6"
set -g WHITE         "c7c7c7"
set -g MAGENTA       "d2a6ff"

set -g MEDIUM_BLACK  "444444"

set -g BRIGHT_BLACK  "686868"
set -g BRIGHT_RED    "f07178"
set -g BRIGHT_GREEN  "c2d94c"
set -g BRIGHT_ORANGE "ffb454"
set -g BRIGHT_BLUE   "59c2ff"
set -g BRIGHT_YELLOW "ffee99"
set -g BRIGHT_TEAL   "95e6cb"
set -g BRIGHT_WHITE  "ffffff"

function colors_ayu_dark --description "Apply the Ayu dark colorscheme"
    # Default color
    set -U fish_color_normal normal
    # Commands like echo
    set -U fish_color_command $BLUE
    # Keywords like if - this falls back on the command color if unset
    set -U fish_color_keyword $ORANGE
    # Quoted text like "abc"
    set -U fish_color_quote $GREEN
    # IO redirections like >/dev/null
    set -U fish_color_redirection YELLOW
    # Process separators like ; and &
    set -U fish_color_end $ORANGE
    # Syntax errors
    set -U fish_color_error $RED
    # Ordinary command parameters
    set -U fish_color_param normal
    # Parameters that are filenames (if the file exists)
    set -U fish_color_valid_path $BRIGHT_WHITE
    # Options starting with “-”, up to the first “--” parameter
    set -U fish_color_option $TEAL
    # Comments like ‘# important’
    set -U fish_color_comment $BRIGHT_BLACK
    # Selected text in vi visual mode
    set -U fish_color_selection --background=$WHITE $BLACK
    # Parameter expansion operators like * and ~
    set -U fish_color_operator $MAGENTA
    # Character escapes like \n and \x70
    set -U fish_color_escape $YELLOW
    # Autosuggestions (the proposed rest of a command)
    set -U fish_color_autosuggestion $BRIGHT_BLACK
    # The current working directory in the default prompt
    set -U fish_color_cwd $BLUE
    # The current working directory in the default prompt for the root user
    set -U fish_color_cwd_root $BRIGHT_RED
    # The username in the default prompt
    set -U fish_color_user normal
    # The hostname in the default prompt
    set -U fish_color_host normal
    # The hostname in the default prompt for remote sessions (like ssh)
    set -U fish_color_host_remote $BRIGHT_WHITE
    # The last command’s nonzero exit code in the default prompt
    set -U fish_color_status $RED
    # The ‘^C’ indicator on a canceled command
    set -U fish_color_cancel $BRIGHT_TEAL
    # History search matches and selected pager items (background only)
    set -U fish_color_search_match --background=$BRIGHT_RED
    # The current position in the history for commands like dirh and cdh
    set -U fish_color_history_current $BRIGHT_GREEN

    # The progress bar at the bottom left corner
    set -U fish_pager_color_progress $BRIGHT_WHITE
    # The background color of a line
    set -U fish_pager_color_background normal
    # The prefix string, i.e. the string that is to be completed
    set -U fish_pager_color_prefix $RED
    # The completion itself, i.e. the proposed rest of the string
    set -U fish_pager_color_completion normal
    # The completion description
    set -U fish_pager_color_description $BRIGHT_BLACK
    # Background of the selected completion
    set -U fish_pager_color_selected_background --background=$MEDIUM_BLACK
    # Prefix of the selected completion
    set -U fish_pager_color_selected_prefix $BRIGHT_WHITE
    # Suffix of the selected completion
    set -U fish_pager_color_selected_completion $BRIGHT_WHITE
    # Description of the selected completion
    set -U fish_pager_color_selected_description $BRIGHT_WHITE
    # Background of every second unselected completion
    set -U fish_pager_color_secondary_background normal
    # Prefix of every second unselected completion
    set -U fish_pager_color_secondary_prefix $RED
    # Suffix of every second unselected completion
    set -U fish_pager_color_secondary_completion normal
    # Description of every second unselected completion
    set -U fish_pager_color_secondary_description $BRIGHT_BLACK

    colors_ayu_dark_tide
end

function colors_ayu_dark_tide
    set -U tide_prompt_color_frame_and_connection $MEDIUM_BLACK
    set -U tide_prompt_color_separator_same_color normal

    set -U tide_left_prompt_diff_color normal
    set -U tide_left_prompt_same_color normal

    set -U tide_right_prompt_diff_color normal
    set -U tide_right_prompt_same_color normal

    # set -U tide_aws_bg_color normal
    # set -U tide_aws_color normal

    set -U tide_character_color $GREEN
    set -U tide_character_color_failure $RED

    set -U tide_cmd_duration_bg_color normal
    set -U tide_cmd_duration_color $BRIGHT_BLACK
    set -U tide_cmd_duration_decimals 1

    set -U tide_context_bg_color normal
    set -U tide_context_color_default $WHITE
    set -U tide_context_color_root $BRIGHT_RED
    set -U tide_context_color_ssh $BRIGHT_TEAL

    # set -U tide_crystal_bg_color normal
    # set -U tide_crystal_color normal

    # set -U tide_distrobox_bg_color normal
    # set -U tide_distrobox_color normal

    set -U tide_direnv_bg_color normal
    set -U tide_direnv_bg_color_denied normal
    set -U tide_direnv_color normal
    set -U tide_direnv_color_denied $RED

    # set -U tide_docker_bg_color normal
    # set -U tide_docker_color normal

    # set -U tide_elixir_bg_color normal
    # set -U tide_elixir_color normal

    set -U tide_git_bg_color normal
    set -U tide_git_bg_color_unstable normal
    set -U tide_git_bg_color_urgent normal
    set -U tide_git_color_branch $WHITE
    set -U tide_git_color_conflicted $RED
    set -U tide_git_color_dirty $BRIGHT_WHITE
    set -U tide_git_color_operation $BRIGHT_BLUE
    set -U tide_git_color_staged $BRIGHT_GREEN
    set -U tide_git_color_stash $BRIGHT_BLACK
    set -U tide_git_color_untracked $BRIGHT_WHITE
    set -U tide_git_color_upstream $BLUE

    # set -U tide_go_bg_color normal
    # set -U tide_go_color normal

    # set -U tide_java_bg_color normal
    # set -U tide_java_color normal

    set -U tide_jobs_bg_color normal
    set -U tide_jobs_color $GREEN

    # set -U tide_kubectl_bg_color normal
    # set -U tide_kubectl_color normal

    # set -U tide_nix_shell_bg_color normal
    # set -U tide_nix_shell_color normal

    # set -U tide_node_bg_color normal
    # set -U tide_node_color normal

    set -U tide_os_bg_color normal
    set -U tide_os_color normal

    # set -U tide_php_bg_color normal
    # set -U tide_php_color normal

    set -U tide_private_mode_bg_color normal
    set -U tide_private_mode_color normal

    # set -U tide_pulumi_bg_color normal
    # set -U tide_pulumi_color normal

    set -U tide_pwd_bg_color normal
    set -U tide_pwd_color_anchors $ORANGE
    set -U tide_pwd_color_dirs $BLUE
    set -U tide_pwd_color_truncated_dirs $BRIGHT_BLUE

    # set -U tide_python_bg_color normal
    # set -U tide_python_color normal

    # set -U tide_ruby_bg_color normal
    # set -U tide_ruby_color normal

    # set -U tide_rustc_bg_color normal
    # set -U tide_rustc_color normal
    # set -U tide_rustc_shlv ff0000

    set -U tide_status_bg_color normal
    set -U tide_status_bg_color_failure normal
    set -U tide_status_color normal
    set -U tide_status_color_failure $RED

    # set -U tide_terraform_bg_color normal
    # set -U tide_terraform_color normal

    set -U tide_time_bg_color normal
    set -U tide_time_color $WHITE

    # set -U tide_toolbox_bg_color normal
    # set -U tide_toolbox_color normal

    set -U tide_vi_mode_bg_color_default normal
    set -U tide_vi_mode_color_default normal
    set -U tide_vi_mode_bg_color_replace normal
    set -U tide_vi_mode_color_replace $RED
    set -U tide_vi_mode_bg_color_visual normal
    set -U tide_vi_mode_color_visual $YELLOW

    # set -U tide_zig_bg_color normal
    # set -U tide_zig_color normal

    set -U tide_guix_shell_bg_color normal
    set -U tide_guix_shell_color "ffcc00"
    set -U tide_guix_shell_icon ""
end
