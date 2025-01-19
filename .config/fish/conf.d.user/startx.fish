# Start X on first login
if status is-login;
    and status is-interactive;
    and test -z "$DISPLAY";
    and test -n "$XDG_VTNR";
    and test "$XDG_VTNR" = 1;
    exec startx -- -keeptty
end
