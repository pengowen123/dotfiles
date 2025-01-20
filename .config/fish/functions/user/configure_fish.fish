function configure_fish --description "Run one-time configuration"
    echo 'Configuring fish'

    # Configure the prompt
    tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' \
        --lean_prompt_height='Two lines' --prompt_connection=Solid \
        --prompt_connection_andor_frame_color=Darkest --prompt_spacing=Compact --icons='Few icons' \
        --transient=No

    set -U tide_left_prompt_items pwd git newline private_mode nix_shell guix_shell character
    set -U tide_right_prompt_items status cmd_duration context jobs direnv time

    set -U tide_cmd_duration_decimals 1
    set -U tide_cmd_duration_threshold 3000

    set -U tide_context_hostname_parts 3

    set -U tide_jobs_number_threshold 2

    colors_ayu_dark

    # Symlink extra configs
    symlink_configs $__fish_config_dir/conf.d.user/*
end

function symlink_configs
    for config in $argv
        set symlink_path $__fish_config_dir/conf.d/(basename $config)

        if not test -e $symlink_path;
            or test -L $symlink_path
            echo "Creating symbolic link: `$symlink_path` -> `$config`"
            ln -fs $config $symlink_path
        end
    end
end
