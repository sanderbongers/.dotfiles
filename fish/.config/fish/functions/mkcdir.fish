function mkcdir --wraps mkdir --description "Create and directly move into a directory"
    command mkdir -pv $argv
    if test $status = 0
        while string match -- "-*" $argv[-1]
            set --erase argv[-1]
        end
        cd $argv[-1]
        return
    end
end
