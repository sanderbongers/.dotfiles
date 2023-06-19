function du
    set -l vfs_dir /System/Volumes/Data

    # Exclude virtual file system duplicates
    command du $argv --exclude $vfs_dir
end
