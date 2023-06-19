function find
    set -l vfs_dir /System/Volumes/Data

    # Exclude virtual file system duplicates
    command find $argv -not -path $vfs_dir
end
