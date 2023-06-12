function fzf_cd_toggle --description Allows\ toggling\ hidden\ files\ in\ fzf\'s\ alt-c\ command\ by\ abusing\ the\ query\ string\ \{q\}\}
    set -f query_file /tmp/fzf-alt-c-query
    set -f toggle_file /tmp/fzf-alt-c-toggle
    set -f command_a "$FZF_ALT_C_COMMAND"
    set -f command_b "$FZF_ALT_C_COMMAND --hidden"

    switch $argv[1]
        case init
            # Reset state
            rm $toggle_file &>/dev/null
        case pre
            # Temporarily store the query string
            echo $argv[2] >$query_file

            if rm $toggle_file &>/dev/null
                # Toggle state was on
                set -f command $command_a
            else
                # Toggle state was off
                # Turn it on by creating the file
                touch $toggle_file
                set -f command $command_b
            end

            # Return the applicable command
            # This will temporarily override the query string {q} and gets evaluated in the reload action
            echo $command

            # ^ That is the sole purpose of this function: to have a dynamic reload command during fzf's lifetime on a single key binding
            # Unfortunately, abusing the query string is the only way to do it at the moment
        case post
            # Restore the query string
            echo (cat $query_file)
    end
end
