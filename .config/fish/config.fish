# Set up Guix integration
set -x GUIX_PROFILE ~/.guix-profile/
set -a fish_function_path $GUIX_PROFILE/share/fish/functions/
fenv source $GUIX_PROFILE/etc/profile

# Run system profile scripts
if status is-login
    fenv source /etc/profile
    return
end

# Add function paths
set -a fish_function_path ~/.config/fish/functions/user/

if status is-interactive
    # Do not display the startup greeting
    set fish_greeting
else
    # Minimize load times in non-interactive shells
    return
end

# Do not query for unknown commands
function fish_command_not_found --on-event fish_command_not_found
    __fish_default_command_not_found_handler $argv
end

# Configure binds
function fish_custom_key_bindings
    fish_hybrid_key_bindings

    bind --user -M insert \e\cf forward-bigword
    bind --user \e\cf forward-bigword
    bind --user -M insert \e\cb backward-bigword
    bind --user \e\cb backward-bigword
end
set -g fish_key_bindings fish_custom_key_bindings

# Set environment variables
set -gx EDITOR helix
set -gx RUST_SRC_PATH ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
set -gx ANDROID_HOME ~/Android/Sdk
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk/

fish_add_path ~/bin/ \
    ~/.local/bin/ \
    ~/.cargo/bin/ \
    ~/.ghcup/bin/ \
    ~/.gem/ruby/2.7.0/ \
    /usr/lib/jvm/java-17-openjdk/bin/ \
    /opt/clang-format-static/ \
    $ANDROID_HOME/emulator/ \
    $ANDROID_HOME/platform-tools/

# Set aliases/abbreviations
abbr -a shc $EDITOR ~/.config/fish/config.fish
function l; eza --long --group --header --color-scale all $argv; end
# Editors
abbr -a nv nvim
abbr -a k kak
abbr -a h helix
abbr -a e emacsclient -nc -a ""
# Git
abbr -a gs git status
abbr -a gl git log
abbr -a gc git checkout
abbr -a gdh git diff HEAD

# Zoxide
zoxide init fish --cmd f | source
# Use `cd` completions
complete -c __zoxide_z -e
complete -c __zoxide_z -a '(__fish_complete_cd)'

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
