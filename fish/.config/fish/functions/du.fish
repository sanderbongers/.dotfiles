function du --wraps=ncdu
    set -l vfs_dir /System/Volumes/Data

    # Exclude virtual file system duplicates
    ncdu --exclude $vfs_dir $argv
end
