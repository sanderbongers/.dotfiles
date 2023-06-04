function mkdir --description 'Create and directly move into a directory'
    set -l count (count $argv)
    set -l noun directory

    # Pluralize the noun when the argument contains a slash or when there are multiple arguments
    if string match -q -r -- '\w/.+' $argv[1] || test $count -ne 1
        set noun directories
    end

    # Create the director(y/ies)
    for d in $argv[1..-1]
        mkdir -p $d
        echo "Created $noun: $d"
    end

    # And move into the last one
    cd $argv[-1]
end
