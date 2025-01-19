function _tide_item_guix_shell --description "Guix shell item for Tide prompts"
    if set -q GUIX_ENVIRONMENT
        _tide_print_item guix_shell $tide_guix_shell_icon' ' 'env'
    end
end
