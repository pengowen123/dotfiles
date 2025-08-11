function fsize --description "Gets the size of a file or directory"
    argparse -n fsize --min-args=1 --max-args=1 -- $argv
    or return

    if test -d $argv[1]
        # Use du for directories
        du -sh --block-size 1 $argv[1]
    else
        # Use stat for files
        stat -c '%s' $argv[1]
    end
end
