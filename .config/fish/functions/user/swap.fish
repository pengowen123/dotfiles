function swap
    argparse -n swap --min-args 2 --max-args 2 -- $argv
    or return

    # Check that all files exist before moving any
    for arg in $argv
        if not test -e $arg
            echo "`$arg` not found"
            return 127
        end
    end

    mv $argv[1] $argv[1]._tmp
    and mv $argv[2] $argv[1]
    and mv $argv[1]._tmp $argv[2]
end
