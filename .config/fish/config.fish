# Set up Guix integration
set -x GUIX_PROFILE ~/.guix-profile/
set -a fish_function_path $GUIX_PROFILE/share/fish/functions/
fenv source $GUIX_PROFILE/etc/profile
set -gx XDG_DATA_DIRS "$XDG_DATA_DIRS:$GUIX_PROFILE/share/"

# Run system profile scripts
if status is-login
    fenv source /etc/profile
end

# Add function paths
set -a fish_function_path $XDG_CONFIG_HOME/fish/functions/user/

# Do not display the startup greeting
set fish_greeting

# Set environment variables
set -gx EDITOR helix
set -gx RUST_SRC_PATH ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
set -gx ANDROID_HOME ~/Android/Sdk
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk/
set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# Add paths
fish_add_path ~/bin/ \
    $XDG_DATA_HOME/bin/ \
    ~/.cargo/bin/ \
    ~/.ghcup/bin/ \
    ~/.gem/ruby/2.7.0/ \
    /usr/lib/jvm/java-17-openjdk/bin/ \
    /opt/clang-format-static/ \
    $ANDROID_HOME/emulator/ \
    $ANDROID_HOME/platform-tools/

# Start X on first login
if status is-login;
    and status is-interactive;
    and test -z "$DISPLAY";
    and test -n "$XDG_VTNR";
    and test "$XDG_VTNR" = 1;
    exec startx -- -keeptty
end

# Minimize load times in non-interactive shells
if not status is-interactive
    return
end

# Do not query for unknown commands
function fish_command_not_found --on-event fish_command_not_found
    __fish_default_command_not_found_handler $argv
end

# Configure binds
function fish_custom_key_bindings
    fish_hybrid_key_bindings

    # Movement
    bind --user -M insert \e\cf forward-bigword
    bind --user \e\cf forward-bigword
    bind --user -M insert \e\cb backward-bigword
    bind --user \e\cb backward-bigword
    bind --user -M insert \cw backward-kill-bigword
    bind --user -M insert \e\cd kill-bigword

    bind --user \el list_current_token
    bind --user -M insert \el list_current_token

    # fzf.fish binds
    bind --user -M insert \ct _fzf_search_directory
    bind --user -M insert \et _fzf_search_directory
    bind --user -M insert \e\cr _fzf_search_history
    bind --user \e\cr _fzf_search_history
    bind --user -M insert \e\x20 _fzf_search_history
    bind --user \e\x20 _fzf_search_history
end
set -g fish_key_bindings fish_custom_key_bindings

# Set aliases/abbreviations
abbr -a shc $EDITOR ~/.config/fish/config.fish
function l; eza --long --group --header --color-scale all $argv; end
function bh; bat -pl help; end
abbr -a j just
# Editors
abbr -a nv nvim
abbr -a h helix
abbr -a e emacsclient -nc -a "''"
# Git
abbr -a gs git status
abbr -a gl git log
abbr -a gc git checkout
abbr -a gdh git diff HEAD
abbr -a gdhc git diff HEAD --cached
abbr -a gsu git submodule update

# Zoxide
zoxide init fish --cmd f | source
# Use `cd` completions
complete -c __zoxide_z -e
complete -c __zoxide_z -a '(__fish_complete_cd)'

# McFly
set -gx MCFLY_FUZZY 2

# NOTE: See `configure_fish.fish` for one-time configuration

# Fix pointless newline on terminal start/clear (https://github.com/IlanCosman/tide/issues/327)
if status is-interactive
    set first_line true
    function sparse_prompt --on-event fish_prompt
        # Do nothing for the first prompt
        if test "$first_line" = true
          set first_line false
          return
        end

        # Print a newline before other prompts
        echo
    end
end
