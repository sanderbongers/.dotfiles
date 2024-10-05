function find --description 'Exclude virtual file system duplicates'
    set -l vfs_dir /System/Volumes/Data

    command find $argv -not -path $vfs_dir
end
